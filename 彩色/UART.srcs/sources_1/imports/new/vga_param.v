`define vga_640_480



`ifdef  vga_640_480
    //执行操作A
    `define H_Right_Border  8//右边框
    `define H_Front_Porch   8//前沿
    `define H_Sync_Time     96//这里是同步信号的宽度
    `define H_Back_Porch    40//后沿
    `define H_Left_Border   8//这里是左边的黑左边框
    `define H_Data_Time     640//行有效图像
    `define H_Total_Time    800//行扫描周期

    
    `define V_Bottom_Border  8//下边框
    `define V_Front_Porch    2//前沿
    `define V_Sync_Time      2//这里是同步信号的高度
    `define V_Back_Porch     25//后沿
    `define V_Top_Border     8//上边框
    `define V_Data_Time      480//列有效图像宽度
    `define V_Total_Time     525//列扫描周期


`endif 
