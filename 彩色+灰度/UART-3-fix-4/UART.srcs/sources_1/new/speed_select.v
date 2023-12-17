module speed_select(
    input clk,//100mhz
    input rst_n,
    input speed_se,
    input parity_type,//0:偶校验 1:奇校验
    input i_tx_send_vaild,
    input slow_clk,//10MHZ
    output reg [7:0] cycle_baud,
    output reg parity_type_status,
    output reg o_tx_send_vaild
    );


reg [63:0]tx_send_vaild_cnt;//缓存64个周期的tx_send_vaild
reg [1:0]tx_send_vaild_pulse;//缓存2个周期的tx_send_vaild脉冲信号

always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            cycle_baud <= 8'hD9;
        else if(speed_se == 1'b0)
            cycle_baud <=8'hD9;
        else 
            cycle_baud <= 8'h40;
    end


//校验位状态灯
always @(posedge clk or negedge rst_n) begin

    if(!rst_n)
        parity_type_status <= 1'b0;
    else if(parity_type == 1'b0)
        parity_type_status <= 1'b0;
    else 
        parity_type_status <= 1'b1;
    
end

//缓存64个周期的tx_send_vaild
always @(posedge slow_clk or negedge rst_n) begin
    if(!rst_n)
        tx_send_vaild_cnt <= 'b0; 
    else 
        tx_send_vaild_cnt <= {tx_send_vaild_cnt[62:0],i_tx_send_vaild};
end


always @(posedge slow_clk or negedge rst_n) begin
    if(!rst_n)
        tx_send_vaild_pulse <= 2'b0;
    else if(tx_send_vaild_cnt[63:0] == 'hFFFFFFFF)
        tx_send_vaild_pulse <= {tx_send_vaild_pulse[0],1'b1};
    else 
        tx_send_vaild_pulse <= {tx_send_vaild_pulse[0],1'b0};
end

//将o_tx_send_vaild转成脉冲信号

always @(posedge slow_clk or negedge rst_n) begin
    if(!rst_n)
        o_tx_send_vaild <= 1'b0;
    else if((tx_send_vaild_pulse[1:0]==2'b01))
        o_tx_send_vaild <= 1'b1;
    else 
        o_tx_send_vaild <= 1'b0;
end


endmodule
