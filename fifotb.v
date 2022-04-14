`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/01 15:43:04
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb();
reg  [31:0] wdata;
reg           winc, wclk, wrst_n; 
reg           rinc, rclk, rrst_n;
wire [31:0] rdata;  
wire           wfull;  
wire          rempty;  

fifo

u_fifo (
               .rdata(rdata),  
            //    .wfull(wfull),  
            //    .rempty(rempty),  
               .wdata (wdata),  
               .winc  (winc), 
               .wclk  (wclk), 
               .wrst_n(wrst_n), 
               .rinc(rinc), 
               .rclk(rclk), 
               .rrst_n(rrst_n)
 );
localparam CYCLE = 20;
localparam CYCLE1 = 40;



        //时钟周期，单位为ns，可在此修改时钟周期。
     
            //生成本地时钟50M
            initial begin
                wclk = 0;
                forever
                #(CYCLE/2)
                wclk=~wclk;
            end
            initial begin
                rclk = 0;
                forever
                #(CYCLE1/2)
                rclk=~rclk;
            end

            //产生复位信号
            initial begin
                wrst_n = 1;
                #2;
                wrst_n = 0;
                #(CYCLE*3);
                wrst_n = 1;
            end
            
             initial begin
                rrst_n = 1;
                #2;
                rrst_n = 0;
                #(CYCLE*3);
                rrst_n = 1;
            end
 initial begin
     winc=0;
     #5 winc=1;
 end 

 initial begin
    rinc=0;
     #5 rinc=1;
 end 

//   #5 rinc =1;
//             always  @(posedge wclk or negedge wrst_n)begin
//                 if(wrst_n==1'b0)begin
//                     winc <= 0;
//                     rinc <= 0;
//                 end
//                 else begin
//                     winc <= $random;
//                     rinc <= $random;
//                 end
//             end

//             always  @(posedge rclk or negedge rrst_n)begin
//                 if(rrst_n==1'b0)begin                  
//                     rinc <= 0;
//                 end
//                 else begin                
//                     rinc <= $random;
//                 end
//             end
// always@(*)begin
//   if(winc == 1)
//     wdata= $random ;
//   else
//     wdata = 0;
// end  

always #30 wdata= $random ;
endmodule
