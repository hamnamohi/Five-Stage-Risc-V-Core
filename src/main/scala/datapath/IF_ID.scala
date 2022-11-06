package datapath

import chisel3._

class IF_ID extends Module{

	val io = IO(new Bundle{


		val pc = Input(UInt(32.W))
		val pc4 = Input(UInt(32.W))
		val ins = Input(UInt(32.W))
		val pc_out = Output(UInt(32.W))
		val ins_out = Output(UInt(32.W))
		val pc4_out = Output(UInt(32.W))
		

	})


	val reg_pc = RegInit(0.U(32.W))
	val reg_pc4 = RegInit(0.U(32.W))
	val reg_ins = RegInit(0.U(32.W))

	reg_pc := io.pc
	reg_pc4 := io.pc4
	reg_ins := io.ins
	io.pc_out := reg_pc
	io.pc4_out := reg_pc4
	io.ins_out := reg_ins


}