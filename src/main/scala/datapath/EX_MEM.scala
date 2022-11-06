package datapath

import chisel3._


class EX_MEM extends Module {
  val io = IO (new Bundle {
	val MemWrite = Input(Bool())
	val MemRead = Input(Bool())
	val RegWrite = Input(Bool())
	// val OpB_s = Input(Bool())
	val MemtoReg = Input(Bool())
    val rs2 = Input(SInt(32.W))
	val alu = Input(SInt(32.W))
    val rd = Input(UInt(5.W))

    val rs2_out = Output(SInt(32.W))
	val alu_out = Output(SInt(32.W))
	val rd_out = Output(UInt(5.W))
	val MemWrite_out = Output(Bool())
	val MemRead_out = Output(Bool())
	// val OpB_s_out= Output(Bool())
	val RegWrite_out = Output(Bool())
	val MemtoReg_out = Output(Bool())
  })
    val MemWrite_r = RegInit(0.B)
	val MemRead_r = RegInit(0.B)
	val RegWrite_r = RegInit(0.B)
	val MemtoReg_r = RegInit(0.B)
    val rs2_r = RegInit(0.S(32.W))
    val alu_r = RegInit(0.S(32.W))
    val rd_r = RegInit(0.U(5.W))
	MemWrite_r := io.MemWrite
	io.MemWrite_out := MemWrite_r
	MemRead_r := io.MemRead
	io.MemRead_out := MemRead_r
	RegWrite_r := io.RegWrite
	io.RegWrite_out := RegWrite_r
	MemtoReg_r := io.MemtoReg
	io.MemtoReg_out := MemtoReg_r
	rs2_r := io.rs2
	io.rs2_out := rs2_r
	alu_r := io.alu
	io.alu_out := alu_r
	rd_r := io.rd
	io.rd_out := rd_r

	

}