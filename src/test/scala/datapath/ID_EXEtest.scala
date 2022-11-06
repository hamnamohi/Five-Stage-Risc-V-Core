package datapath
import chisel3._
import org.scalatest._
import chiseltest._
class id_ex_test extends FreeSpec with ChiselScalatestTester{
    "idex test" in {
        test(new ID_EX()){ c =>
        c.io.pc.poke(7.U)
        c.io.pc4.poke(7.U)
        c.io.MemWrite.poke(1.B)
        c.io.Branch.poke(1.B)
        c.io.MemRead.poke(1.B)
        c.io.RegWrite.poke(1.B)
        c.io.MemtoReg.poke(1.B)
        c.io.AluOp.poke(7.U)
        c.io.OpA_s.poke(7.U)
        c.io.OpB_s.poke(1.B)
        c.io.NextPc.poke(7.U)
        //c.io.imm.poke(7.S)
        c.io.func3.poke(7.U)
        c.io.func7.poke(7.U)
        c.io.rs1.poke(7.S)
        c.io.rs2.poke(7.S)
        c.io.rs1_s.poke(7.U)
        c.io.rs2_s.poke(7.U)
        c.io.rd.poke(7.U)
        c.clock.step(20)
        c.io.pc_out.expect(9.U)
        c.io.pc4_out.expect(9.U)
        c.io.MemWrite_out.expect(1.B)
        c.io.Branch_out.expect(1.B)
        c.io.MemRead_out.expect(1.B)
        c.io.RegWrite_out.expect(1.B)
        c.io.MemtoReg_out.expect(1.B)
        c.io.AluOp_out.expect(9.U)
        c.io.OpA_s_out.expect(9.U)
        c.io.OpB_s_out.expect(1.B)
        c.io.NextPc_out.expect(9.U)
        //c.io.imm_out.expect(9.S)
        c.io.func3_out.expect(9.U)
        c.io.func7_out.expect(9.U)
        c.io.rs1_out.expect(9.S)
        c.io.rs2_out.expect(9.S)
        c.io.rs1_s_out.expect(9.U)
        c.io.rs2_s_out.expect(9.U)
        c.io.rd_out.expect(7.U)
       
        }
    }
}