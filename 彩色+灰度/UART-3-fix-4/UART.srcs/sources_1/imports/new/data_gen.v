/**
 * @module data_gen
 * @brief ��������ģ��
 *
 * ��ģ������������ʾ���ݣ������Ҷ�ͼ�Ͳ�ɫͼ�Ķ�ȡ����ʾ���ơ�
 *
 * @param clk ����ʱ���źţ�����ͬ���������ɹ��̡�
 * @param rst_n ���븴λ�źţ����ڸ�λ�������ɹ��̡�
 * @param f_clk ����ʱ���źţ����ڿ���RAM��д������
 * @param h_addr ����������Ч��ʾ�����е�ַ��
 * @param v_addr ����������Ч��ʾ�����е�ַ��
 * @param data_i �������ݡ�
 * @param pixel_r �������ص�R������
 * @param pixel_g �������ص�G������
 * @param pixel_b �������ص�B������
 * @param pi_flag �����źţ�����ѡ��Ҷ�ͼ���ɫͼ��
 * @param data_disp �����ʾ���ݡ�
 *
 * @parameter BLACK ��ɫ����ֵ��
 * @parameter RED ��ɫ����ֵ��
 * @parameter GREEN ��ɫ����ֵ��
 * @parameter BLUE ��ɫ����ֵ��
 * @parameter WHITE ��ɫ����ֵ��
 * @parameter GREY ��ɫ����ֵ��
 * @parameter FIREBRICK4 ��שɫ����ֵ��
 * @parameter height ͼƬ�߶ȡ�
 * @parameter width ͼƬ��ȡ�
 * @parameter TOTAL ͼƬ����������
 * @parameter POS_X �Ҷ�ͼ�����������ꡣ
 * @parameter POS_Y �Ҷ�ͼ������������ꡣ
 * @parameter POS_X1 ��ɫͼ�����������ꡣ
 * @parameter POS_Y1 ��ɫͼ������������ꡣ
 */
module data_gen (
    input   wire              clk         , //vga clk 640*480 25.2MHz
    input   wire              rst_n       , //��λ�ź�

    input wire                f_clk       ,//100MHZʱ��

    input   wire   [10:0]     h_addr      , //������Ч��ʾ�����е�ַ
    input   wire   [10:0]     v_addr      , //������Ч��ʾ�����е�ַ
    
    input [7:0] data_i,

    input  [7:0]               pixel_r     , //���ص�R����
    input  [7:0]             pixel_g     , //���ص�G����
    input  [7:0]              pixel_b     , //���ص�B����

    input pi_flag,


    output  reg    [11:0]     data_disp     //

);

//��������
parameter
    BLACK   = 12'h000,
    RED     = 12'hF00,
    GREEN   = 12'h0F0,
    BLUE    = 12'h00F,
    WHITE   = 12'hFFF,
    GREY    = 12'h888,
    FIREBRICK4 =12'h922;

parameter height =256;//ͼƬ�߶�
parameter width = 256;//ͼƬ���

//ͼƬ��С
parameter TOTAL = 256*256;
//�Ҷ�ͼ�����������
parameter POS_X = 48;
parameter POS_Y = (480-256)/2;
//��ɫͼ�����������
parameter POS_X1 = 48+256+32;
parameter POS_Y1 = (480-256)/2;


reg [15:0] addra;
reg [15:0] ram_addr;//�Ҷ�ͼ����ַ
reg [15:0] ram1_addr;//��ɫͼ����ַ
//��ȡ�Ҷ�ͼ
wire  ram_rd_en;

//��ȡ��ɫͼ
wire  ram1_rd_en;

//����RAMд��ַ
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

//��ǰ���ص�����λ��ͼ����ʾ������ʱ����RAMʹ���ź�����
assign ram_rd_en = (h_addr >= POS_X) && (h_addr < POS_X + 256)&& (v_addr >= POS_Y) && (v_addr < POS_Y + 256)? 1'b1 : 1'b0;
assign ram1_rd_en = (h_addr >= POS_X1) && (h_addr < POS_X1 + 256)&& (v_addr >= POS_Y1) && (v_addr < POS_Y1 + 256)? 1'b1 : 1'b0;

//���ƻҶ�ͼ����ַ
always @(posedge clk or negedge rst_n) begin         
    if (!rst_n) begin
        ram_addr   <= 16'd0;
        
    end
    else if(ram_rd_en) begin
        if(ram_addr < TOTAL - 1'b1)
        begin 
            ram_addr <= ram_addr + 1'b1;    //ÿ�ζ�ROM�����󣬶���ַ��1
        end
        else
        begin
            ram_addr <= 1'b0;               //����ROMĩ��ַ�󣬴��׵�ַ���¿�ʼ������
        end
    end
    else
    begin
        ram_addr <= ram_addr;
    end
end

//���Ʋ�ɫͼ����ַ
always @(posedge clk or negedge rst_n) begin         
    if (!rst_n) begin
        ram1_addr   <= 16'd0;
        
    end
    else if(ram1_rd_en) begin
        if(ram1_addr < TOTAL - 1'b1)
        begin 
            ram1_addr <= ram1_addr + 1'b1;    //ÿ�ζ�ROM�����󣬶���ַ��1
        end
        else
        begin
            ram1_addr <= 1'b0;               //����ROMĩ��ַ�󣬴��׵�ַ���¿�ʼ������
        end
    end
    else
    begin
        ram1_addr <= ram1_addr;
    end
end


//������ʾ����
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

//��RGB888�����ϲ�Ϊ12λ��ɫ����
assign pixel_rgb12 = {pixel_r[7:4],pixel_g[7:4],pixel_b[7:4]};



//�Ҷ�ͼ��
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

//��ɫͼ��
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

