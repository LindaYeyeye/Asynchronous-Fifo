module sync_w2r
#(parameter ADDRSIZE = 6)
(
    output reg [ADDRSIZE:0] rq2_wptr, //дָ��ͬ������ʱ����
    input           [ADDRSIZE:0] wptr,     //��������ʽ��дָ��
    input            rclk, rrst_n
);
 
reg [ADDRSIZE:0] rq1_wptr;
 
  always @(posedge rclk or negedge rrst_n)   
      if (!rrst_n)begin
          rq1_wptr <= 0;
          rq2_wptr <= 0;
      end 
      else begin
          rq1_wptr <= wptr;
          rq2_wptr <= rq1_wptr;
      end
        
endmodule