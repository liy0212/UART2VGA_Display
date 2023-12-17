module uart_rx
#(
    parameter DATA_WIDTH = 8,       //��Ч����λ��ȱʡΪ8λ
    parameter PARITY_ON = 0        //У��λ��1Ϊ��У��λ��0Ϊ��У��λ��ȱʡΪ0
)
(
    input                           i_clk_sys,      //ϵͳʱ��
    input                           i_rst_n,        //ȫ���첽��λ,�͵�ƽ��Ч
    input                           i_uart_rx,      //UART����
    input  [7:0]                   cycle_baud,     //�����ʼ�������
    input                           parity_type,
    output [7 :0]               o_dout_r,    //UART��������
    output [7 :0]               o_dout_g,    //UART��������
    output [7 :0]               o_dout_b,    //UART��������

    output reg                      o_ld_parity,    //У��λ����LED���ߵ�ƽλΪУ����ȷ
    output reg                      dout_vld       //1�������ݽ�����ɱ�־
    );
    
    /*
    ͬ��������UART�����ź�ͬ����ϵͳʱ����
    */
    reg sync_uart_rx;
    always@(posedge i_clk_sys or negedge i_rst_n)
        begin
            if(!i_rst_n)
                sync_uart_rx <= 1'b1;
            else
                sync_uart_rx <= i_uart_rx;
        end
    
    /*
    5λ�Ĵ��������ڼ������5�����ڵ�UART�����ź�Ϊ�͵�ƽ����ΪUART��ʼ��������
    */
    reg [4:0] r_flag_rcv_start;
    wire w_rcv_start;
    always@(posedge i_clk_sys or negedge i_rst_n)
        begin
            if(!i_rst_n)
                r_flag_rcv_start <= 5'b11111;
            else
                r_flag_rcv_start <= {r_flag_rcv_start[3:0], sync_uart_rx};
        end
    
    
    //״̬������
    reg [2:0] r_current_state;  //��ǰ״̬
    reg [2:0] r_next_state;     //��̬
        
    localparam STATE_IDLE = 3'b000;         //����״̬
    localparam STATE_START = 3'b001;        //��ʼ״̬
    localparam STATE_DATA = 3'b011;         //���ݽ���״̬
    localparam STATE_PARITY = 3'b100;       //����У��״̬
    localparam STATE_END = 3'b101;          //����״̬
    
        

    reg baud_valid;                         //���ؼ�����Чλ
    reg [7:0] baud_cnt;                    //�����ʼ����� 
    reg baud_pulse;                         //�����ʲ�������
    
    reg [3:0]   r_rcv_cnt;      //��������λ����
    
    //�����ʼ�����
    always@(posedge i_clk_sys or negedge i_rst_n)
        begin
            if(!i_rst_n)
                baud_cnt <= 8'h00;
            else if(!baud_valid)
                baud_cnt <= 8'h00;
            else if(baud_cnt == cycle_baud - 1)
                baud_cnt <= 8'h00;
            else
                baud_cnt <= baud_cnt + 1'b1;
        end
        
    //���ز�������
    always@(posedge i_clk_sys or negedge i_rst_n)
        begin
            if(!i_rst_n)
                baud_pulse <= 1'b0;
            else if(baud_cnt == cycle_baud/2-1)
                baud_pulse <= 1'b1;
            else
                baud_pulse <= 1'b0;
        end
    
    //״̬��״̬�仯����
    always@(posedge i_clk_sys or negedge i_rst_n)
        begin
            if(!i_rst_n)
                r_current_state <= STATE_IDLE;
            else if(!baud_valid)
                r_current_state <= STATE_IDLE;
            else if(baud_valid && baud_cnt == 8'h00)
                r_current_state <= r_next_state;
        end
    
    //״̬����̬����
    always@(*)
        begin
            case(r_current_state)
                STATE_IDLE:     r_next_state <= STATE_START;
                STATE_START:    r_next_state <= STATE_DATA;
                STATE_DATA:
                    if(r_rcv_cnt == DATA_WIDTH)
                        begin
                            if(PARITY_ON == 0)
                                r_next_state <= STATE_END;
                            else
                                r_next_state <= STATE_PARITY;       //У��λ����ʱ����У��״̬
                        end
                    else
                        begin
                                r_next_state <= STATE_DATA;
                        end
                STATE_PARITY:   r_next_state <= STATE_END;
                STATE_END:      r_next_state <= STATE_IDLE;
                default:;
            endcase
        end
    
    
    reg[7:0] r_data_rcv;
    reg r_parity_check;
    
    //״̬������߼�
    always@(posedge i_clk_sys or negedge i_rst_n)
        begin
            if(!i_rst_n)
                begin
                    baud_valid <= 1'b0;
                    r_data_rcv <= 'd0;
                    r_rcv_cnt <= 4'd0;
                    r_parity_check <= 1'b0;
                    o_uart_data <= 'd0;
                    o_ld_parity <= 1'b0;
                    o_rx_done <= 1'b0;
                end
            else
                case(r_current_state)
                    STATE_IDLE:begin
                            //����״̬�¶ԼĴ������и�λ
                            r_rcv_cnt <= 4'd0;
                            r_data_rcv <= 'd0;
                            r_parity_check <= 1'b0;
                            o_rx_done <= 1'b0;
                            //��⵽����5�����ڵĵ͵�ƽ����ΪUART��ʼ�������ݣ����뿪ʼ״̬
                            if(r_flag_rcv_start == 5'b00000)
                                baud_valid <= 1'b1;
                        end
                    STATE_START:begin
                            if(baud_pulse && sync_uart_rx)     
                                baud_valid <= 1'b0;
                        end
                    STATE_DATA:begin
                            if(baud_pulse)
                                begin
                                    
                                    r_data_rcv <= {sync_uart_rx, r_data_rcv[DATA_WIDTH-1 : 1]}; //������λ�洢
                                    r_rcv_cnt <= r_rcv_cnt + 1'b1;                          //����λ����
                                    r_parity_check <= r_parity_check + sync_uart_rx;        //У��λ����
                                end
                        end
                    STATE_PARITY:begin
                            if(baud_pulse)
                                begin
                                //У��λ����
                                    if(r_parity_check + sync_uart_rx == parity_type)
                                        o_ld_parity <= 1'b1;
                                    else
                                        o_ld_parity <= 1'b0;
                                end
                            else
                                        o_ld_parity <= o_ld_parity;
                        end
                    STATE_END:begin
                            if(baud_pulse)
                                begin
                                    if(PARITY_ON == 0 || o_ld_parity)
                                        begin
                                            o_uart_data <= r_data_rcv;
                                            
                                            o_rx_done <= 1'b1;
                                        end
                                end
                            else
                                begin
                                    o_rx_done <= 1'b0;
                                end
                            
                            if(baud_cnt == 8'h00)
                                    baud_valid <= 1'b0;
                        end
                    default:;
                endcase
        end
    
    reg [2:0]     byte_cnt;
    reg[7 :0]     o_uart_data;    //UART��������1bit
    reg           o_rx_done;       //UART���ݽ�����ɱ�־
    reg [15:0]   dout;           //UART��������
    wire add_byte_cnt;
    wire end_byte_cnt;

    

    always @(posedge i_clk_sys or negedge i_rst_n) begin
    if(!i_rst_n)
        byte_cnt <= 'd0;
    else if(add_byte_cnt) begin
        if(end_byte_cnt)
            byte_cnt <= 0;
        else
            byte_cnt <= byte_cnt + 1'b1;
    end
    end

    assign add_byte_cnt = o_rx_done;
    assign end_byte_cnt = add_byte_cnt && byte_cnt== 2-1;

    always @(posedge i_clk_sys or negedge i_rst_n) begin
        if(!i_rst_n)
            dout <= 0;
        else if(add_byte_cnt)
        begin
            
            dout <= {dout[7:0],o_uart_data};
            
        end
    end

    always @(posedge i_clk_sys or negedge i_rst_n) begin
        if(!i_rst_n)
            dout_vld <= 1'b0;
        else if (end_byte_cnt)
        begin    
            dout_vld <= 1'b1;
        end
        else
            dout_vld <= 1'b0;
    end

    assign o_dout_r = {dout[15:11],dout[13:11]};//rgb565
    assign o_dout_g = {dout[10:5],dout[6:5]};
    assign o_dout_b = {dout[4:0],dout[2:0]};
endmodule


