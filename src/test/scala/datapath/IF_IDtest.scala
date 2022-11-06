package datapath
import chisel3._
import org.scalatest._
import chiseltest._
class if_idtest extends FreeSpec with ChiselScalatestTester{
    "if test" in {
        test(new IF_ID){ c =>
        c.io.pc.poke(1.U)
        c.io.pc4.poke(4.U)
        c.io.ins.poke(86.U)
        c.clock.step(20)
        c.io.pc_out.expect(1.U)
        c.io.pc4_out.expect(4.U)
        c.io.ins_out.expect(86.U)
       
        }
    }
}