`define vga_640_480



`ifdef  vga_640_480
    //ִ�в���A
    `define H_Right_Border  8//�ұ߿�
    `define H_Front_Porch   8//ǰ��
    `define H_Sync_Time     96//������ͬ���źŵĿ��
    `define H_Back_Porch    40//����
    `define H_Left_Border   8//��������ߵĺ���߿�
    `define H_Data_Time     640//����Чͼ��
    `define H_Total_Time    800//��ɨ������

    
    `define V_Bottom_Border  8//�±߿�
    `define V_Front_Porch    2//ǰ��
    `define V_Sync_Time      2//������ͬ���źŵĸ߶�
    `define V_Back_Porch     25//����
    `define V_Top_Border     8//�ϱ߿�
    `define V_Data_Time      480//����Чͼ����
    `define V_Total_Time     525//��ɨ������


`endif 
