# code for mux4_1.v
  ...
     module mux4_1(d_in,s_in,y);

   //Step1 : Define the port directions with proper size & datatypes
        input [3:0]d_in;
        input [1:0]s_in;
        output reg y;
   //Step2 : Write the MUX behaviour as a parallel logic using "case"
        always@(d_in,s_in)
        begin
                case(s_in)
                        2'b00: y=d_in[0];
                        2'b01: y=d_in[1];
                        2'd10: y=d_in[2];
                        2'd11: y=d_in[3];
                endcase
        end
endmodule
...
