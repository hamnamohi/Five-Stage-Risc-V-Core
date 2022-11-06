package datapath

import chisel3._


class MEM_WB extends Module {
  val io = IO (new Bundle {
	val RegWrite = Input(Bool())
	val MemtoReg = Input(Bool())
	val MemRead = Input(Bool())
	val mem = Input(SInt(32.W))	
	val alu = Input(SInt(32.W))
	val rd = Input(UInt(5.W))
	val RegWrite_out = Output(Bool())
	val MemtoReg_out = Output(Bool())
	val MemRead_out = Output(Bool())
	val mem_out = Output(SInt(32.W))
	val alu_out = Output(SInt(32.W))
	val rd_out = Output(UInt(5.W))
  })
	val mem_r = RegInit(0.S(32.W))
	mem_r := io.mem
	io.mem_out := mem_r

	val alu_r = RegInit(0.S(32.W))
	alu_r := io.alu
	io.alu_out := alu_r

	val rd_r = RegInit(0.U(5.W))
	rd_r := io.rd
	io.rd_out := rd_r

	val RegWrite_r = RegInit(0.B)
	RegWrite_r := io.RegWrite
	io.RegWrite_out := RegWrite_r
	val MemtoReg_r = RegInit(0.B)
	MemtoReg_r := io.MemtoReg
	io.MemtoReg_out := MemtoReg_r

	val MemRead_r = RegInit(0.B)
	MemRead_r := io.MemRead
	io.MemRead_out := MemRead_r

	
}