module mc68ec020_busmaster (

  // generic ram-like i\f
  input  logic        clk,
  input  logic        rstn,

  input  logic        re,
  input  logic        we,
  input  logic [3:0]  be, // [0001], [0011] or [1111]
  input  logic [23:0] addr,
  input  logic [31:0] din,
  output logic [31:0] dout,
  output logic        ready,

  // 68ec020 bus

  input  logic        cpuclk_a,

  output logic [23:0] addr,
  
  input  logic [31:0] data_in,
  output logic [31:0] data_out,
  output logic        data_dir,
 
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

  output logic        oc_rst,
  output logic        oc_hlt

);


  localparam DSACK_WAIT     = 2'b00;
  localparam DSACK_BYTE     = 2'b01;
  localparam DSACK_WORD     = 2'b10;
  localparam DSACK_LONGWORD = 2'b11;

  localparam SIZ_BYTE      = 2'b01;
  localparam SIZ_WORD      = 2'b10;
  localparam SIZ_3_BYTES   = 2'b11;
  localparam SIZ_LONG_WORD = 2'b00;


endmodule