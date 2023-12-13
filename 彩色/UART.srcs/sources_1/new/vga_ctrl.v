`include "./../imports/new/vga_param.v"

module vga_ctrl (
    input   wire              clk         , //vga clk 640*480 25.2MHz
    input   wire              rst_n       , //复位信号
    input   wire   [11:0]     data_disp   , //

    output  reg    [10:0]     h_addr      , //数据有效显示区域行地址
    output  reg    [10:0]     v_addr      , //数据有效显示区域场地址

    output  reg               vsync       , //
    output  reg               hsync       , //

    output  reg    [3:0]     vga_r       , //RGB三色
    output  reg    [3:0]     vga_g       , //
    output  reg    [3:0]     vga_b       //
    
         //

);

localparam  H_Right_Border=8;//右边框
localparam H_Front_Porch  =8;//前沿
localparam H_Sync_Time    =96;//这里是同步信号的宽度
localparam H_Back_Porch   =40;//后沿
localparam H_Left_Border  = 8;//这里是左边的黑左边框
localparam H_Data_Time    = 640;//行有效图像
localparam H_Total_Time   = 800;//行扫描周期


localparam V_Bottom_Border =8;//下边框
localparam V_Front_Porch   =2;//前沿
localparam V_Sync_Time     =2;//这里是同步信号的高度
localparam V_Back_Porch    =25;//后沿
localparam V_Top_Border    =8;//上边框
localparam V_Data_Time     =480;//列有效图像宽度
localparam V_Total_Time    =525;//列扫描周期







//参数定义
    parameter   H_SYNC_STA = 1 ,//行同步开始信号
                H_SYNC_STO = `H_Sync_Time ,//行同步停止
                H_Data_STA = `H_Sync_Time + `H_Back_Porch + `H_Left_Border,//行数据开始
                H_Data_STO = `H_Sync_Time + `H_Back_Porch + `H_Left_Border + `H_Data_Time ,//行数据开始

                V_SYNC_STA = 1 ,
                V_SYNC_STO = `V_Sync_Time ,
                V_Data_STA = `V_Sync_Time + `V_Back_Porch + `V_Top_Border,
                V_Data_STO = `V_Sync_Time + `V_Back_Porch + `V_Top_Border + `V_Data_Time;

    reg     [11:0]     cnt_h_addr  ; //行地址计数器
    wire                add_h_addr  ;
    wire                end_h_addr  ;

    reg     [11:0]     cnt_v_addr  ; //场地址计数器
    wire                add_v_addr  ;
    wire                end_v_addr  ;

//行地址计数器
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            cnt_h_addr <= 12'd0;
        end
        else if (add_h_addr) begin
            if (end_h_addr) begin
                cnt_h_addr <= 12'd0;
            end
            else begin
                cnt_h_addr <= cnt_h_addr + 12'd1;
            end
        end
        else begin
            cnt_h_addr <= cnt_h_addr;
        end
    end

    assign   add_h_addr = 1'b1;
    assign   end_h_addr = add_h_addr && cnt_h_addr >= `H_Total_Time - 1;


//场地址计数器
   always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            cnt_v_addr <= 12'd0;
        end
        else if (add_v_addr) begin
            if (end_v_addr) begin
                cnt_v_addr <= 12'd0;
            end
            else begin
                cnt_v_addr <= cnt_v_addr + 12'd1;
            end
        end
        else begin
            cnt_v_addr <= cnt_v_addr;
        end
    end

    assign   add_v_addr =  end_h_addr;
    assign   end_v_addr = add_v_addr && cnt_v_addr >= `V_Total_Time - 1;


//行场同步信号
//行同步信号
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            hsync <= 1'b1;
        end
        else if (cnt_h_addr == H_SYNC_STA ) begin
            hsync <= 1'b0;
        end
        else if (cnt_h_addr == H_SYNC_STO )begin
            hsync <= 1'b1;
        end
        else begin
            hsync <= hsync;
        end
    end

//场同步信号
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            vsync <= 1'b1;
        end
        else if (cnt_v_addr == V_SYNC_STA ) begin
            vsync <= 1'b0;
        end
        else if (cnt_v_addr == V_SYNC_STO )begin
            vsync <= 1'b1;
        end
        else begin
            vsync <= vsync;
        end
    end

   

//数据有效显示区域定义
//行
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            h_addr <= 11'd0;
        end
        else if ((cnt_h_addr >= H_Data_STA) && (cnt_h_addr <= H_Data_STO)) begin
            h_addr <= cnt_h_addr - H_Data_STA;
        end
        else begin
            h_addr <= 11'd0;
        end
    end

//场
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            v_addr <= 11'd0;
        end
        else if ((cnt_v_addr >= V_Data_STA) && (cnt_v_addr <= V_Data_STO)) begin
            v_addr <= cnt_v_addr - V_Data_STA;
        end
        else begin
            v_addr <= 11'd0;
        end
    end

//显示数据
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            vga_r <= 4'd0;
            vga_g <= 4'd0;
            vga_b <= 4'd0;
           
        end
        else if ((cnt_h_addr >= H_Data_STA -1) && (cnt_h_addr <= H_Data_STO - 1)
                    && (cnt_v_addr >= V_Data_STA -1 ) && (cnt_v_addr <= V_Data_STO -1)) begin
            vga_r = data_disp[11:8];
            vga_g = data_disp[7:4];
            vga_b = data_disp[3:0];
           
        end
        else begin
            vga_r <= 4'd0;
            vga_g <= 4'd0;
            vga_b <= 4'd0;
            
        end
    end
endmodule
