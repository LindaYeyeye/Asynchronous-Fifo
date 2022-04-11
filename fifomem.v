module fifomem
#(
    parameter  DATASIZE = 32, // Memory data word width               
    parameter  ADDRSIZE = 6  // ���Ϊ8����ַΪ3λ���ɣ�����ඨ��һλ��ԭ���������ж��ǿջ���������ϸ�ں��Ľ���
) // Number of mem address bits
(
    output [DATASIZE-1:0] rdata, 
    input  [DATASIZE-1:0] wdata, 
    input  [ADDRSIZE-1:0] waddr, raddr, 
    input                 wclken, wfull, wclk
);

 // RTL Verilog memory model
localparam DEPTH = 1<<ADDRSIZE;   // �����൱�ڳ˷���2^4
reg [DATASIZE-1:0] mem [0:DEPTH-1]; //����2^4��λ��λ8������
assign rdata = mem[raddr];
always @(posedge wclk)  //��дʹ����Ч�һ�δд����ʱ������д��洢ʵ���У�ע����������wclkͬ����
    if (wclken && !wfull)
        mem[waddr] <= wdata;
 endmodule