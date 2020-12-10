module WM1200_fpga_top (

  input cpuclk_a,

  /* Multimode master\ramexp i\o. For future use.
  // 68ec020 lines
  inout [23:0] A,
  inout [31:0] D,

  inout [2:0] fc,
  inout [1:0] dsack,

  inout r_w,
  inout as_n,
  inout ds_n,

  inout [1:0] size,
  input [2:0] ipl_n,

  input berr_n,
  input rst_n,
  input hlt_n,
  */


  // 68ec020 lines
  output logic [23:0] A,
  inout  logic [31:0] D,

  output logic [2:0]  fc,
  input  logic [1:0]  dsack,

  output logic        r_w,
  output logic        as_n,
  output logic        ds_n,

  output logic [1:0]  size,
  input  logic [2:0]  ipl_n,

  input  logic        berr_n,
  input  logic        rst_n,
  input  logic        hlt_n,



  // buffer control
  output d_buff_dir,
  output d_buff_oe_n,

  output a_buff_dir,
  output a_buff_oe_n,


  // OC control
  output oc_hlt,
  output oc_rst,
  output oc_boss,
  output oc_int6,
  output oc_ovr,
  output oc_int2//,


  /*
  // HDMI
  output [2:0] hdmi_d_p,
  output [2:0] hdmi_d_n,

  output hdmi_clk_p,
  output hdmi_clk_n,


  // Audio expansion
  output aud_pwm_r,
  output aud_pwm_l,
  output aud_sd
  */
);


  // Data bus tristate



  logic        data_dir;
  logic [31:0] data_out;
  logic [31:0] data_in;

  assign data_in = D;

  assign D = data_dir ? 32'hzzzzzzzz : data_out; 






endmodule