`timescale 1ns/1ps

module WM1200_fpga_tb ();


  localparam NTSC_CLOCK = 1; // PAL or NTSC

  // 14.32 MHz NTSC   69.8324022346369 ns‬
  // 14.18 MHz  PAL   70.5218617771509‬ ns
  localparam CPUCLK_PERIOD = NTSC_CLOCK ? 69.8324 : 70.5219;









  logic cpuclk_a;


  // 68ec020 lines
  logic [23:0] A;
  tri [31:0] D;

  logic [2:0] fc;
  logic [1:0] dsack;

  logic r_w;
  logic as_n;
  logic ds_n;

  logic [1:0] size;
  logic [2:0] ipl_n;

  logic berr_n;
  logic rst_n;
  logic hlt_n;


  // buffer control
  logic d_buff_dir;
  logic d_buff_oe_n;

  logic a_buff_dir;
  logic a_buff_oe_n;


  // OC control
  logic oc_hlt;
  logic oc_rst;
  logic oc_boss;
  logic oc_int6;
  logic oc_ovr;
  logic oc_int2;

  /*
  // HDMI
  logic [2:0] hdmi_d_p;
  logic [2:0] hdmi_d_n;

  logic hdmi_clk_p;
  logic hdmi_clk_n;


  // Audio expansion
  logic aud_pwm_r;
  logic aud_pwm_l;
  logic aud_sd;
  */


  // Initial signal states
  initial begin
    cpuclk_a = 'b0;
    rst_n    = 'b1;
    dsack    = 'd0;
    ipl_n    = 'b111;
    berr_n   = 'b1;
    hlt_n    = 'b1;

    //D = 'dz;
  end



  // Generate cpu clock
  initial begin
    forever
      #(CPUCLK_PERIOD/2) cpuclk_a = ~cpuclk_a;
  end


  // Reset at startup
  initial begin
    #100
    reset(1000);
  end



  // UUT

  WM1200_fpga_top UUT(

  .cpuclk_a (cpuclk_a),


  .A (A), // output
  .D (D), // inout

  .fc (fc), // output
  .dsack (dsack), // input

  .r_w (r_w), // output
  .as_n (as_n), // output
  .ds_n (ds_n), // output

  .size (size), // output
  .ipl_n (ipl_n), // input

  .berr_n (berr_n), // input
  .rst_n (rst_n), // input
  .hlt_n (hlt_n), // input



  // buffer control
  .d_buff_dir (d_buff_dir), // output
  .d_buff_oe_n (d_buff_oe_n), // output

  .a_buff_dir (a_buff_dir), // output
  .a_buff_oe_n (a_buff_oe_n), // output


  // OC control
  .oc_hlt (oc_hlt), // output
  .oc_rst (oc_rst), // output
  .oc_boss (oc_boss), // output
  .oc_int6 (oc_int6), // output
  .oc_ovr (oc_ovr), // output
  .oc_int2 (oc_int2)//, // output

  /*
  // HDMI
  .hdmi_d_p (hdmi_d_p), // output
  .hdmi_d_n (hdmi_d_n), // output

  .hdmi_clk_p (hdmi_clk_p), // output
  .hdmi_clk_n (hdmi_clk_n), // output


   Audio expansion
  .aud_pwm_r (aud_pwm_r), // output
  .aud_pwm_l (aud_pwm_l), // output
  .aud_sd (aud_sd) // output
  */

);




  // Tasks

  task reset;
    input [31:0] reset_length;

    begin
      rst_n = 1'b0;
      #reset_length
      rst_n = 1'b1;
    end
  endtask : reset




endmodule