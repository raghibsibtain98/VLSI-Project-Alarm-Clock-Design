/*My Code*/
module tb_alarm_clock();

reg clk,
    reset,
    fast_watch,
    alarm_button,
    time_button;

reg [3:0] key;

wire [7:0] display_ms_hr,
           display_ms_min,
           display_ls_hr,
           display_ls_min;

wire sound_alarm;

parameter cycle = 2;


alarm_clock_top DUV(.clock(clk),
                    .reset(reset),
                    .fastwatch(fast_watch),
                    .alarm_button(alarm_button),
                    .time_button(time_button),
                    .key(key),
                    .alarm_sound(sound_alarm),
                    .ms_hour(display_ms_hr),
                    .ls_hour(display_ls_hr),
                    .ms_minute(display_ms_min),
                    .ls_minute(display_ls_min));


 initial
  begin
     clk = 1'b0;
     forever
     #(cycle/2) clk = ~clk;
   end


 initial
  begin
 
    reset = 1;
    #10;
    reset = 0;
  
   fast_watch = 1;
  
   key = 1;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 1;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 2;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 3;
   repeat(3)   
   @(negedge clk);
   key = 10;
   @(negedge clk);
   time_button = 1;
   @(negedge clk);
   time_button = 0;

  
   key = 1;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 1;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 3;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 0;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   alarm_button = 1;
   @(negedge clk);
   alarm_button = 0;
   #(6*256*2);
  
    repeat(4*2564) 
    @(negedge clk);
   $finish;
  end

 initial
  $monitor($time,"\-ns\t MAVEN SILICON : \tDISPLAY_MS_HR =%H >>> DISPLAY_LS_HR =%H>>> DISPLAY_MS_MIN =%H>>> DISPLAY_LS_MIN=%H",display_ms_hr[3:0],display_ls_hr[3:0],display_ms_min[3:0],display_ls_min[3:0]); 

endmodule
