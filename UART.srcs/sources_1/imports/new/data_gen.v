module data_gen (
    input   wire              clk         , //vga clk 640*480 25.2MHz
    input   wire              rst_n       , //复位信号

    input wire                f_clk       ,//100MHZ时钟

    input   wire   [10:0]     h_addr      , //数据有效显示区域行地址
    input   wire   [10:0]     v_addr      , //数据有效显示区域列地址

    //input  wire  disp_c,//彩条方向控制
    
    input [15:0] data_i,

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

parameter TOTAL = 256*256;
parameter POS_X = (640-256)/2;
parameter POS_Y = (480-256)/2;



reg [15:0] addra;
reg [15:0] ram_addr;
wire  ram_rd_en;



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

//控制读地址
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



wire [15:0] data_disp_w;
reg [15:0]data_disp_r;

always @(posedge clk)       data_disp_r<=data_disp_w;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        data_disp<=12'b0;
    end
    else if(ram_rd_en) 
    begin
        data_disp<={data_disp_r[15:12],data_disp_r[10:7],data_disp_r[4:1]};
    end
    else begin
        data_disp<=GREY;
    end
end



/*always @( posedge clk or negedge rst_n) begin
   if(!rst_n)begin
        data_disp = BLACK;
    end
    else if ( flag_en_out && disp_c) begin
        data_disp = rom_data0;
    end
    else if ( flag_en_out && !disp_c) begin
        data_disp = rom_data1;
    end
    else begin
        data_disp = FIREBRICK4;
    end
    end
*/
    //ROM地址计数器
//    always @( posedge clk or negedge rst_n ) begin
//        if ( !rst_n ) begin
//            rom_addr <= 0;
//        end
//        else if ( flag_clr_addr ) begin //计数满清零
//            rom_addr <= 0;
//       end
//           else if ( flag_en_out ) begin  //在有效区域内+1
//          rom_addr <= rom_addr + 1;
//          end
//      else begin  //无效区域保持
//          rom_addr <= rom_addr;
//      end
//  end
//    assign flag_clr_addr = rom_addr == height * width - 1;
//    assign flag_begin_h     = h_addr > ( ( 640 - width ) / 2 ) && h_addr < ( ( 640 - width ) / 2 ) + width + 1;
//    assign flag_begin_v     = v_addr > ( ( 480 - height )/2 ) && v_addr <( ( 480 - height )/2 ) + height + 1;
//    assign flag_en_out = flag_begin_h && flag_begin_v;

blk_mem_gen_0 ram_0 (
  .clka(f_clk),    // input wire clka
  .wea(pi_flag),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [15 : 0] addra
  .ena(1'b1),      // input wire ena
  .dina(data_i),    // input wire [15 : 0] dina
  .clkb(clk),    // input wire clkb
  .enb(!pi_flag),      // input wire enb
  .addrb(ram_addr),  // input wire [15 : 0] addrb
  .doutb(data_disp_w)  // output wire [7 : 0] doutb
);




endmodule

