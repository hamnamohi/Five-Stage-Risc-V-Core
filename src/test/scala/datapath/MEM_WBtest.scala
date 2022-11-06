package datapath
import chisel3._
import org.scalatest._
import chiseltest._
class memwb_idtest extends FreeSpec with ChiselScalatestTester{
    "memwb test" in {
        test(new MEM_WB){ c =>
        c.io.RegWrite.poke(1.B)
        c.io.MemtoReg.poke(1.B)
        c.io.mem.poke(86.S)
        c.io.alu.poke(86.S)
        c.io.rd.poke(86.U)
        c.clock.step(20)
        c.io.RegWrite_out.expect(1.B)
        c.io.MemtoReg_out.expect(1.B)
        c.io.mem_out.expect(86.S)
        c.io.alu_out.expect(86.S)
        c.io.rd_out.expect(86.U)
       
        }
    }
}












