/**
 * @module data_gen
 * @brief 数据生成模块
 *
 * 该模块用于生成显示数据，包括灰度图和彩色图的读取和显示控制。
 *
 * @param clk 输入时钟信号，用于同步数据生成过程。
 * @param rst_n 输入复位信号，用于复位数据生成过程。
 * @param f_clk 输入时钟信号，用于控制RAM读写操作。
 * @param h_addr 输入数据有效显示区域行地址。
 * @param v_addr 输入数据有效显示区域列地址。
 * @param data_i 输入数据。
 * @param pixel_r 输入像素点R分量。
 * @param pixel_g 输入像素点G分量。
 * @param pixel_b 输入像素点B分量。
 * @param pi_flag 输入信号，用于选择灰度图或彩色图。
 * @param data_disp 输出显示数据。
 *
 * @parameter BLACK 黑色像素值。
 * @parameter RED 红色像素值。
 * @parameter GREEN 绿色像素值。
 * @parameter BLUE 蓝色像素值。
 * @parameter WHITE 白色像素值。
 * @parameter GREY 灰色像素值。
 * @parameter FIREBRICK4 火砖色像素值。
 * @parameter height 图片高度。
 * @parameter width 图片宽度。
 * @parameter TOTAL 图片总像素数。
 * @parameter POS_X 灰度图放置起点横坐标。
 * @parameter POS_Y 灰度图放置起点纵坐标。
 * @parameter POS_X1 彩色图放置起点横坐标。
 * @parameter POS_Y1 彩色图放置起点纵坐标。
 */
module data_gen (
    input   wire              clk         , //vga clk 640*480 25.2MHz
    input   wire              rst_n       , //复位信号

    input wire                f_clk       ,//100MHZ时钟

    input   wire   [10:0]     h_addr      , //数据有效显示区域行地址
    input   wire   [10:0]     v_addr      , //数据有效显示区域列地址
    
    input [7:0] data_i,

    input  [7:0]               pixel_r     , //像素点R分量
    input  [7:0]             pixel_g     , //像素点G分量
    input  [7:0]              pixel_b     , //像素点B分量

    input pi_flag,


    output  reg    [11:0]     data_disp     //

);

//参数定义
parameter
    BLACK   = 12'h000,
    RED     = 12'hF00,
    GREEN   = 12'h0F0,
    BLUE    = 12'h00F,
    WHITE   = 12'hFFF,
    GREY    = 12'h888,
    FIREBRICK4 =12'h922;

parameter height =256;//图片高度
parameter width = 256;//图片宽度

//图片大小
parameter TOTAL = 256*256;
//灰度图放置起点坐标
parameter POS_X = 48;
parameter POS_Y = (480-256)/2;
//彩色图放置起点坐标
parameter POS_X1 = 48+256+32;
parameter POS_Y1 = (480-256)/2;


reg [15:0] addra;
reg [15:0] ram_addr;//灰度图读地址
reg [15:0] ram1_addr;//彩色图读地址
//读取灰度图
wire  ram_rd_en;

//读取彩色图
wire  ram1_rd_en;

//产生RAM写地址
always @(posedge f_clk or negedge rst_n) begin
	if (rst_n == 1'b0) begin
		// reset
		addra <= 'd0;
	end
	else if (pi_flag == 1'b1 && addra == 'd65535) begin
		addra <= 'd0;
	end
	else if (pi_flag == 1'b1) begin
		addra <= addra + 1'b1;        
	end
end

//当前像素点坐标位于图案显示区域内时，读RAM使能信号拉高
assign ram_rd_en = (h_addr >= POS_X) && (h_addr < POS_X + 256)&& (v_addr >= POS_Y) && (v_addr < POS_Y + 256)? 1'b1 : 1'b0;
assign ram1_rd_en = (h_addr >= POS_X1) && (h_addr < POS_X1 + 256)&& (v_addr >= POS_Y1) && (v_addr < POS_Y1 + 256)? 1'b1 : 1'b0;

//控制灰度图读地址
always @(posedge clk or negedge rst_n) begin         
    if (!rst_n) begin
        ram_addr   <= 16'd0;
        
    end
    else if(ram_rd_en) begin
        if(ram_addr < TOTAL - 1'b1)
        begin 
            ram_addr <= ram_addr + 1'b1;    //每次读ROM操作后，读地址加1
        end
        else
        begin
            ram_addr <= 1'b0;               //读到ROM末地址后，从首地址重新开始读操作
        end
    end
    else
    begin
        ram_addr <= ram_addr;
    end
end

//控制彩色图读地址
always @(posedge clk or negedge rst_n) begin         
    if (!rst_n) begin
        ram1_addr   <= 16'd0;
        
    end
    else if(ram1_rd_en) begin
        if(ram1_addr < TOTAL - 1'b1)
        begin 
            ram1_addr <= ram1_addr + 1'b1;    //每次读ROM操作后，读地址加1
        end
        else
        begin
            ram1_addr <= 1'b0;               //读到ROM末地址后，从首地址重新开始读操作
        end
    end
    else
    begin
        ram1_addr <= ram1_addr;
    end
end


//控制显示数据
wire [7:0] data_disp_w;
reg [7:0]data_disp_r;

always @(posedge clk)       data_disp_r<=data_disp_w;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        data_disp<=12'b0;
    end
    else if(ram_rd_en) 
    begin
        data_disp<={data_disp_r[7:4],data_disp_r[7:4],data_disp_r[7:4]};
    end
    else if(ram1_rd_en)
    begin
        data_disp<=pixel_data;
    end
    else begin
        data_disp<=GREY;
    end
end


wire [11:0] pixel_data;
wire [11:0] pixel_rgb12;

//将RGB888分量合并为12位彩色数据
assign pixel_rgb12 = {pixel_r[7:4],pixel_g[7:4],pixel_b[7:4]};



//灰度图像
blk_mem_gen_0 ram_0 (
  .clka(f_clk),    // input wire clka
  .wea(pi_flag),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [7 : 0] addra
  .ena(1'b1),      // input wire ena
  .dina(data_i),    // input wire [7 : 0] dina
  .clkb(clk),    // input wire clkb
  .enb(!pi_flag),      // input wire enb
  .addrb(ram_addr),  // input wire [7 : 0] addrb
  .doutb(data_disp_w)  // output wire [7 : 0] doutb
);

//彩色图像
blk_mem_gen_1 ram_1 (
  .clka(f_clk),    // input wire clka
  .ena(pi_flag),      // input wire ena
  .wea(1'b1),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [15 : 0] addra
  .dina(pixel_rgb12),    // input wire [11 : 0] dina
  .clkb(clk),    // input wire clkb
  .enb(!pi_flag),      // input wire enb
  .addrb(ram1_addr),  // input wire [15 : 0] addrb
  .doutb(pixel_data)  // output wire [11 : 0] doutb
);


endmodule

