/*My Code*/
module keyreg(reset,
              clock,
              shift,
              key,
              key_buffer_ls_min,
              key_buffer_ms_min,
              key_buffer_ls_hr,
              key_buffer_ms_hr);

  input reset,
        clock,
        shift;
  input [3:0] key;
  output reg [3:0]  key_buffer_ls_min,
                    key_buffer_ms_min,
                    key_buffer_ls_hr,
                    key_buffer_ms_hr;



// This procedure stores the last 4 keys pressed. 
always @(posedge clock or posedge reset)
begin
 
  if (reset)
  begin
    key_buffer_ls_min <= 0;
    key_buffer_ms_min <= 0;
    key_buffer_ls_hr <= 0;
    key_buffer_ms_hr <= 0;
  end
  
  else  if (shift == 1)
  begin
    key_buffer_ms_hr  <= key_buffer_ls_hr;
    key_buffer_ls_hr  <= key_buffer_ms_min;
    key_buffer_ms_min <= key_buffer_ls_min;
    key_buffer_ls_min <= key;
  end

end

endmodule
