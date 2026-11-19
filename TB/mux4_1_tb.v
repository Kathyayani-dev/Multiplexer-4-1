# code for mux4_1_tb.v
  ...
     module mux4_1_tb();

   //Step1 : Write down the variables required for testbench
        reg [3:0]d_in;
        reg [1:0]s_in;
        wire y;
        integer m,n;
   //Step2 : Instantiate the Design
        mux4_1 DUT(d_in,s_in,y);
   //Step3 : Declare a task to initialize inputs of DUT to 0
        task initialize();
                begin
                        {d_in,s_in}=0;
                end
        endtask
   //Step4 : Declare  tasks with arguments for driving stimulus to DUT
        task stimulus(input[3:0]i,input[1:0]j);
                begin
                        #10;
                        d_in=i;
                        s_in=j;
                end
        endtask

   //Step5 : Call the tasks from procedural process
        initial
        begin
                initialize;
                for(m=0;m<16;m=m+1)
            begin
               for(n=0;n<4;n=n+1)
                  begin
                     stimulus(m,n);
                  end
             end
                /*stimulus(4'd5,2'd2);
                stimulus(4'd15,2'd3);
                stimulus(4'd6,2'd1);*/
                end
   //Step6 : Use $monitor task to display inputs and outputs
initial

                $monitor("%b %b %b %b %b %b %b",s_in[0],s_in[1],d_in[0],d_in[1],d_in[2],d_in[3],y);
   //Step7 : Use $finish task to terminate the simulation at 100ns

   //Waveform dump
  /*initial
    begin
     $fsdbDumpvars(0,mux4_1_tb);
    end*/
endmodule
...
