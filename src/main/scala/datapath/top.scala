package datapath
import chisel3._
import chisel3.util._

class Top extends Module{
    val io=IO(new Bundle{ 
        val out = Output(UInt(32.W))
         val addr = Output ( UInt ( 10 . W ) )
    //val inst = Output ( UInt ( 32 . W ) )
    })
// var temp = 0.U
val PCMod = Module(new pc)
val ALUMod = Module(new ALU_)
val ALUcMod = Module (new alucontrol)
//val BrcntrlMod = Module (new BranchControl_)
val CntrlDecMod = Module (new controldec)
val datamemMod = Module (new datamem)
val ImmgenMod = Module(new ImmdValGen1)
val instmemMod = Module (new InstMem)
val jalrCompMod = Module (new jalr)
val regfileMod = Module (new regfile)
val ifid = Module(new IF_ID())
val idex = Module(new ID_EX())
val exemem = Module(new EX_MEM())
val memwb = Module(new MEM_WB())
val FU = Module(new ForwardUnit())
val HD = Module(new HazardDetection())
val BFU = Module(new DecodeBranchForward())
val BLU = Module(new BranchLogic())
val SDU = Module(new StructuralDetector())
FU.io.EX_MEM_rd := exemem.io.rd_out
FU.io.ID_EX_rs1_s := idex.io.rs1_s_out
FU.io.ID_EX_rs2_s := idex.io.rs2_s_out
FU.io.EX_MEM_RegWrite := exemem.io.RegWrite_out
FU.io.MEM_WB_rd := memwb.io.rd_out
FU.io.MEM_WB_RegWrite := memwb.io.RegWrite_out





PCMod.io.input := PCMod.io.pc4

instmemMod.io.addr := PCMod.io.pc(11,2)
val inst = instmemMod.io.inst
ifid.io.pc := PCMod.io.pc
ifid.io.pc4 := PCMod.io.pc4
ifid.io.ins := inst

CntrlDecMod.io.opcode := ifid.io.ins_out(6,0)
io.addr := instmemMod.io.addr

//regfile

regfileMod.io.rs1:= ifid.io.ins_out(19,15)
regfileMod.io.rs2 := ifid.io.ins_out(24,20)


//immegen
ImmgenMod.io.instruction := ifid.io.ins_out
ImmgenMod.io.pc := ifid.io.pc_out

//ALU Control
ALUcMod.io.aluOp := idex.io.AluOp_out
ALUcMod.io.func3 := idex.io.func3_out
ALUcMod.io.func7 := idex.io.func7_out

SDU.io.rs1_sel := ifid.io.ins_out(19, 15)
SDU.io.rs2_sel := ifid.io.ins_out(24, 20)
SDU.io.MEM_WB_REGRD := memwb.io.rd_out
SDU.io.MEM_WB_regWr := memwb.io.RegWrite_out
// FOR RS1
when(SDU.io.fwd_rs1 === 1.U) {
  idex.io.rs1 := regfileMod.io.WriteData
} .otherwise {
  idex.io.rs1 := regfileMod.io.rdata1
}
// FOR RS2
when(SDU.io.fwd_rs2 === 1.U) {
  idex.io.rs2 := regfileMod.io.WriteData
} .otherwise {
  idex.io.rs2 := regfileMod.io.rdata2
}

when(HD.io.ctrl_forward === "b1".U) {
    idex.io.MemWrite := 0.U
    idex.io.MemRead := 0.U
    idex.io.Branch := 0.U
    idex.io.RegWrite := 0.U
    idex.io.MemtoReg:= 0.U
    idex.io.AluOp := 0.U
    idex.io.OpA_s  := 0.U
    idex.io.OpB_s  := 0.U
    idex.io.NextPc := 0.U

} .otherwise {
    idex.io.MemWrite := CntrlDecMod.io.MemWrite
    idex.io.MemRead := CntrlDecMod.io.MemRead
    idex.io.Branch:= CntrlDecMod.io.Branch
    idex.io.RegWrite  := CntrlDecMod.io.RegWrite
    idex.io.MemtoReg := CntrlDecMod.io.Mem2Reg
    idex.io.AluOp := CntrlDecMod.io.aluop
    idex.io.OpA_s := CntrlDecMod.io.opAsel
    idex.io.OpB_s := CntrlDecMod.io.opBsel
    idex.io.NextPc := CntrlDecMod.io.nextPCsel

}

BFU.io.ID_EX_REGRD := idex.io.rd_out
BFU.io.ID_EX_MEMRD := idex.io.MemRead_out
BFU.io.EX_MEM_REGRD := exemem.io.rd_out
BFU.io.MEM_WB_REGRD := memwb.io.rd_out
BFU.io.EX_MEM_MEMRD := exemem.io.MemRead_out
BFU.io.MEM_WB_MEMRD := memwb.io.MemRead_out
BFU.io.rs1_sel := ifid.io.ins_out(19,15)
BFU.io.rs2_sel := ifid.io.ins_out(24, 20)
BFU.io.ctrl_branch := CntrlDecMod.io.Branch

BLU.io.in_rs1 := regfileMod.io.rdata1
BLU.io.in_rs2 := regfileMod.io.rdata2
BLU.io.in_func3 := ifid.io.ins_out(14,12)
jalrCompMod.io.rs1 := regfileMod.io.rdata1
jalrCompMod.io.imm := ImmgenMod.io.i_imm
when(BFU.io.forward_rs1 === "b0000".U) {
  // No hazard just use register file data
  BLU.io.in_rs1 := regfileMod.io.rdata1
  jalrCompMod.io.rs1 := regfileMod.io.rdata1
} .elsewhen(BFU.io.forward_rs1 === "b0001".U) {
  // hazard in alu stage forward data from alu output
  BLU.io.in_rs1 := ALUMod.io.output
  jalrCompMod.io.rs1:= regfileMod.io.rdata1
} .elsewhen(BFU.io.forward_rs1 === "b0010".U) {
  // hazard in EX/MEM stage forward data from EX/MEM.alu_output
  BLU.io.in_rs1 := exemem.io.alu_out
  jalrCompMod.io.rs1 := regfileMod.io.rdata1
} .elsewhen(BFU.io.forward_rs1 === "b0011".U) {
  // hazard in MEM/WB stage forward data from register file write data which will have correct data from the MEM/WB mux
  BLU.io.in_rs1 := regfileMod.io.WriteData
  jalrCompMod.io.rs1 := regfileMod.io.rdata1
} .elsewhen(BFU.io.forward_rs1 === "b0100".U) {
  // hazard in EX/MEM stage and load type instruction so forwarding from data memory data output instead of EX/MEM.alu_output
  BLU.io.in_rs1 := datamemMod.io.out
  jalrCompMod.io.rs1 := regfileMod.io.rdata1
} .elsewhen(BFU.io.forward_rs1 === "b0101".U) {
  // hazard in MEM/WB stage and load type instruction so forwarding from register file write data which will have the correct output from the mux
  BLU.io.in_rs1:= regfileMod.io.WriteData
  jalrCompMod.io.rs1 := regfileMod.io.rdata1
}.elsewhen(BFU.io.forward_rs1 === "b0110".U) {
    // hazard in alu stage forward data from alu output
    jalrCompMod.io.rs1 := ALUMod.io.output
    BLU.io.in_rs1 := regfileMod.io.rdata1
} .elsewhen(BFU.io.forward_rs1 === "b0111".U) {
    // hazard in EX/MEM stage forward data from EX/MEM.alu_output
    jalrCompMod.io.rs1 := exemem.io.alu_out
    BLU.io.in_rs1 := regfileMod.io.rdata1
} .elsewhen(BFU.io.forward_rs1 === "b1000".U) {
    // hazard in MEM/WB stage forward data from register file write data which will have correct data from the MEM/WB mux
    jalrCompMod.io.rs1 := regfileMod.io.WriteData
    BLU.io.in_rs1:= regfileMod.io.rdata1
} .elsewhen(BFU.io.forward_rs1 === "b1001".U) {
    // hazard in EX/MEM stage and load type instruction so forwarding from data memory data output instead of EX/MEM.alu_output
    jalrCompMod.io.rs1 := datamemMod.io.out
    BLU.io.in_rs1 := regfileMod.io.rdata1
} .elsewhen(BFU.io.forward_rs1 === "b1010".U) {
    // hazard in MEM/WB stage and load type instruction so forwarding from register file write data which will have the correct output from the mux
    jalrCompMod.io.rs1 := regfileMod.io.WriteData
    BLU.io.in_rs1 := regfileMod.io.rdata1}
  .otherwise {
    BLU.io.in_rs1 := regfileMod.io.rdata1
    jalrCompMod.io.rs1 := regfileMod.io.rdata1
}
// FOR REGISTER RS2 in BRANCH LOGIC UNIT
when(BFU.io.forward_rs2 === "b000".U) {
  // No hazard just use register file data
  BLU.io.in_rs2  := regfileMod.io.rdata2
} .elsewhen(BFU.io.forward_rs2 === "b001".U) {
  // hazard in alu stage forward data from alu output
  BLU.io.in_rs2  := ALUMod.io.output
} .elsewhen(BFU.io.forward_rs2 === "b010".U) {
  // hazard in EX/MEM stage forward data from EX/MEM.alu_output
  BLU.io.in_rs2  := exemem.io.alu_out
} .elsewhen(BFU.io.forward_rs2 === "b011".U) {
  // hazard in MEM/WB stage forward data from register file write data which will have correct data from the MEM/WB mux
  BLU.io.in_rs2  := regfileMod.io.WriteData
} .elsewhen(BFU.io.forward_rs2 === "b100".U) {
  // hazard in EX/MEM stage and load type instruction so forwarding from data memory data output instead of EX/MEM.alu_output
  BLU.io.in_rs2 := datamemMod.io.out
} .elsewhen(BFU.io.forward_rs2 === "b101".U) {
  // hazard in MEM/WB stage and load type instruction so forwarding from register file write data which will have the correct output from the mux
  BLU.io.in_rs2  := regfileMod.io.WriteData
}
  .otherwise {
    BLU.io.in_rs2  := regfileMod.io.rdata2
  }

when(HD.io.pc_forward === "b1".U) {
  PCMod.io.input := HD.io.pc_out
} .otherwise {
    when(CntrlDecMod.io.nextPCsel === "b01".U) {
      when(BLU.io.output === 1.U && CntrlDecMod.io.Branch === 1.B) {
        PCMod.io.input := ImmgenMod.io.sb_imm.asUInt
        ifid.io.pc := 0.U
        ifid.io.pc4 := 0.U
        ifid.io.ins := 0.U
      } .otherwise {
        PCMod.io.input := PCMod.io.pc4
      }
}.elsewhen(CntrlDecMod.io.nextPCsel === "b01".U) {
      PCMod.io.input := ImmgenMod.io.uj_imm.asUInt
      ifid.io.pc := 0.U
      ifid.io.pc4 := 0.U
      ifid.io.ins := 0.U
    }.elsewhen(CntrlDecMod.io.nextPCsel === "b11".U) {
      PCMod.io.input := (jalrCompMod.io.out).asUInt
      ifid.io.pc := 0.U
      ifid.io.pc4 := 0.U
      ifid.io.ins := 0.U
    }
      .otherwise {
      PCMod.io.input := PCMod.io.pc4
    }

}
when(HD.io.inst_forward === "b1".U) {
  ifid.io.ins := HD.io.inst_out
  ifid.io.pc := HD.io.current_pc_out
} .otherwise {
    ifid.io.ins := instmemMod.io.inst
}







idex.io.pc := ifid.io.pc_out
idex.io.pc4 := ifid.io.pc4_out
idex.io.MemWrite:=CntrlDecMod.io.MemWrite
idex.io.Branch := CntrlDecMod.io.Branch
idex.io.MemRead := CntrlDecMod.io.MemRead
idex.io.RegWrite := CntrlDecMod.io.RegWrite
idex.io.MemtoReg := CntrlDecMod.io.Mem2Reg
idex.io.AluOp := CntrlDecMod.io.aluop
idex.io.OpA_s := CntrlDecMod.io.opAsel
idex.io.OpB_s := CntrlDecMod.io.opBsel
idex.io.NextPc := CntrlDecMod.io.nextPCsel
idex.io.func3 := ifid.io.ins_out(14,12)
idex.io.func7 := ifid.io.ins_out(30)
idex.io.rs1 := regfileMod.io.rdata1
idex.io.rs2 := regfileMod.io.rdata2
idex.io.rs1_s := ifid.io.ins_out(19, 15)
idex.io.rs2_s := ifid.io.ins_out(24, 20)
idex.io.rd := ifid.io.ins_out(11,7)





HD.io.IF_ID_INST := ifid.io.ins_out
HD.io.ID_EX_MEMREAD := idex.io.MemRead_out
HD.io.ID_EX_REGRD := idex.io.rd_out
HD.io.pc_in := ifid.io.pc4_out
HD.io.current_pc := ifid.io.pc_out

when (idex.io.OpA_s_out === "b10".U) {
    ALUMod.io.in_A := idex.io.pc4_out.asSInt
  } .otherwise{
when(FU.io.forward_a === "b00".U) {
  ALUMod.io.in_A  := idex.io.rs1_out
} .elsewhen(FU.io.forward_a === "b01".U) {
  ALUMod.io.in_A  := exemem.io.alu_out
} .elsewhen(FU.io.forward_a === "b10".U) {
  ALUMod.io.in_A := regfileMod.io.WriteData
} .otherwise {
  ALUMod.io.in_A  := idex.io.rs1_out
}}
//ALUMod.io.in_A := idex.io.OpA
//InB
when (CntrlDecMod.io.Ex_sel === "b00".U){
		idex.io.imm :=ImmgenMod.io.i_imm}
	.elsewhen (CntrlDecMod.io.Ex_sel === "b00".U){
		idex.io.imm :=ImmgenMod.io.u_imm}
	.elsewhen (CntrlDecMod.io.Ex_sel === "b00".U){
		idex.io.imm :=ImmgenMod.io.s_imm}
	.otherwise {idex.io.imm := 0.S}
	
ALUMod.io.in_B := 0.S
when(idex.io.OpB_s_out === 1.B){
		ALUMod.io.in_B := idex.io.imm_out
	
	when (FU.io.forward_b === "b01".U){exemem.io.rs2 := exemem.io.alu_out}
		.elsewhen (FU.io.forward_b === "b10".U ){exemem.io.rs2 := regfileMod.io.WriteData}
		.elsewhen (FU.io.forward_b === "b00".U ){exemem.io.rs2 := idex.io.rs2_out}
    .otherwise {
		exemem.io.rs2 := idex.io.rs2_out
		}
	} 
	.otherwise{
		when(FU.io.forward_b === "b00".U) {
    ALUMod.io.in_B := idex.io.rs2_out
    exemem.io.rs2:= idex.io.rs2_out
  } .elsewhen(FU.io.forward_b === "b01".U) {
    ALUMod.io.in_B := exemem.io.alu_out
    exemem.io.rs2 := exemem.io.alu_out
  } .elsewhen(FU.io.forward_b === "b10".U) {
    ALUMod.io.in_B := regfileMod.io.WriteData
    exemem.io.rs2 := regfileMod.io.WriteData
  } .otherwise {
    ALUMod.io.in_B:= idex.io.rs2_out
    exemem.io.rs2 := idex.io.rs2_out
	}}
//ALUMod.io.in_B := idex.io.OpB

ALUMod.io.aluc := ALUcMod.io.aluc

//Branch

// BrcntrlMod.io.branch := CntrlDecMod.io.Branch
// BrcntrlMod.io.arg_x := 0.S
// BrcntrlMod.io.arg_y := 0.S
// BrcntrlMod.io.aluc := ALUcMod.io.aluc








//--------Mem
exemem.io.MemWrite := idex.io.MemWrite_out
exemem.io.MemRead := idex.io.MemRead_out

exemem.io.RegWrite := idex.io.RegWrite_out
exemem.io.MemtoReg := idex.io.MemtoReg_out
exemem.io.rs2 := idex.io.rs2_out
exemem.io.alu := ALUMod.io.output
exemem.io.rd := idex.io.rd_out
//BrcntrlMod.io.aluc := CntrlDecMod.io.aluop

//jalr component



//val temp = 0.U
// when (BrcntrlMod.io.br_taken & CntrlDecMod.io.Branch){
//     temp := ImmgenMod.io.immd_se
// }.otherwise {
//    temp := PCMod.io.pc4
// }
//---------hamna
// PCMod.io.input := MuxCase ( 0.U , Array (
// (CntrlDecMod.io.nextPCsel === "b00".U ) -> PCMod.io.pc4 ,
// (CntrlDecMod.io.nextPCsel === "b01".U) -> Mux(BrcntrlMod.io.br_taken,(ImmgenMod.io.sb_imm).asUInt,PCMod.io.pc4) ,
// (CntrlDecMod.io.nextPCsel === "b10".U) -> (ImmgenMod.io.uj_imm).asUInt ,
// (CntrlDecMod.io.nextPCsel === "b11".U) -> (jalrCompMod.io.out).asUInt)
// )

//datamemory
datamemMod.io.Addr := (exemem.io.alu_out(9,2)).asUInt
datamemMod.io.Data := exemem.io.rs2_out
datamemMod.io.MemWrite := exemem.io.MemWrite_out
datamemMod.io.MemRead := exemem.io.MemRead
//-----Writeback
memwb.io.RegWrite := exemem.io.RegWrite_out
memwb.io.MemtoReg := exemem.io.MemtoReg_out
memwb.io.MemRead := exemem.io.MemRead_out
memwb.io.mem := datamemMod.io.out
memwb.io.alu := exemem.io.alu_out
memwb.io.rd := exemem.io.rd_out




regfileMod.io.WriteData := MuxCase ( 0.S , Array (
(memwb.io.MemtoReg_out === 0.B ) -> memwb.io.alu_out ,
(memwb.io.MemtoReg_out === 1.B ) -> memwb.io.mem_out)
)
regfileMod.io.RegWrite := memwb.io.RegWrite_out
regfileMod.io.rd := memwb.io.rd_out
io.out := 0.U

}