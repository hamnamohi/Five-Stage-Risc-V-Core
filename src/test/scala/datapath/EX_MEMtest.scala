package datapath
import chisel3._
import org.scalatest._
import chiseltest._
class exmem_test extends FreeSpec with ChiselScalatestTester{
    "exmem test" in {
        test(new EX_MEM ){ c =>
        c.io.MemWrite.poke(1.B)
        c.io.MemRead.poke(1.B)
        c.io.RegWrite.poke(1.B)
        c.io.MemtoReg.poke(1.B)
        c.io.alu.poke(7.S)
        c.io.rs2.poke(7.S)
        c.io.rd.poke(7.U)
        c.clock.step(20)
        c.io.rs2_out.expect(9.S)
        c.io.alu_out.expect(9.S)
        c.io.rd_out.expect(9.U)
        c.io.MemWrite_out.expect(1.B)
        c.io.MemRead_out.expect(1.B)
        c.io.RegWrite_out.expect(1.B)
        c.io.MemtoReg_out.expect(1.B)
    
       
        }
    }
}