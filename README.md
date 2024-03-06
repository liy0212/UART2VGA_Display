# UART2VGA_Display
基于Xilinx Artix-7,在basys3开发板上实现的串口传图功能

通过串口助手输入二进制的图片(请先转成vga565格式)，vga输出图片,同时输出彩色图和灰度图

提供两个版本的工程文件，彩色+灰度和仅彩色图输出。

basys3开发板上面的VGA输出是12bit的，图像显示效果不太好

图片的大小工程里设置是256*256，有需要可以自己修改,不过basys3上的BRAM有限，在不外接RAM情况下，难以放太大分辨率的图片，目前已经占用60%的RAM资源

串口波特率（两档可选460800和1562500）

默认开启偶校验位，（校验位奇偶可调）

还附赠了一个串口发送模块，设定成了按下开发板按键会给上位机发送‘1’的ascii码，不需要这个功能可删去。(此为课设要求)

效果图展示：

![image](https://github.com/liy0212/UART2VGA_Display/assets/99011995/bb263ac0-2e72-41fe-9d9f-26cc2fd17359)
