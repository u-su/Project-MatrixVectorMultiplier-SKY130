/*
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_usu_AXIS_MVMul (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // Declare all outputs, and avoid unused-input lint warnings
    assign uio_out      = 8'b0000_0000;
    assign uio_oe       = 8'b0000_0000;
    assign uo_out[7:1]  = 0;
    wire _unused        = &{ui_in[7:3], uio_in, ena};

  mvm_uart_system MVM_UART_SYSTEM (
    .clk    (clk),
    .rstn   (rst_n),
    .rx     (ui_in[0]),
    .tx     (uo_out[0])
    );

endmodule
