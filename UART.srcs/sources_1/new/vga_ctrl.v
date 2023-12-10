`include "./../imports/new/vga_param.v"

module vga_ctrl (
    input   wire              clk         , //vga clk 640*480 25.2MHz
    input   wire              rst_n       , //��λ�ź�
    input   wire   [11:0]     data_disp   , //

    output  reg    [10:0]     h_addr      , //������Ч��ʾ�����е�ַ
    output  reg    [10:0]     v_addr      , //������Ч��ʾ���򳡵�ַ

    output  reg               vsync       , //
    output  reg               hsync       , //

    output  reg    [3:0]     vga_r       , //RGB��ɫ
    output  reg    [3:0]     vga_g       , //
    output  reg    [3:0]     vga_b       //
    
         //

);

localparam  H_Right_Border=8;//�ұ߿�
localparam H_Front_Porch  =8;//ǰ��
localparam H_Sync_Time    =96;//������ͬ���źŵĿ��
localparam H_Back_Porch   =40;//����
localparam H_Left_Border  = 8;//��������ߵĺ���߿�
localparam H_Data_Time    = 640;//����Чͼ��
localparam H_Total_Time   = 800;//��ɨ������


localparam V_Bottom_Border =8;//�±߿�
localparam V_Front_Porch   =2;//ǰ��
localparam V_Sync_Time     =2;//������ͬ���źŵĸ߶�
localparam V_Back_Porch    =25;//����
localparam V_Top_Border    =8;//�ϱ߿�
localparam V_Data_Time     =480;//����Чͼ����
localparam V_Total_Time    =525;//��ɨ������







//��������
    parameter   H_SYNC_STA = 1 ,//��ͬ����ʼ�ź�
                H_SYNC_STO = `H_Sync_Time ,//��ͬ��ֹͣ
                H_Data_STA = `H_Sync_Time + `H_Back_Porch + `H_Left_Border,//�����ݿ�ʼ
                H_Data_STO = `H_Sync_Time + `H_Back_Porch + `H_Left_Border + `H_Data_Time ,//�����ݿ�ʼ

                V_SYNC_STA = 1 ,
                V_SYNC_STO = `V_Sync_Time ,
                V_Data_STA = `V_Sync_Time + `V_Back_Porch + `V_Top_Border,
                V_Data_STO = `V_Sync_Time + `V_Back_Porch + `V_Top_Border + `V_Data_Time;

    reg     [11:0]     cnt_h_addr  ; //�е�ַ������
    wire                add_h_addr  ;
    wire                end_h_addr  ;

    reg     [11:0]     cnt_v_addr  ; //����ַ������
    wire                add_v_addr  ;
    wire                end_v_addr  ;

//�е�ַ������
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


//����ַ������
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


//�г�ͬ���ź�
//��ͬ���ź�
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

//��ͬ���ź�
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

   

//������Ч��ʾ������
//��
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

//��
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

//��ʾ����
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
