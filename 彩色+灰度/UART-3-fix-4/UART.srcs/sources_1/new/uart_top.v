/*
    ǰ�ڻػ����������ģ����Ժ���
*/
module uart_top(
    input i_clk_sys,
    input i_rst_n,
    input i_uart_rx,
    input baud_speed,
    input parity_type,
    input data_width_s,
    output o_uart_tx,
    output o_ld_parity,
    output parity_type_status,
    output data_width_status
    );
    
    localparam DATA_WIDTH = 8;
    
    localparam PARITY_ON = 1;
    //localparam PARITY_TYPE = 0;
    
    wire w_rx_done;
    wire[7 : 0] w_data;
    
    wire [15:0] cycle_baud;
    
    uart_rx 
    #(
            .DATA_WIDTH(DATA_WIDTH),       //��Ч����λ��ȱʡΪ8λ
            .PARITY_ON(PARITY_ON)        //У��λ��1Ϊ��У��λ��0Ϊ��У��λ��ȱʡΪ0
            //.PARITY_TYPE(PARITY_TYPE)      //У�����ͣ�1Ϊ��У�飬0ΪżУ�飬ȱʡΪżУ��
            
    ) u_uart_rx
    (
        .i_clk_sys(i_clk_sys),      //ϵͳʱ��
        .i_rst_n(i_rst_n),        //ȫ���첽��λ,�͵�ƽ��Ч
        .i_uart_rx(i_uart_rx),      //UART����
        .o_uart_data(w_data),    //UART��������
        .o_ld_parity(o_ld_parity),    //У��λ����LED���ߵ�ƽλΪУ����ȷ
        .o_rx_done(w_rx_done),       //UART���ݽ�����ɱ��?
        .parity_type(parity_type),
        .data_width_s(data_width_s),
        .cycle_baud(cycle_baud)
    );
    
    uart_tx
    #(
        .DATA_WIDTH(DATA_WIDTH),       //��Ч����λ��ȱʡΪ8λ
        .PARITY_ON(PARITY_ON)        //У��λ��1Ϊ��У��λ��0Ϊ��У��λ��ȱʡΪ0
        //.PARITY_TYPE(PARITY_TYPE)      //У�����ͣ�1Ϊ��У�飬0ΪżУ�飬ȱʡΪżУ��
    ) u_uart_tx
    (   .i_clk_sys(i_clk_sys),      //ϵͳʱ��
        .i_rst_n(i_rst_n),        //ȫ���첽��λ
        .i_data_tx(w_data),      //������������
        .i_data_valid(w_rx_done),   //����������Ч
        .o_uart_tx(o_uart_tx),       //UART���?
        .parity_type(parity_type),
        .data_width_s(data_width_s),
        .cycle_baud(cycle_baud)
        );
    
    speed_select u_speed_select
    (
        .clk(i_clk_sys),
        .rst_n(i_rst_n),
        .speed_se(baud_speed),
        .parity_type(parity_type),
        .data_width_s(data_width_s),
        .data_width(data_width),
        .parity_type_status(parity_type_status),
        .data_width_status(data_width_status),
        .cycle_baud(cycle_baud)
    );


endmodule
