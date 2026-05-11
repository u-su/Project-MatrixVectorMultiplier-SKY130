# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, unit="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.rstn.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rstn.value = 1

    dut._log.info("Test project behavior")

    # Set the input values you want to test

    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, 1)
