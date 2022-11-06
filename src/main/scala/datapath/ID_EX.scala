package datapath

import chisel3._

class ID_EX extends Module {
  val io = IO (new Bundle {

	val pc = Input(UInt(32.W))
	val pc4 = Input(UInt(32.W))
    val MemWrite = Input(Bool())
	val Branch = Input(Bool())
	val MemRead = Input(Bool())
	val RegWrite = Input(Bool())
	val MemtoReg = Input(Bool())
	val AluOp = Input(UInt(3.W))
	// val OpA = Input(UInt(32.W))
	// val OpB = Input(UInt(32.W))
	val OpA_s = Input(UInt(2.W))
	val OpB_s = Input(Bool())
	val NextPc = Input(UInt(2.W))
    val imm = Input(SInt(32.W))
	// val sb_imm = Input(SInt(32.W))
	// val uj_imm = Input(SInt(32.W))
	// val u_imm = Input(SInt(32.W))
	// val i_imm = Input(SInt(32.W))
    val func3 = Input(UInt(3.W))
	val func7 = Input(UInt(1.W))
    val rs1 = Input(SInt(32.W))
	val rs2 = Input(SInt(32.W))
    val rs1_s = Input(UInt(5.W))
	val rs2_s = Input(UInt(5.W))
    val rd = Input(UInt(5.W))
    val pc_out = Output(UInt(32.W))
	val pc4_out = Output(UInt(32.W))
	val MemWrite_out = Output(Bool())
	val Branch_out = Output(Bool())
	val MemRead_out = Output(Bool())
	val RegWrite_out = Output(Bool())
	val MemtoReg_out = Output(Bool())
	val AluOp_out = Output(UInt(3.W))
	//val OpA_out = Output(UInt(2.W))
	val OpB_s_out = Output(Bool())
	val OpA_s_out = Output(UInt(2.W))
	//val OpB_out = Output(UInt(1.W))
	val NextPc_out = Output(UInt(2.W))
	// val s_imm_out = Output(SInt(32.W))
	// val sb_imm_out = Output(SInt(32.W))
	// val uj_imm_out = Output(SInt(32.W))
	// val u_imm_out = Output(SInt(32.W))
	val imm_out = Output(SInt(32.W))
	val func3_out = Output(UInt(3.W))
	val func7_out = Output(UInt(1.W))
	val rs1_out = Output(SInt(32.W))
	val rs2_out = Output(SInt(32.W))
	val rs1_s_out = Output(UInt(5.W))
	val rs2_s_out = Output(UInt(5.W))
	val rd_out = Output(UInt(5.W))

  })

	val pc_r = RegInit(0.U(32.W))
	val pc4_r = RegInit(0.U(32.W))
	val inst_r = RegInit(0.U(32.W))
	pc_r := io.pc
	io.pc_out := pc_r
	pc4_r := io.pc4
	io.pc4_out := pc4_r

	// val s_imm_r = RegInit(0.S(32.W))
	// s_imm_r := io.s_imm
	// io.s_imm_out := s_imm_r

	val imm_r = RegInit(0.S(32.W))
	imm_r := io.imm
	io.imm_out := imm_r

	// val u_imm_r = RegInit(0.S(32.W))
	// u_imm_r := io.u_imm
	// io.u_imm_out := u_imm_r

	// val uj_imm_r = RegInit(0.S(32.W))
	// uj_imm_r := io.uj_imm
	// io.uj_imm_out := uj_imm_r

	// val i_imm_r = RegInit(0.S(32.W))
	// i_imm_r := io.i_imm
	// io.i_imm_out := i_imm_r

	val func3_r = RegInit(0.U(3.W))
	func3_r := io.func3
	io.func3_out := func3_r
	val func7_r = RegInit(0.U(1.W))
	func7_r := io.func7
	io.func7_out := func7_r

	val rs1_r = RegInit(0.S(32.W))
	rs1_r := io.rs1
	io.rs1_out := rs1_r
	val rs2_r = RegInit(0.S(32.W))
	rs2_r := io.rs2
	io.rs2_out := rs2_r
	val rs1s_r = RegInit(0.U(5.W))
	rs1s_r := io.rs1_s
	io.rs1_s_out := rs1s_r
	val rs2s_r = RegInit(0.U(5.W))
	rs2s_r := io.rs2_s
	io.rs2_s_out := rs2s_r
	val rd_r = RegInit(0.U(5.W))
	rd_r := io.rd
	io.rd_out := rd_r

	val MemWrite_r = RegInit(0.B)
	val Branch_r = RegInit(0.B)
	val MemRead_r = RegInit(0.B)
	val RegWrite_r = RegInit(0.B)
	val MemtoReg_r = RegInit(0.B)
	val AluOp_r = RegInit(0.U(3.W))
	val OpA_s_r = RegInit(0.U(2.W))
	val OpB_s_r = RegInit(0.U(1.W))
	val NextPc_r = RegInit(0.U(2.W))

	MemWrite_r := io.MemWrite
	io.MemWrite_out := MemWrite_r
	Branch_r := io.Branch
	io.Branch_out := Branch_r
	MemRead_r := io.MemRead
	io.MemRead_out := MemRead_r
	RegWrite_r := io.RegWrite
	io.RegWrite_out := RegWrite_r
	MemtoReg_r := io.MemtoReg
	io.MemtoReg_out := MemtoReg_r
	AluOp_r := io.AluOp
	io.AluOp_out := AluOp_r
	OpA_s_r := io.OpA_s
	io.OpA_s_out := OpA_s_r
	OpB_s_r := io.OpB_s
	io.OpB_s_out := OpB_s_r
	NextPc_r := io.NextPc
	io.NextPc_out := NextPc_r

}