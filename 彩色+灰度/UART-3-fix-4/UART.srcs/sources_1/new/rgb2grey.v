`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/12 13:16:26
// Design Name: 
// Module Name: rgb2grey
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rgb2gray(
    input clk,
    input rst_n,
    
    input iValid,
    input [7:0] red,
    input [7:0] green,
    input [7:0] blue,

    output oValid,
    output [7:0] gray
);

// 第一级乘法寄存器
reg [15:0] red_r;
reg [15:0] green_r;
reg [15:0] blue_r;

always @(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
        red_r   <= 0;
        green_r <= 0;
        blue_r  <= 0;
    end else begin
        red_r   <= red * 8'd77;
        green_r <= green * 8'd150;
        blue_r  <= blue * 8'd29;
    end
end

// 第二级加法寄存器
reg [15:0] gray_r1;

always @(posedge clk, negedge rst_n) begin
    if(!rst_n)
        gray_r1 <= 0;
    else
        gray_r1 <= red_r + green_r + blue_r;
end

// 第三级移位寄存器
reg [7:0] gray_r2;

always @(posedge clk, negedge rst_n) begin
    if(!rst_n)
        gray_r2 <= 0;
    else
        gray_r2 <= gray_r1[15:8];
end

assign gray = gray_r2;

// valid打三拍
reg [2:0] valid_shift;

always @(posedge clk, negedge rst_n) begin
    if(!rst_n)
        valid_shift <= 0;
    else
        valid_shift <= {valid_shift[1:0], iValid};
end

assign oValid = valid_shift[2];


endmodule