# UART2VGA_Display
基于Xilinx Artix-7,在basys3开发板上实现的串口传图功能

通过串口助手输入二进制的图片(请先转成vga565格式)，vga输出图片,同时输出彩色图和灰度图

basys3开发板上面的VGA输出是12bit的，图像显示效果不太好

图片的大小工程里设置是256*256，有需要可以自己修改

串口波特率（两档可选460800和1562500）

默认开启偶校验位，（校验位奇偶可调）

还附赠了一个串口发送模块，设定成了按下开发板按键会给上位机发送‘1’的ascii码，不需要这个功能可删去。

