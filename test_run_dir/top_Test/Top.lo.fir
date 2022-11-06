circuit Top :
  module pc :
    input clock : Clock
    input reset : UInt<1>
    input io_input : UInt<32>
    output io_pc4 : UInt<32>
    output io_pc : UInt<32>

    reg reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg) @[pc.scala 10:26]
    node _io_pc4_T = add(reg, UInt<3>("h4")) @[pc.scala 12:23]
    node _io_pc4_T_1 = tail(_io_pc4_T, 1) @[pc.scala 12:23]
    io_pc4 <= _io_pc4_T_1 @[pc.scala 12:16]
    io_pc <= reg @[pc.scala 13:15]
    reg <= mux(reset, UInt<32>("h0"), io_input) @[pc.scala 10:26 pc.scala 10:26 pc.scala 11:9]

  module ALU_ :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : SInt<32>
    input io_in_B : SInt<32>
    input io_aluc : UInt<5>
    output io_output : SInt<32>

    node _T = eq(io_aluc, UInt<1>("h0")) @[alu.scala 50:22]
    node _T_1 = eq(io_aluc, UInt<1>("h0")) @[alu.scala 50:44]
    node _T_2 = or(_T, _T_1) @[alu.scala 50:34]
    node _io_output_T = add(io_in_A, io_in_B) @[alu.scala 51:38]
    node _io_output_T_1 = tail(_io_output_T, 1) @[alu.scala 51:38]
    node _io_output_T_2 = asSInt(_io_output_T_1) @[alu.scala 51:38]
    node _T_3 = eq(io_aluc, UInt<1>("h1")) @[alu.scala 52:28]
    node _T_4 = eq(io_aluc, UInt<1>("h1")) @[alu.scala 52:50]
    node _T_5 = or(_T_3, _T_4) @[alu.scala 52:40]
    node _io_output_T_3 = bits(io_in_B, 4, 0) @[alu.scala 53:48]
    node _io_output_T_4 = dshl(io_in_A, _io_output_T_3) @[alu.scala 53:38]
    node _T_6 = eq(io_aluc, UInt<2>("h2")) @[alu.scala 54:28]
    node _T_7 = eq(io_aluc, UInt<2>("h2")) @[alu.scala 54:51]
    node _T_8 = or(_T_6, _T_7) @[alu.scala 54:40]
    node _T_9 = lt(io_in_A, io_in_B) @[alu.scala 55:30]
    node _GEN_0 = mux(_T_9, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[alu.scala 55:40 alu.scala 56:35 alu.scala 58:35]
    node _T_10 = eq(io_aluc, UInt<2>("h3")) @[alu.scala 60:28]
    node _T_11 = eq(io_aluc, UInt<2>("h3")) @[alu.scala 60:51]
    node _T_12 = or(_T_10, _T_11) @[alu.scala 60:41]
    node Ua = asUInt(io_in_A) @[alu.scala 61:34]
    node Ub = asUInt(io_in_B) @[alu.scala 62:34]
    node _T_13 = lt(Ua, Ub) @[alu.scala 63:25]
    node _GEN_1 = mux(_T_13, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[alu.scala 63:30 alu.scala 64:35 alu.scala 66:35]
    node _T_14 = eq(io_aluc, UInt<3>("h4")) @[alu.scala 68:28]
    node _T_15 = eq(io_aluc, UInt<3>("h4")) @[alu.scala 68:50]
    node _T_16 = or(_T_14, _T_15) @[alu.scala 68:40]
    node _io_output_T_5 = xor(io_in_A, io_in_B) @[alu.scala 69:38]
    node _io_output_T_6 = asSInt(_io_output_T_5) @[alu.scala 69:38]
    node _T_17 = eq(io_aluc, UInt<3>("h5")) @[alu.scala 70:28]
    node _T_18 = eq(io_aluc, UInt<3>("h5")) @[alu.scala 70:51]
    node _T_19 = or(_T_17, _T_18) @[alu.scala 70:40]
    node _shift_T = asUInt(io_in_A) @[alu.scala 72:37]
    node _shift_T_1 = bits(io_in_B, 4, 0) @[alu.scala 72:55]
    node shift = dshr(_shift_T, _shift_T_1) @[alu.scala 72:44]
    node _io_output_T_7 = asSInt(shift) @[alu.scala 73:36]
    node _T_20 = eq(io_aluc, UInt<3>("h6")) @[alu.scala 74:28]
    node _T_21 = eq(io_aluc, UInt<3>("h6")) @[alu.scala 74:50]
    node _T_22 = or(_T_20, _T_21) @[alu.scala 74:39]
    node _io_output_T_8 = or(io_in_A, io_in_B) @[alu.scala 75:38]
    node _io_output_T_9 = asSInt(_io_output_T_8) @[alu.scala 75:38]
    node _T_23 = eq(io_aluc, UInt<3>("h7")) @[alu.scala 76:28]
    node _T_24 = eq(io_aluc, UInt<3>("h7")) @[alu.scala 76:51]
    node _T_25 = or(_T_23, _T_24) @[alu.scala 76:40]
    node _io_output_T_10 = and(io_in_A, io_in_B) @[alu.scala 77:38]
    node _io_output_T_11 = asSInt(_io_output_T_10) @[alu.scala 77:38]
    node _T_26 = eq(io_aluc, UInt<4>("h8")) @[alu.scala 78:28]
    node _io_output_T_12 = sub(io_in_A, io_in_B) @[alu.scala 79:38]
    node _io_output_T_13 = tail(_io_output_T_12, 1) @[alu.scala 79:38]
    node _io_output_T_14 = asSInt(_io_output_T_13) @[alu.scala 79:38]
    node _T_27 = eq(io_aluc, UInt<4>("hd")) @[alu.scala 80:28]
    node _T_28 = eq(io_aluc, UInt<3>("h5")) @[alu.scala 80:51]
    node _T_29 = or(_T_27, _T_28) @[alu.scala 80:40]
    node _io_output_T_15 = bits(io_in_B, 4, 0) @[alu.scala 81:49]
    node _io_output_T_16 = dshr(io_in_A, _io_output_T_15) @[alu.scala 81:39]
    node _T_30 = eq(io_aluc, UInt<5>("h1f")) @[alu.scala 82:28]
    node _GEN_2 = mux(_T_30, io_in_A, asSInt(UInt<1>("h0"))) @[alu.scala 82:43 alu.scala 83:27 alu.scala 48:14]
    node _GEN_3 = mux(_T_29, _io_output_T_16, _GEN_2) @[alu.scala 80:64 alu.scala 81:27]
    node _GEN_4 = mux(_T_26, _io_output_T_14, _GEN_3) @[alu.scala 78:40 alu.scala 79:27]
    node _GEN_5 = mux(_T_25, _io_output_T_11, _GEN_4) @[alu.scala 76:65 alu.scala 77:27]
    node _GEN_6 = mux(_T_22, _io_output_T_9, _GEN_5) @[alu.scala 74:63 alu.scala 75:27]
    node _GEN_7 = mux(_T_19, _io_output_T_7, _GEN_6) @[alu.scala 70:65 alu.scala 73:27]
    node _GEN_8 = mux(_T_16, _io_output_T_6, _GEN_7) @[alu.scala 68:64 alu.scala 69:27]
    node _GEN_9 = mux(_T_12, _GEN_1, _GEN_8) @[alu.scala 60:65]
    node _GEN_10 = mux(_T_8, _GEN_0, _GEN_9) @[alu.scala 54:65]
    node _GEN_11 = mux(_T_5, _io_output_T_4, _GEN_10) @[alu.scala 52:64 alu.scala 53:26]
    node _GEN_12 = mux(_T_2, _io_output_T_2, _GEN_11) @[alu.scala 50:58 alu.scala 51:27]
    io_output <= asSInt(bits(_GEN_12, 31, 0))

  module alucontrol :
    input clock : Clock
    input reset : UInt<1>
    input io_aluOp : UInt<3>
    input io_func3 : UInt<3>
    input io_func7 : UInt<1>
    output io_aluc : UInt<5>

    node _T = eq(io_aluOp, UInt<1>("h0")) @[alucontrol.scala 17:24]
    node io_aluc_hi = cat(UInt<1>("h0"), io_func7) @[Cat.scala 30:58]
    node _io_aluc_T = cat(io_aluc_hi, io_func3) @[Cat.scala 30:58]
    node _T_1 = eq(io_aluOp, UInt<1>("h1")) @[alucontrol.scala 18:27]
    node _io_aluc_T_1 = cat(UInt<1>("h0"), io_func3) @[Cat.scala 30:58]
    node _T_2 = eq(io_aluOp, UInt<3>("h5")) @[alucontrol.scala 19:26]
    node _T_3 = eq(io_aluOp, UInt<3>("h4")) @[alucontrol.scala 19:51]
    node _T_4 = or(_T_2, _T_3) @[alucontrol.scala 19:39]
    node _T_5 = eq(io_aluOp, UInt<2>("h3")) @[alucontrol.scala 20:27]
    node _T_6 = eq(io_aluOp, UInt<2>("h2")) @[alucontrol.scala 21:27]
    node _io_aluc_T_2 = cat(UInt<2>("h2"), io_func3) @[Cat.scala 30:58]
    node _T_7 = eq(io_aluOp, UInt<3>("h6")) @[alucontrol.scala 22:26]
    node _GEN_0 = mux(_T_7, UInt<1>("h0"), UInt<1>("h0")) @[alucontrol.scala 22:39 alucontrol.scala 22:48 alucontrol.scala 15:17]
    node _GEN_1 = mux(_T_6, _io_aluc_T_2, _GEN_0) @[alucontrol.scala 21:40 alucontrol.scala 21:49]
    node _GEN_2 = mux(_T_5, UInt<5>("h1f"), _GEN_1) @[alucontrol.scala 20:40 alucontrol.scala 20:49]
    node _GEN_3 = mux(_T_4, UInt<1>("h0"), _GEN_2) @[alucontrol.scala 19:64 alucontrol.scala 19:73]
    node _GEN_4 = mux(_T_1, _io_aluc_T_1, _GEN_3) @[alucontrol.scala 18:41 alucontrol.scala 18:50]
    node _GEN_5 = mux(_T, _io_aluc_T, _GEN_4) @[alucontrol.scala 17:37 alucontrol.scala 17:46]
    io_aluc <= _GEN_5

  module controldec :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_MemWrite : UInt<1>
    output io_Branch : UInt<1>
    output io_MemRead : UInt<1>
    output io_RegWrite : UInt<1>
    output io_Mem2Reg : UInt<1>
    output io_opAsel : UInt<2>
    output io_opBsel : UInt<1>
    output io_Ex_sel : UInt<2>
    output io_nextPCsel : UInt<2>
    output io_aluop : UInt<3>

    node _T = eq(UInt<6>("h33"), io_opcode) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<5>("h13"), io_opcode) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<6>("h23"), io_opcode) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<2>("h3"), io_opcode) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<7>("h63"), io_opcode) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<7>("h6f"), io_opcode) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<7>("h67"), io_opcode) @[Conditional.scala 37:30]
    node _T_7 = eq(UInt<6>("h37"), io_opcode) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_7, UInt<1>("h0"), UInt<1>("h0")) @[Conditional.scala 39:67 controldecoder.scala 114:26 controldecoder.scala 20:17]
    node _GEN_1 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 controldecoder.scala 117:26 controldecoder.scala 23:17]
    node _GEN_2 = mux(_T_7, UInt<2>("h2"), UInt<1>("h0")) @[Conditional.scala 39:67 controldecoder.scala 119:24 controldecoder.scala 25:15]
    node _GEN_3 = mux(_T_7, UInt<3>("h6"), UInt<3>("h7")) @[Conditional.scala 39:67 controldecoder.scala 123:22 controldecoder.scala 29:14]
    node _GEN_4 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[Conditional.scala 39:67 controldecoder.scala 102:26]
    node _GEN_5 = mux(_T_6, UInt<1>("h1"), _GEN_1) @[Conditional.scala 39:67 controldecoder.scala 105:26]
    node _GEN_6 = mux(_T_6, UInt<1>("h1"), _GEN_2) @[Conditional.scala 39:67 controldecoder.scala 107:24]
    node _GEN_7 = mux(_T_6, UInt<1>("h0"), _GEN_2) @[Conditional.scala 39:67 controldecoder.scala 109:24]
    node _GEN_8 = mux(_T_6, UInt<2>("h3"), _GEN_0) @[Conditional.scala 39:67 controldecoder.scala 110:26]
    node _GEN_9 = mux(_T_6, UInt<2>("h3"), _GEN_3) @[Conditional.scala 39:67 controldecoder.scala 111:22]
    node _GEN_10 = mux(_T_5, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 controldecoder.scala 90:26]
    node _GEN_11 = mux(_T_5, UInt<1>("h1"), _GEN_5) @[Conditional.scala 39:67 controldecoder.scala 93:26]
    node _GEN_12 = mux(_T_5, UInt<1>("h1"), _GEN_6) @[Conditional.scala 39:67 controldecoder.scala 95:24]
    node _GEN_13 = mux(_T_5, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 controldecoder.scala 96:24]
    node _GEN_14 = mux(_T_5, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67 controldecoder.scala 97:24]
    node _GEN_15 = mux(_T_5, UInt<2>("h2"), _GEN_8) @[Conditional.scala 39:67 controldecoder.scala 98:26]
    node _GEN_16 = mux(_T_5, UInt<2>("h3"), _GEN_9) @[Conditional.scala 39:67 controldecoder.scala 99:22]
    node _GEN_17 = mux(_T_4, UInt<1>("h0"), _GEN_10) @[Conditional.scala 39:67 controldecoder.scala 78:26]
    node _GEN_18 = mux(_T_4, UInt<1>("h1"), _GEN_10) @[Conditional.scala 39:67 controldecoder.scala 79:24]
    node _GEN_19 = mux(_T_4, UInt<1>("h0"), _GEN_11) @[Conditional.scala 39:67 controldecoder.scala 81:26]
    node _GEN_20 = mux(_T_4, UInt<1>("h0"), _GEN_12) @[Conditional.scala 39:67 controldecoder.scala 83:24]
    node _GEN_21 = mux(_T_4, UInt<1>("h0"), _GEN_13) @[Conditional.scala 39:67 controldecoder.scala 84:24]
    node _GEN_22 = mux(_T_4, UInt<1>("h0"), _GEN_14) @[Conditional.scala 39:67 controldecoder.scala 85:24]
    node _GEN_23 = mux(_T_4, UInt<1>("h1"), _GEN_15) @[Conditional.scala 39:67 controldecoder.scala 86:26]
    node _GEN_24 = mux(_T_4, UInt<2>("h2"), _GEN_16) @[Conditional.scala 39:67 controldecoder.scala 87:22]
    node _GEN_25 = mux(_T_3, UInt<1>("h0"), _GEN_17) @[Conditional.scala 39:67 controldecoder.scala 66:26]
    node _GEN_26 = mux(_T_3, UInt<1>("h0"), _GEN_18) @[Conditional.scala 39:67 controldecoder.scala 67:24]
    node _GEN_27 = mux(_T_3, UInt<1>("h1"), _GEN_17) @[Conditional.scala 39:67 controldecoder.scala 68:25]
    node _GEN_28 = mux(_T_3, UInt<1>("h1"), _GEN_19) @[Conditional.scala 39:67 controldecoder.scala 69:26]
    node _GEN_29 = mux(_T_3, UInt<1>("h0"), _GEN_20) @[Conditional.scala 39:67 controldecoder.scala 71:24]
    node _GEN_30 = mux(_T_3, UInt<1>("h1"), _GEN_21) @[Conditional.scala 39:67 controldecoder.scala 72:24]
    node _GEN_31 = mux(_T_3, UInt<1>("h0"), _GEN_22) @[Conditional.scala 39:67 controldecoder.scala 73:24]
    node _GEN_32 = mux(_T_3, UInt<3>("h4"), _GEN_24) @[Conditional.scala 39:67 controldecoder.scala 74:22]
    node _GEN_33 = mux(_T_3, UInt<1>("h0"), _GEN_23) @[Conditional.scala 39:67 controldecoder.scala 28:18]
    node _GEN_34 = mux(_T_2, UInt<1>("h1"), _GEN_25) @[Conditional.scala 39:67 controldecoder.scala 55:26]
    node _GEN_35 = mux(_T_2, UInt<1>("h0"), _GEN_26) @[Conditional.scala 39:67 controldecoder.scala 56:24]
    node _GEN_36 = mux(_T_2, UInt<1>("h0"), _GEN_27) @[Conditional.scala 39:67 controldecoder.scala 57:25]
    node _GEN_37 = mux(_T_2, UInt<1>("h1"), _GEN_28) @[Conditional.scala 39:67 controldecoder.scala 58:26]
    node _GEN_38 = mux(_T_2, UInt<1>("h0"), _GEN_29) @[Conditional.scala 39:67 controldecoder.scala 60:24]
    node _GEN_39 = mux(_T_2, UInt<1>("h1"), _GEN_30) @[Conditional.scala 39:67 controldecoder.scala 61:24]
    node _GEN_40 = mux(_T_2, UInt<1>("h1"), _GEN_31) @[Conditional.scala 39:67 controldecoder.scala 62:24]
    node _GEN_41 = mux(_T_2, UInt<3>("h5"), _GEN_32) @[Conditional.scala 39:67 controldecoder.scala 63:22]
    node _GEN_42 = mux(_T_2, UInt<1>("h0"), _GEN_33) @[Conditional.scala 39:67 controldecoder.scala 28:18]
    node _GEN_43 = mux(_T_1, UInt<1>("h0"), _GEN_34) @[Conditional.scala 39:67 controldecoder.scala 44:26]
    node _GEN_44 = mux(_T_1, UInt<1>("h0"), _GEN_35) @[Conditional.scala 39:67 controldecoder.scala 45:24]
    node _GEN_45 = mux(_T_1, UInt<1>("h0"), _GEN_36) @[Conditional.scala 39:67 controldecoder.scala 46:25]
    node _GEN_46 = mux(_T_1, UInt<1>("h1"), _GEN_37) @[Conditional.scala 39:67 controldecoder.scala 47:26]
    node _GEN_47 = mux(_T_1, UInt<1>("h0"), _GEN_38) @[Conditional.scala 39:67 controldecoder.scala 49:24]
    node _GEN_48 = mux(_T_1, UInt<1>("h1"), _GEN_39) @[Conditional.scala 39:67 controldecoder.scala 50:24]
    node _GEN_49 = mux(_T_1, UInt<1>("h0"), _GEN_40) @[Conditional.scala 39:67 controldecoder.scala 51:24]
    node _GEN_50 = mux(_T_1, UInt<1>("h1"), _GEN_41) @[Conditional.scala 39:67 controldecoder.scala 52:22]
    node _GEN_51 = mux(_T_1, UInt<1>("h0"), _GEN_42) @[Conditional.scala 39:67 controldecoder.scala 28:18]
    node _GEN_52 = mux(_T, UInt<1>("h0"), _GEN_43) @[Conditional.scala 40:58 controldecoder.scala 32:25]
    node _GEN_53 = mux(_T, UInt<1>("h0"), _GEN_44) @[Conditional.scala 40:58 controldecoder.scala 33:24]
    node _GEN_54 = mux(_T, UInt<1>("h0"), _GEN_45) @[Conditional.scala 40:58 controldecoder.scala 34:25]
    node _GEN_55 = mux(_T, UInt<1>("h1"), _GEN_46) @[Conditional.scala 40:58 controldecoder.scala 35:26]
    node _GEN_56 = mux(_T, UInt<1>("h0"), _GEN_47) @[Conditional.scala 40:58 controldecoder.scala 37:24]
    node _GEN_57 = mux(_T, UInt<1>("h0"), _GEN_48) @[Conditional.scala 40:58 controldecoder.scala 38:24]
    node _GEN_58 = mux(_T, UInt<1>("h0"), _GEN_49) @[Conditional.scala 40:58 controldecoder.scala 39:24]
    node _GEN_59 = mux(_T, UInt<1>("h0"), _GEN_50) @[Conditional.scala 40:58 controldecoder.scala 40:22]
    node _GEN_60 = mux(_T, UInt<1>("h0"), _GEN_51) @[Conditional.scala 40:58 controldecoder.scala 28:18]
    io_MemWrite <= _GEN_52
    io_Branch <= _GEN_53
    io_MemRead <= _GEN_54
    io_RegWrite <= _GEN_55
    io_Mem2Reg <= _GEN_54
    io_opAsel <= _GEN_56
    io_opBsel <= _GEN_57
    io_Ex_sel <= _GEN_58
    io_nextPCsel <= _GEN_60
    io_aluop <= _GEN_59

  module datamem :
    input clock : Clock
    input reset : UInt<1>
    input io_Addr : UInt<8>
    input io_Data : SInt<32>
    input io_MemWrite : UInt<1>
    input io_MemRead : UInt<1>
    output io_out : SInt<32>

    mem mem : @[datamemory.scala 14:22]
      data-type => SInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_out_MPORT
      writer => MPORT
      read-under-write => undefined
    node _T = eq(io_MemWrite, UInt<1>("h1")) @[datamemory.scala 15:27]
    node _GEN_0 = validif(_T, io_Addr) @[datamemory.scala 15:35]
    node _GEN_1 = validif(_T, clock) @[datamemory.scala 15:35]
    node _GEN_2 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[datamemory.scala 15:35 datamemory.scala 14:22]
    node _GEN_3 = validif(_T, UInt<1>("h1")) @[datamemory.scala 15:35]
    node _GEN_4 = validif(_T, io_Data) @[datamemory.scala 15:35]
    node _T_1 = eq(io_MemRead, UInt<1>("h1")) @[datamemory.scala 18:25]
    node _GEN_5 = validif(_T_1, io_Addr) @[datamemory.scala 18:33 datamemory.scala 19:35]
    node _GEN_6 = validif(_T_1, clock) @[datamemory.scala 18:33 datamemory.scala 19:35]
    node _GEN_7 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[datamemory.scala 18:33 datamemory.scala 19:35 datamemory.scala 14:22]
    node _GEN_8 = mux(_T_1, mem.io_out_MPORT.data, asSInt(UInt<1>("h0"))) @[datamemory.scala 18:33 datamemory.scala 19:24 datamemory.scala 21:28]
    io_out <= _GEN_8
    mem.io_out_MPORT.addr <= _GEN_5
    mem.io_out_MPORT.en <= _GEN_7
    mem.io_out_MPORT.clk <= _GEN_6
    mem.MPORT.addr <= _GEN_0
    mem.MPORT.en <= _GEN_2
    mem.MPORT.clk <= _GEN_1
    mem.MPORT.data <= _GEN_4
    mem.MPORT.mask <= _GEN_3

  module ImmdValGen1 :
    input clock : Clock
    input reset : UInt<1>
    input io_instruction : UInt<32>
    input io_pc : UInt<32>
    output io_s_imm : SInt<32>
    output io_sb_imm : SInt<32>
    output io_uj_imm : SInt<32>
    output io_u_imm : SInt<32>
    output io_i_imm : SInt<32>

    node s_imm__hi = bits(io_instruction, 31, 25) @[immgen.scala 19:41]
    node s_imm__lo = bits(io_instruction, 11, 7) @[immgen.scala 19:63]
    node s_imm_ = cat(s_imm__hi, s_imm__lo) @[Cat.scala 30:58]
    node _io_s_imm_T = bits(s_imm_, 11, 11) @[immgen.scala 20:40]
    node _io_s_imm_T_1 = bits(_io_s_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_s_imm_hi = mux(_io_s_imm_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node _io_s_imm_T_2 = cat(io_s_imm_hi, s_imm_) @[Cat.scala 30:58]
    node _io_s_imm_T_3 = asSInt(_io_s_imm_T_2) @[immgen.scala 20:55]
    node sb_imm__hi_hi_hi = bits(io_instruction, 31, 31) @[immgen.scala 22:42]
    node sb_imm__hi_hi_lo = bits(io_instruction, 7, 7) @[immgen.scala 22:61]
    node sb_imm__hi_lo = bits(io_instruction, 30, 25) @[immgen.scala 22:79]
    node sb_imm__lo_hi = bits(io_instruction, 11, 8) @[immgen.scala 22:101]
    node sb_imm__lo = cat(sb_imm__lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node sb_imm__hi_hi = cat(sb_imm__hi_hi_hi, sb_imm__hi_hi_lo) @[Cat.scala 30:58]
    node sb_imm__hi = cat(sb_imm__hi_hi, sb_imm__hi_lo) @[Cat.scala 30:58]
    node sb_imm_ = cat(sb_imm__hi, sb_imm__lo) @[Cat.scala 30:58]
    node _io_sb_imm_T = bits(sb_imm_, 12, 12) @[immgen.scala 23:43]
    node _io_sb_imm_T_1 = bits(_io_sb_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_sb_imm_hi = mux(_io_sb_imm_T_1, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node _io_sb_imm_T_2 = cat(io_sb_imm_hi, sb_imm_) @[Cat.scala 30:58]
    node _io_sb_imm_T_3 = add(_io_sb_imm_T_2, io_pc) @[immgen.scala 23:59]
    node _io_sb_imm_T_4 = tail(_io_sb_imm_T_3, 1) @[immgen.scala 23:59]
    node _io_sb_imm_T_5 = asSInt(_io_sb_imm_T_4) @[immgen.scala 23:68]
    node uj_imm__hi_hi_hi = bits(io_instruction, 31, 31) @[immgen.scala 25:42]
    node uj_imm__hi_hi_lo = bits(io_instruction, 19, 12) @[immgen.scala 25:61]
    node uj_imm__hi_lo = bits(io_instruction, 20, 20) @[immgen.scala 25:83]
    node uj_imm__lo_hi = bits(io_instruction, 30, 21) @[immgen.scala 25:102]
    node uj_imm__lo = cat(uj_imm__lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node uj_imm__hi_hi = cat(uj_imm__hi_hi_hi, uj_imm__hi_hi_lo) @[Cat.scala 30:58]
    node uj_imm__hi = cat(uj_imm__hi_hi, uj_imm__hi_lo) @[Cat.scala 30:58]
    node uj_imm_ = cat(uj_imm__hi, uj_imm__lo) @[Cat.scala 30:58]
    node _io_uj_imm_T = bits(uj_imm_, 20, 20) @[immgen.scala 26:43]
    node _io_uj_imm_T_1 = bits(_io_uj_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_uj_imm_hi = mux(_io_uj_imm_T_1, UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node _io_uj_imm_T_2 = cat(io_uj_imm_hi, uj_imm_) @[Cat.scala 30:58]
    node _io_uj_imm_T_3 = add(_io_uj_imm_T_2, io_pc) @[immgen.scala 26:59]
    node _io_uj_imm_T_4 = tail(_io_uj_imm_T_3, 1) @[immgen.scala 26:59]
    node _io_uj_imm_T_5 = asSInt(_io_uj_imm_T_4) @[immgen.scala 26:68]
    node _io_u_imm_T = bits(io_instruction, 31, 31) @[immgen.scala 28:50]
    node _io_u_imm_T_1 = bits(_io_u_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_u_imm_hi = mux(_io_u_imm_T_1, UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node io_u_imm_lo = bits(io_instruction, 31, 12) @[immgen.scala 28:70]
    node _io_u_imm_T_2 = cat(io_u_imm_hi, io_u_imm_lo) @[Cat.scala 30:58]
    node _io_u_imm_T_3 = shl(_io_u_imm_T_2, 12) @[immgen.scala 28:80]
    node _io_u_imm_T_4 = add(_io_u_imm_T_3, io_pc) @[immgen.scala 28:86]
    node _io_u_imm_T_5 = tail(_io_u_imm_T_4, 1) @[immgen.scala 28:86]
    node _io_u_imm_T_6 = asSInt(_io_u_imm_T_5) @[immgen.scala 28:94]
    node _io_i_imm_T = bits(io_instruction, 31, 31) @[immgen.scala 30:48]
    node _io_i_imm_T_1 = bits(_io_i_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_i_imm_hi = mux(_io_i_imm_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_i_imm_lo = bits(io_instruction, 31, 20) @[immgen.scala 30:68]
    node _io_i_imm_T_2 = cat(io_i_imm_hi, io_i_imm_lo) @[Cat.scala 30:58]
    node _io_i_imm_T_3 = asSInt(_io_i_imm_T_2) @[immgen.scala 30:78]
    io_s_imm <= _io_s_imm_T_3 @[immgen.scala 20:18]
    io_sb_imm <= _io_sb_imm_T_5 @[immgen.scala 23:19]
    io_uj_imm <= asSInt(bits(_io_uj_imm_T_5, 31, 0)) @[immgen.scala 26:19]
    io_u_imm <= asSInt(bits(_io_u_imm_T_6, 31, 0)) @[immgen.scala 28:18]
    io_i_imm <= _io_i_imm_T_3 @[immgen.scala 30:18]

  module InstMem :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<10>
    output io_inst : UInt<32>

    mem imemm : @[instmemory.scala 13:17]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_inst_MPORT
      read-under-write => undefined
    io_inst <= imemm.io_inst_MPORT.data @[instmemory.scala 16:9]
    imemm.io_inst_MPORT.addr <= io_addr @[instmemory.scala 16:22]
    imemm.io_inst_MPORT.en <= UInt<1>("h1") @[instmemory.scala 16:22]
    imemm.io_inst_MPORT.clk <= clock @[instmemory.scala 16:22]

  module jalr :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1 : SInt<32>
    input io_imm : SInt<32>
    output io_out : SInt<32>

    node _a_T = add(io_rs1, io_imm) @[jalr.scala 11:24]
    node _a_T_1 = tail(_a_T, 1) @[jalr.scala 11:24]
    node a = asSInt(_a_T_1) @[jalr.scala 11:24]
    node _io_out_T = and(a, asSInt(UInt<33>("hfffffffe"))) @[jalr.scala 12:21]
    node _io_out_T_1 = asSInt(_io_out_T) @[jalr.scala 12:21]
    io_out <= asSInt(bits(_io_out_T_1, 31, 0)) @[jalr.scala 12:16]

  module regfile :
    input clock : Clock
    input reset : UInt<1>
    input io_RegWrite : UInt<1>
    input io_rs1 : UInt<5>
    input io_rs2 : UInt<5>
    input io_rd : UInt<5>
    input io_WriteData : SInt<32>
    output io_rdata1 : SInt<32>
    output io_rdata2 : SInt<32>

    reg register_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_0) @[registerfile.scala 16:31]
    reg register_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_1) @[registerfile.scala 16:31]
    reg register_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_2) @[registerfile.scala 16:31]
    reg register_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_3) @[registerfile.scala 16:31]
    reg register_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_4) @[registerfile.scala 16:31]
    reg register_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_5) @[registerfile.scala 16:31]
    reg register_6 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_6) @[registerfile.scala 16:31]
    reg register_7 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_7) @[registerfile.scala 16:31]
    reg register_8 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_8) @[registerfile.scala 16:31]
    reg register_9 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_9) @[registerfile.scala 16:31]
    reg register_10 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_10) @[registerfile.scala 16:31]
    reg register_11 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_11) @[registerfile.scala 16:31]
    reg register_12 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_12) @[registerfile.scala 16:31]
    reg register_13 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_13) @[registerfile.scala 16:31]
    reg register_14 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_14) @[registerfile.scala 16:31]
    reg register_15 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_15) @[registerfile.scala 16:31]
    reg register_16 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_16) @[registerfile.scala 16:31]
    reg register_17 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_17) @[registerfile.scala 16:31]
    reg register_18 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_18) @[registerfile.scala 16:31]
    reg register_19 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_19) @[registerfile.scala 16:31]
    reg register_20 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_20) @[registerfile.scala 16:31]
    reg register_21 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_21) @[registerfile.scala 16:31]
    reg register_22 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_22) @[registerfile.scala 16:31]
    reg register_23 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_23) @[registerfile.scala 16:31]
    reg register_24 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_24) @[registerfile.scala 16:31]
    reg register_25 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_25) @[registerfile.scala 16:31]
    reg register_26 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_26) @[registerfile.scala 16:31]
    reg register_27 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_27) @[registerfile.scala 16:31]
    reg register_28 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_28) @[registerfile.scala 16:31]
    reg register_29 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_29) @[registerfile.scala 16:31]
    reg register_30 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_30) @[registerfile.scala 16:31]
    reg register_31 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register_31) @[registerfile.scala 16:31]
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_rs1), register_0) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_rs1), register_1, _GEN_0) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_rs1), register_2, _GEN_1) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_rs1), register_3, _GEN_2) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_rs1), register_4, _GEN_3) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_rs1), register_5, _GEN_4) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_rs1), register_6, _GEN_5) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_rs1), register_7, _GEN_6) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_rs1), register_8, _GEN_7) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_rs1), register_9, _GEN_8) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_rs1), register_10, _GEN_9) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_rs1), register_11, _GEN_10) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_rs1), register_12, _GEN_11) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_rs1), register_13, _GEN_12) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_rs1), register_14, _GEN_13) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_rs1), register_15, _GEN_14) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_rs1), register_16, _GEN_15) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_rs1), register_17, _GEN_16) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_rs1), register_18, _GEN_17) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_rs1), register_19, _GEN_18) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_rs1), register_20, _GEN_19) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_rs1), register_21, _GEN_20) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_rs1), register_22, _GEN_21) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_rs1), register_23, _GEN_22) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_rs1), register_24, _GEN_23) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_rs1), register_25, _GEN_24) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_rs1), register_26, _GEN_25) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_rs1), register_27, _GEN_26) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_rs1), register_28, _GEN_27) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_rs1), register_29, _GEN_28) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_rs1), register_30, _GEN_29) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_rs1), register_31, _GEN_30) @[registerfile.scala 18:19 registerfile.scala 18:19]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_rs2), register_0) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_rs2), register_1, _GEN_32) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_rs2), register_2, _GEN_33) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_rs2), register_3, _GEN_34) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_rs2), register_4, _GEN_35) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_rs2), register_5, _GEN_36) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_rs2), register_6, _GEN_37) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_rs2), register_7, _GEN_38) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_rs2), register_8, _GEN_39) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_rs2), register_9, _GEN_40) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_rs2), register_10, _GEN_41) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_rs2), register_11, _GEN_42) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_rs2), register_12, _GEN_43) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_rs2), register_13, _GEN_44) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_rs2), register_14, _GEN_45) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_rs2), register_15, _GEN_46) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_48 = mux(eq(UInt<5>("h10"), io_rs2), register_16, _GEN_47) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_49 = mux(eq(UInt<5>("h11"), io_rs2), register_17, _GEN_48) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_50 = mux(eq(UInt<5>("h12"), io_rs2), register_18, _GEN_49) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_51 = mux(eq(UInt<5>("h13"), io_rs2), register_19, _GEN_50) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_52 = mux(eq(UInt<5>("h14"), io_rs2), register_20, _GEN_51) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_53 = mux(eq(UInt<5>("h15"), io_rs2), register_21, _GEN_52) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_54 = mux(eq(UInt<5>("h16"), io_rs2), register_22, _GEN_53) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_55 = mux(eq(UInt<5>("h17"), io_rs2), register_23, _GEN_54) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_56 = mux(eq(UInt<5>("h18"), io_rs2), register_24, _GEN_55) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_57 = mux(eq(UInt<5>("h19"), io_rs2), register_25, _GEN_56) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_58 = mux(eq(UInt<5>("h1a"), io_rs2), register_26, _GEN_57) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_59 = mux(eq(UInt<5>("h1b"), io_rs2), register_27, _GEN_58) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_60 = mux(eq(UInt<5>("h1c"), io_rs2), register_28, _GEN_59) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_61 = mux(eq(UInt<5>("h1d"), io_rs2), register_29, _GEN_60) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_62 = mux(eq(UInt<5>("h1e"), io_rs2), register_30, _GEN_61) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _GEN_63 = mux(eq(UInt<5>("h1f"), io_rs2), register_31, _GEN_62) @[registerfile.scala 19:19 registerfile.scala 19:19]
    node _T = eq(io_RegWrite, UInt<1>("h1")) @[registerfile.scala 20:26]
    node _T_1 = neq(io_rd, UInt<1>("h0")) @[registerfile.scala 21:28]
    node _register_io_rd = io_WriteData @[registerfile.scala 21:60 registerfile.scala 21:60]
    node _GEN_64 = mux(eq(UInt<1>("h0"), io_rd), _register_io_rd, asSInt(UInt<1>("h0"))) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 17:21]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_rd), _register_io_rd, register_1) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_rd), _register_io_rd, register_2) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_rd), _register_io_rd, register_3) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_rd), _register_io_rd, register_4) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_rd), _register_io_rd, register_5) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_rd), _register_io_rd, register_6) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_rd), _register_io_rd, register_7) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_rd), _register_io_rd, register_8) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_rd), _register_io_rd, register_9) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_rd), _register_io_rd, register_10) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_rd), _register_io_rd, register_11) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_rd), _register_io_rd, register_12) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_rd), _register_io_rd, register_13) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_rd), _register_io_rd, register_14) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_rd), _register_io_rd, register_15) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_rd), _register_io_rd, register_16) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_rd), _register_io_rd, register_17) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_rd), _register_io_rd, register_18) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_rd), _register_io_rd, register_19) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_rd), _register_io_rd, register_20) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_rd), _register_io_rd, register_21) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_rd), _register_io_rd, register_22) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_rd), _register_io_rd, register_23) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_rd), _register_io_rd, register_24) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_rd), _register_io_rd, register_25) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_rd), _register_io_rd, register_26) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_rd), _register_io_rd, register_27) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_rd), _register_io_rd, register_28) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_rd), _register_io_rd, register_29) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_rd), _register_io_rd, register_30) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_rd), _register_io_rd, register_31) @[registerfile.scala 21:60 registerfile.scala 21:60 registerfile.scala 16:31]
    node _register_io_rd_0 = pad(asSInt(UInt<1>("h0")), 32) @[registerfile.scala 22:45 registerfile.scala 22:45]
    node _GEN_96 = mux(eq(UInt<1>("h0"), io_rd), _register_io_rd_0, asSInt(UInt<1>("h0"))) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 17:21]
    node _GEN_97 = mux(eq(UInt<1>("h1"), io_rd), _register_io_rd_0, register_1) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_98 = mux(eq(UInt<2>("h2"), io_rd), _register_io_rd_0, register_2) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_99 = mux(eq(UInt<2>("h3"), io_rd), _register_io_rd_0, register_3) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_100 = mux(eq(UInt<3>("h4"), io_rd), _register_io_rd_0, register_4) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_101 = mux(eq(UInt<3>("h5"), io_rd), _register_io_rd_0, register_5) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_102 = mux(eq(UInt<3>("h6"), io_rd), _register_io_rd_0, register_6) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_103 = mux(eq(UInt<3>("h7"), io_rd), _register_io_rd_0, register_7) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_104 = mux(eq(UInt<4>("h8"), io_rd), _register_io_rd_0, register_8) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_105 = mux(eq(UInt<4>("h9"), io_rd), _register_io_rd_0, register_9) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_106 = mux(eq(UInt<4>("ha"), io_rd), _register_io_rd_0, register_10) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_107 = mux(eq(UInt<4>("hb"), io_rd), _register_io_rd_0, register_11) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_108 = mux(eq(UInt<4>("hc"), io_rd), _register_io_rd_0, register_12) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_109 = mux(eq(UInt<4>("hd"), io_rd), _register_io_rd_0, register_13) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_110 = mux(eq(UInt<4>("he"), io_rd), _register_io_rd_0, register_14) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_111 = mux(eq(UInt<4>("hf"), io_rd), _register_io_rd_0, register_15) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_112 = mux(eq(UInt<5>("h10"), io_rd), _register_io_rd_0, register_16) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_113 = mux(eq(UInt<5>("h11"), io_rd), _register_io_rd_0, register_17) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_114 = mux(eq(UInt<5>("h12"), io_rd), _register_io_rd_0, register_18) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_115 = mux(eq(UInt<5>("h13"), io_rd), _register_io_rd_0, register_19) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_116 = mux(eq(UInt<5>("h14"), io_rd), _register_io_rd_0, register_20) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_117 = mux(eq(UInt<5>("h15"), io_rd), _register_io_rd_0, register_21) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_118 = mux(eq(UInt<5>("h16"), io_rd), _register_io_rd_0, register_22) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_119 = mux(eq(UInt<5>("h17"), io_rd), _register_io_rd_0, register_23) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_120 = mux(eq(UInt<5>("h18"), io_rd), _register_io_rd_0, register_24) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_121 = mux(eq(UInt<5>("h19"), io_rd), _register_io_rd_0, register_25) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_122 = mux(eq(UInt<5>("h1a"), io_rd), _register_io_rd_0, register_26) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_123 = mux(eq(UInt<5>("h1b"), io_rd), _register_io_rd_0, register_27) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_124 = mux(eq(UInt<5>("h1c"), io_rd), _register_io_rd_0, register_28) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_125 = mux(eq(UInt<5>("h1d"), io_rd), _register_io_rd_0, register_29) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_126 = mux(eq(UInt<5>("h1e"), io_rd), _register_io_rd_0, register_30) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_127 = mux(eq(UInt<5>("h1f"), io_rd), _register_io_rd_0, register_31) @[registerfile.scala 22:45 registerfile.scala 22:45 registerfile.scala 16:31]
    node _GEN_128 = mux(_T_1, _GEN_64, _GEN_96) @[registerfile.scala 21:43]
    node _GEN_129 = mux(_T_1, _GEN_65, _GEN_97) @[registerfile.scala 21:43]
    node _GEN_130 = mux(_T_1, _GEN_66, _GEN_98) @[registerfile.scala 21:43]
    node _GEN_131 = mux(_T_1, _GEN_67, _GEN_99) @[registerfile.scala 21:43]
    node _GEN_132 = mux(_T_1, _GEN_68, _GEN_100) @[registerfile.scala 21:43]
    node _GEN_133 = mux(_T_1, _GEN_69, _GEN_101) @[registerfile.scala 21:43]
    node _GEN_134 = mux(_T_1, _GEN_70, _GEN_102) @[registerfile.scala 21:43]
    node _GEN_135 = mux(_T_1, _GEN_71, _GEN_103) @[registerfile.scala 21:43]
    node _GEN_136 = mux(_T_1, _GEN_72, _GEN_104) @[registerfile.scala 21:43]
    node _GEN_137 = mux(_T_1, _GEN_73, _GEN_105) @[registerfile.scala 21:43]
    node _GEN_138 = mux(_T_1, _GEN_74, _GEN_106) @[registerfile.scala 21:43]
    node _GEN_139 = mux(_T_1, _GEN_75, _GEN_107) @[registerfile.scala 21:43]
    node _GEN_140 = mux(_T_1, _GEN_76, _GEN_108) @[registerfile.scala 21:43]
    node _GEN_141 = mux(_T_1, _GEN_77, _GEN_109) @[registerfile.scala 21:43]
    node _GEN_142 = mux(_T_1, _GEN_78, _GEN_110) @[registerfile.scala 21:43]
    node _GEN_143 = mux(_T_1, _GEN_79, _GEN_111) @[registerfile.scala 21:43]
    node _GEN_144 = mux(_T_1, _GEN_80, _GEN_112) @[registerfile.scala 21:43]
    node _GEN_145 = mux(_T_1, _GEN_81, _GEN_113) @[registerfile.scala 21:43]
    node _GEN_146 = mux(_T_1, _GEN_82, _GEN_114) @[registerfile.scala 21:43]
    node _GEN_147 = mux(_T_1, _GEN_83, _GEN_115) @[registerfile.scala 21:43]
    node _GEN_148 = mux(_T_1, _GEN_84, _GEN_116) @[registerfile.scala 21:43]
    node _GEN_149 = mux(_T_1, _GEN_85, _GEN_117) @[registerfile.scala 21:43]
    node _GEN_150 = mux(_T_1, _GEN_86, _GEN_118) @[registerfile.scala 21:43]
    node _GEN_151 = mux(_T_1, _GEN_87, _GEN_119) @[registerfile.scala 21:43]
    node _GEN_152 = mux(_T_1, _GEN_88, _GEN_120) @[registerfile.scala 21:43]
    node _GEN_153 = mux(_T_1, _GEN_89, _GEN_121) @[registerfile.scala 21:43]
    node _GEN_154 = mux(_T_1, _GEN_90, _GEN_122) @[registerfile.scala 21:43]
    node _GEN_155 = mux(_T_1, _GEN_91, _GEN_123) @[registerfile.scala 21:43]
    node _GEN_156 = mux(_T_1, _GEN_92, _GEN_124) @[registerfile.scala 21:43]
    node _GEN_157 = mux(_T_1, _GEN_93, _GEN_125) @[registerfile.scala 21:43]
    node _GEN_158 = mux(_T_1, _GEN_94, _GEN_126) @[registerfile.scala 21:43]
    node _GEN_159 = mux(_T_1, _GEN_95, _GEN_127) @[registerfile.scala 21:43]
    node _GEN_160 = mux(_T, _GEN_128, asSInt(UInt<1>("h0"))) @[registerfile.scala 20:34 registerfile.scala 17:21]
    node _GEN_161 = mux(_T, _GEN_129, register_1) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_162 = mux(_T, _GEN_130, register_2) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_163 = mux(_T, _GEN_131, register_3) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_164 = mux(_T, _GEN_132, register_4) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_165 = mux(_T, _GEN_133, register_5) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_166 = mux(_T, _GEN_134, register_6) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_167 = mux(_T, _GEN_135, register_7) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_168 = mux(_T, _GEN_136, register_8) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_169 = mux(_T, _GEN_137, register_9) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_170 = mux(_T, _GEN_138, register_10) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_171 = mux(_T, _GEN_139, register_11) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_172 = mux(_T, _GEN_140, register_12) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_173 = mux(_T, _GEN_141, register_13) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_174 = mux(_T, _GEN_142, register_14) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_175 = mux(_T, _GEN_143, register_15) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_176 = mux(_T, _GEN_144, register_16) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_177 = mux(_T, _GEN_145, register_17) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_178 = mux(_T, _GEN_146, register_18) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_179 = mux(_T, _GEN_147, register_19) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_180 = mux(_T, _GEN_148, register_20) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_181 = mux(_T, _GEN_149, register_21) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_182 = mux(_T, _GEN_150, register_22) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_183 = mux(_T, _GEN_151, register_23) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_184 = mux(_T, _GEN_152, register_24) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_185 = mux(_T, _GEN_153, register_25) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_186 = mux(_T, _GEN_154, register_26) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_187 = mux(_T, _GEN_155, register_27) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_188 = mux(_T, _GEN_156, register_28) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_189 = mux(_T, _GEN_157, register_29) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_190 = mux(_T, _GEN_158, register_30) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _GEN_191 = mux(_T, _GEN_159, register_31) @[registerfile.scala 20:34 registerfile.scala 16:31]
    node _register_WIRE_0 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_1 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_2 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_3 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_4 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_5 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_6 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_7 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_8 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_9 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_10 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_11 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_12 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_13 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_14 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_15 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_16 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_17 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_18 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_19 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_20 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_21 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_22 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_23 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_24 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_25 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_26 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_27 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_28 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_29 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_30 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_WIRE_31 = asSInt(UInt<32>("h0")) @[registerfile.scala 16:39 registerfile.scala 16:39]
    node _register_io_rs1 = _GEN_31 @[registerfile.scala 18:19]
    node _register_io_rs2 = _GEN_63 @[registerfile.scala 19:19]
    io_rdata1 <= _register_io_rs1 @[registerfile.scala 18:19]
    io_rdata2 <= _register_io_rs2 @[registerfile.scala 19:19]
    register_0 <= mux(reset, _register_WIRE_0, _GEN_160) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_1 <= mux(reset, _register_WIRE_1, _GEN_161) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_2 <= mux(reset, _register_WIRE_2, _GEN_162) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_3 <= mux(reset, _register_WIRE_3, _GEN_163) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_4 <= mux(reset, _register_WIRE_4, _GEN_164) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_5 <= mux(reset, _register_WIRE_5, _GEN_165) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_6 <= mux(reset, _register_WIRE_6, _GEN_166) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_7 <= mux(reset, _register_WIRE_7, _GEN_167) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_8 <= mux(reset, _register_WIRE_8, _GEN_168) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_9 <= mux(reset, _register_WIRE_9, _GEN_169) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_10 <= mux(reset, _register_WIRE_10, _GEN_170) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_11 <= mux(reset, _register_WIRE_11, _GEN_171) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_12 <= mux(reset, _register_WIRE_12, _GEN_172) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_13 <= mux(reset, _register_WIRE_13, _GEN_173) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_14 <= mux(reset, _register_WIRE_14, _GEN_174) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_15 <= mux(reset, _register_WIRE_15, _GEN_175) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_16 <= mux(reset, _register_WIRE_16, _GEN_176) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_17 <= mux(reset, _register_WIRE_17, _GEN_177) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_18 <= mux(reset, _register_WIRE_18, _GEN_178) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_19 <= mux(reset, _register_WIRE_19, _GEN_179) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_20 <= mux(reset, _register_WIRE_20, _GEN_180) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_21 <= mux(reset, _register_WIRE_21, _GEN_181) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_22 <= mux(reset, _register_WIRE_22, _GEN_182) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_23 <= mux(reset, _register_WIRE_23, _GEN_183) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_24 <= mux(reset, _register_WIRE_24, _GEN_184) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_25 <= mux(reset, _register_WIRE_25, _GEN_185) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_26 <= mux(reset, _register_WIRE_26, _GEN_186) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_27 <= mux(reset, _register_WIRE_27, _GEN_187) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_28 <= mux(reset, _register_WIRE_28, _GEN_188) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_29 <= mux(reset, _register_WIRE_29, _GEN_189) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_30 <= mux(reset, _register_WIRE_30, _GEN_190) @[registerfile.scala 16:31 registerfile.scala 16:31]
    register_31 <= mux(reset, _register_WIRE_31, _GEN_191) @[registerfile.scala 16:31 registerfile.scala 16:31]

  module IF_ID :
    input clock : Clock
    input reset : UInt<1>
    input io_pc : UInt<32>
    input io_pc4 : UInt<32>
    input io_ins : UInt<32>
    output io_pc_out : UInt<32>
    output io_ins_out : UInt<32>
    output io_pc4_out : UInt<32>

    reg reg_pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_pc) @[IF_ID.scala 21:29]
    reg reg_pc4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_pc4) @[IF_ID.scala 22:30]
    reg reg_ins : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_ins) @[IF_ID.scala 23:30]
    io_pc_out <= reg_pc @[IF_ID.scala 28:19]
    io_ins_out <= reg_ins @[IF_ID.scala 30:20]
    io_pc4_out <= reg_pc4 @[IF_ID.scala 29:20]
    reg_pc <= mux(reset, UInt<32>("h0"), io_pc) @[IF_ID.scala 21:29 IF_ID.scala 21:29 IF_ID.scala 25:16]
    reg_pc4 <= mux(reset, UInt<32>("h0"), io_pc4) @[IF_ID.scala 22:30 IF_ID.scala 22:30 IF_ID.scala 26:17]
    reg_ins <= mux(reset, UInt<32>("h0"), io_ins) @[IF_ID.scala 23:30 IF_ID.scala 23:30 IF_ID.scala 27:17]

  module ID_EX :
    input clock : Clock
    input reset : UInt<1>
    input io_pc : UInt<32>
    input io_pc4 : UInt<32>
    input io_MemWrite : UInt<1>
    input io_Branch : UInt<1>
    input io_MemRead : UInt<1>
    input io_RegWrite : UInt<1>
    input io_MemtoReg : UInt<1>
    input io_AluOp : UInt<3>
    input io_OpA_s : UInt<2>
    input io_OpB_s : UInt<1>
    input io_NextPc : UInt<2>
    input io_imm : SInt<32>
    input io_func3 : UInt<3>
    input io_func7 : UInt<1>
    input io_rs1 : SInt<32>
    input io_rs2 : SInt<32>
    input io_rs1_s : UInt<5>
    input io_rs2_s : UInt<5>
    input io_rd : UInt<5>
    output io_pc_out : UInt<32>
    output io_pc4_out : UInt<32>
    output io_MemWrite_out : UInt<1>
    output io_Branch_out : UInt<1>
    output io_MemRead_out : UInt<1>
    output io_RegWrite_out : UInt<1>
    output io_MemtoReg_out : UInt<1>
    output io_AluOp_out : UInt<3>
    output io_OpB_s_out : UInt<1>
    output io_OpA_s_out : UInt<2>
    output io_NextPc_out : UInt<2>
    output io_imm_out : SInt<32>
    output io_func3_out : UInt<3>
    output io_func7_out : UInt<1>
    output io_rs1_out : SInt<32>
    output io_rs2_out : SInt<32>
    output io_rs1_s_out : UInt<5>
    output io_rs2_s_out : UInt<5>
    output io_rd_out : UInt<5>

    reg pc_r : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc_r) @[ID_EX.scala 61:27]
    reg pc4_r : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc4_r) @[ID_EX.scala 62:28]
    reg inst_r : UInt<32>, clock with :
      reset => (UInt<1>("h0"), inst_r) @[ID_EX.scala 63:29]
    reg imm_r : SInt<32>, clock with :
      reset => (UInt<1>("h0"), imm_r) @[ID_EX.scala 73:28]
    reg func3_r : UInt<3>, clock with :
      reset => (UInt<1>("h0"), func3_r) @[ID_EX.scala 89:30]
    reg func7_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), func7_r) @[ID_EX.scala 92:30]
    reg rs1_r : SInt<32>, clock with :
      reset => (UInt<1>("h0"), rs1_r) @[ID_EX.scala 96:28]
    reg rs2_r : SInt<32>, clock with :
      reset => (UInt<1>("h0"), rs2_r) @[ID_EX.scala 99:28]
    reg rs1s_r : UInt<5>, clock with :
      reset => (UInt<1>("h0"), rs1s_r) @[ID_EX.scala 102:29]
    reg rs2s_r : UInt<5>, clock with :
      reset => (UInt<1>("h0"), rs2s_r) @[ID_EX.scala 105:29]
    reg rd_r : UInt<5>, clock with :
      reset => (UInt<1>("h0"), rd_r) @[ID_EX.scala 108:27]
    reg MemWrite_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemWrite_r) @[ID_EX.scala 112:33]
    reg Branch_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), Branch_r) @[ID_EX.scala 113:31]
    reg MemRead_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemRead_r) @[ID_EX.scala 114:32]
    reg RegWrite_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), RegWrite_r) @[ID_EX.scala 115:33]
    reg MemtoReg_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemtoReg_r) @[ID_EX.scala 116:33]
    reg AluOp_r : UInt<3>, clock with :
      reset => (UInt<1>("h0"), AluOp_r) @[ID_EX.scala 117:30]
    reg OpA_s_r : UInt<2>, clock with :
      reset => (UInt<1>("h0"), OpA_s_r) @[ID_EX.scala 118:30]
    reg OpB_s_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), OpB_s_r) @[ID_EX.scala 119:30]
    reg NextPc_r : UInt<2>, clock with :
      reset => (UInt<1>("h0"), NextPc_r) @[ID_EX.scala 120:31]
    io_pc_out <= pc_r @[ID_EX.scala 65:19]
    io_pc4_out <= pc4_r @[ID_EX.scala 67:20]
    io_MemWrite_out <= MemWrite_r @[ID_EX.scala 123:25]
    io_Branch_out <= Branch_r @[ID_EX.scala 125:23]
    io_MemRead_out <= MemRead_r @[ID_EX.scala 127:24]
    io_RegWrite_out <= RegWrite_r @[ID_EX.scala 129:25]
    io_MemtoReg_out <= MemtoReg_r @[ID_EX.scala 131:25]
    io_AluOp_out <= AluOp_r @[ID_EX.scala 133:22]
    io_OpB_s_out <= OpB_s_r @[ID_EX.scala 137:22]
    io_OpA_s_out <= OpA_s_r @[ID_EX.scala 135:22]
    io_NextPc_out <= NextPc_r @[ID_EX.scala 139:23]
    io_imm_out <= imm_r @[ID_EX.scala 75:20]
    io_func3_out <= func3_r @[ID_EX.scala 91:22]
    io_func7_out <= func7_r @[ID_EX.scala 94:22]
    io_rs1_out <= rs1_r @[ID_EX.scala 98:20]
    io_rs2_out <= rs2_r @[ID_EX.scala 101:20]
    io_rs1_s_out <= rs1s_r @[ID_EX.scala 104:22]
    io_rs2_s_out <= rs2s_r @[ID_EX.scala 107:22]
    io_rd_out <= rd_r @[ID_EX.scala 110:19]
    pc_r <= mux(reset, UInt<32>("h0"), io_pc) @[ID_EX.scala 61:27 ID_EX.scala 61:27 ID_EX.scala 64:14]
    pc4_r <= mux(reset, UInt<32>("h0"), io_pc4) @[ID_EX.scala 62:28 ID_EX.scala 62:28 ID_EX.scala 66:15]
    inst_r <= mux(reset, UInt<32>("h0"), inst_r) @[ID_EX.scala 63:29 ID_EX.scala 63:29 ID_EX.scala 63:29]
    imm_r <= mux(reset, asSInt(UInt<32>("h0")), io_imm) @[ID_EX.scala 73:28 ID_EX.scala 73:28 ID_EX.scala 74:15]
    func3_r <= mux(reset, UInt<3>("h0"), io_func3) @[ID_EX.scala 89:30 ID_EX.scala 89:30 ID_EX.scala 90:17]
    func7_r <= mux(reset, UInt<1>("h0"), io_func7) @[ID_EX.scala 92:30 ID_EX.scala 92:30 ID_EX.scala 93:17]
    rs1_r <= mux(reset, asSInt(UInt<32>("h0")), io_rs1) @[ID_EX.scala 96:28 ID_EX.scala 96:28 ID_EX.scala 97:15]
    rs2_r <= mux(reset, asSInt(UInt<32>("h0")), io_rs2) @[ID_EX.scala 99:28 ID_EX.scala 99:28 ID_EX.scala 100:15]
    rs1s_r <= mux(reset, UInt<5>("h0"), io_rs1_s) @[ID_EX.scala 102:29 ID_EX.scala 102:29 ID_EX.scala 103:16]
    rs2s_r <= mux(reset, UInt<5>("h0"), io_rs2_s) @[ID_EX.scala 105:29 ID_EX.scala 105:29 ID_EX.scala 106:16]
    rd_r <= mux(reset, UInt<5>("h0"), io_rd) @[ID_EX.scala 108:27 ID_EX.scala 108:27 ID_EX.scala 109:14]
    MemWrite_r <= mux(reset, UInt<1>("h0"), io_MemWrite) @[ID_EX.scala 112:33 ID_EX.scala 112:33 ID_EX.scala 122:20]
    Branch_r <= mux(reset, UInt<1>("h0"), io_Branch) @[ID_EX.scala 113:31 ID_EX.scala 113:31 ID_EX.scala 124:18]
    MemRead_r <= mux(reset, UInt<1>("h0"), io_MemRead) @[ID_EX.scala 114:32 ID_EX.scala 114:32 ID_EX.scala 126:19]
    RegWrite_r <= mux(reset, UInt<1>("h0"), io_RegWrite) @[ID_EX.scala 115:33 ID_EX.scala 115:33 ID_EX.scala 128:20]
    MemtoReg_r <= mux(reset, UInt<1>("h0"), io_MemtoReg) @[ID_EX.scala 116:33 ID_EX.scala 116:33 ID_EX.scala 130:20]
    AluOp_r <= mux(reset, UInt<3>("h0"), io_AluOp) @[ID_EX.scala 117:30 ID_EX.scala 117:30 ID_EX.scala 132:17]
    OpA_s_r <= mux(reset, UInt<2>("h0"), io_OpA_s) @[ID_EX.scala 118:30 ID_EX.scala 118:30 ID_EX.scala 134:17]
    OpB_s_r <= mux(reset, UInt<1>("h0"), io_OpB_s) @[ID_EX.scala 119:30 ID_EX.scala 119:30 ID_EX.scala 136:17]
    NextPc_r <= mux(reset, UInt<2>("h0"), io_NextPc) @[ID_EX.scala 120:31 ID_EX.scala 120:31 ID_EX.scala 138:18]

  module EX_MEM :
    input clock : Clock
    input reset : UInt<1>
    input io_MemWrite : UInt<1>
    input io_MemRead : UInt<1>
    input io_RegWrite : UInt<1>
    input io_MemtoReg : UInt<1>
    input io_rs2 : SInt<32>
    input io_alu : SInt<32>
    input io_rd : UInt<5>
    output io_rs2_out : SInt<32>
    output io_alu_out : SInt<32>
    output io_rd_out : UInt<5>
    output io_MemWrite_out : UInt<1>
    output io_MemRead_out : UInt<1>
    output io_RegWrite_out : UInt<1>
    output io_MemtoReg_out : UInt<1>

    reg MemWrite_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemWrite_r) @[EX_MEM.scala 26:29]
    reg MemRead_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemRead_r) @[EX_MEM.scala 27:32]
    reg RegWrite_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), RegWrite_r) @[EX_MEM.scala 28:33]
    reg MemtoReg_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemtoReg_r) @[EX_MEM.scala 29:33]
    reg rs2_r : SInt<32>, clock with :
      reset => (UInt<1>("h0"), rs2_r) @[EX_MEM.scala 30:24]
    reg alu_r : SInt<32>, clock with :
      reset => (UInt<1>("h0"), alu_r) @[EX_MEM.scala 31:24]
    reg rd_r : UInt<5>, clock with :
      reset => (UInt<1>("h0"), rd_r) @[EX_MEM.scala 32:23]
    io_rs2_out <= rs2_r @[EX_MEM.scala 42:20]
    io_alu_out <= alu_r @[EX_MEM.scala 44:20]
    io_rd_out <= rd_r @[EX_MEM.scala 46:19]
    io_MemWrite_out <= MemWrite_r @[EX_MEM.scala 34:25]
    io_MemRead_out <= MemRead_r @[EX_MEM.scala 36:24]
    io_RegWrite_out <= RegWrite_r @[EX_MEM.scala 38:25]
    io_MemtoReg_out <= MemtoReg_r @[EX_MEM.scala 40:25]
    MemWrite_r <= mux(reset, UInt<1>("h0"), io_MemWrite) @[EX_MEM.scala 26:29 EX_MEM.scala 26:29 EX_MEM.scala 33:20]
    MemRead_r <= mux(reset, UInt<1>("h0"), io_MemRead) @[EX_MEM.scala 27:32 EX_MEM.scala 27:32 EX_MEM.scala 35:19]
    RegWrite_r <= mux(reset, UInt<1>("h0"), io_RegWrite) @[EX_MEM.scala 28:33 EX_MEM.scala 28:33 EX_MEM.scala 37:20]
    MemtoReg_r <= mux(reset, UInt<1>("h0"), io_MemtoReg) @[EX_MEM.scala 29:33 EX_MEM.scala 29:33 EX_MEM.scala 39:20]
    rs2_r <= mux(reset, asSInt(UInt<32>("h0")), io_rs2) @[EX_MEM.scala 30:24 EX_MEM.scala 30:24 EX_MEM.scala 41:15]
    alu_r <= mux(reset, asSInt(UInt<32>("h0")), io_alu) @[EX_MEM.scala 31:24 EX_MEM.scala 31:24 EX_MEM.scala 43:15]
    rd_r <= mux(reset, UInt<5>("h0"), io_rd) @[EX_MEM.scala 32:23 EX_MEM.scala 32:23 EX_MEM.scala 45:14]

  module MEM_WB :
    input clock : Clock
    input reset : UInt<1>
    input io_RegWrite : UInt<1>
    input io_MemtoReg : UInt<1>
    input io_MemRead : UInt<1>
    input io_mem : SInt<32>
    input io_alu : SInt<32>
    input io_rd : UInt<5>
    output io_RegWrite_out : UInt<1>
    output io_MemtoReg_out : UInt<1>
    output io_MemRead_out : UInt<1>
    output io_mem_out : SInt<32>
    output io_alu_out : SInt<32>
    output io_rd_out : UInt<5>

    reg mem_r : SInt<32>, clock with :
      reset => (UInt<1>("h0"), mem_r) @[MEM_WB.scala 21:28]
    reg alu_r : SInt<32>, clock with :
      reset => (UInt<1>("h0"), alu_r) @[MEM_WB.scala 25:28]
    reg rd_r : UInt<5>, clock with :
      reset => (UInt<1>("h0"), rd_r) @[MEM_WB.scala 29:27]
    reg RegWrite_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), RegWrite_r) @[MEM_WB.scala 33:33]
    reg MemtoReg_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemtoReg_r) @[MEM_WB.scala 36:33]
    reg MemRead_r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemRead_r) @[MEM_WB.scala 40:32]
    io_RegWrite_out <= RegWrite_r @[MEM_WB.scala 35:25]
    io_MemtoReg_out <= MemtoReg_r @[MEM_WB.scala 38:25]
    io_MemRead_out <= MemRead_r @[MEM_WB.scala 42:24]
    io_mem_out <= mem_r @[MEM_WB.scala 23:20]
    io_alu_out <= alu_r @[MEM_WB.scala 27:20]
    io_rd_out <= rd_r @[MEM_WB.scala 31:19]
    mem_r <= mux(reset, asSInt(UInt<32>("h0")), io_mem) @[MEM_WB.scala 21:28 MEM_WB.scala 21:28 MEM_WB.scala 22:15]
    alu_r <= mux(reset, asSInt(UInt<32>("h0")), io_alu) @[MEM_WB.scala 25:28 MEM_WB.scala 25:28 MEM_WB.scala 26:15]
    rd_r <= mux(reset, UInt<5>("h0"), io_rd) @[MEM_WB.scala 29:27 MEM_WB.scala 29:27 MEM_WB.scala 30:14]
    RegWrite_r <= mux(reset, UInt<1>("h0"), io_RegWrite) @[MEM_WB.scala 33:33 MEM_WB.scala 33:33 MEM_WB.scala 34:20]
    MemtoReg_r <= mux(reset, UInt<1>("h0"), io_MemtoReg) @[MEM_WB.scala 36:33 MEM_WB.scala 36:33 MEM_WB.scala 37:20]
    MemRead_r <= mux(reset, UInt<1>("h0"), io_MemRead) @[MEM_WB.scala 40:32 MEM_WB.scala 40:32 MEM_WB.scala 41:19]

  module ForwardUnit :
    input clock : Clock
    input reset : UInt<1>
    input io_EX_MEM_rd : UInt<5>
    input io_ID_EX_rs1_s : UInt<5>
    input io_ID_EX_rs2_s : UInt<5>
    input io_EX_MEM_RegWrite : UInt<1>
    input io_MEM_WB_rd : UInt<5>
    input io_MEM_WB_RegWrite : UInt<1>
    output io_forward_a : UInt<2>
    output io_forward_b : UInt<2>

    node _T = eq(io_EX_MEM_RegWrite, UInt<1>("h1")) @[forwardingunit.scala 21:29]
    node _T_1 = neq(io_EX_MEM_rd, UInt<1>("h0")) @[forwardingunit.scala 21:53]
    node _T_2 = and(_T, _T_1) @[forwardingunit.scala 21:37]
    node _T_3 = eq(io_EX_MEM_rd, io_ID_EX_rs1_s) @[forwardingunit.scala 21:84]
    node _T_4 = and(_T_2, _T_3) @[forwardingunit.scala 21:68]
    node _T_5 = eq(io_EX_MEM_rd, io_ID_EX_rs2_s) @[forwardingunit.scala 21:121]
    node _T_6 = and(_T_4, _T_5) @[forwardingunit.scala 21:104]
    node _T_7 = eq(io_EX_MEM_RegWrite, UInt<1>("h1")) @[forwardingunit.scala 24:36]
    node _T_8 = neq(io_EX_MEM_rd, UInt<1>("h0")) @[forwardingunit.scala 24:60]
    node _T_9 = and(_T_7, _T_8) @[forwardingunit.scala 24:44]
    node _T_10 = eq(io_EX_MEM_rd, io_ID_EX_rs2_s) @[forwardingunit.scala 24:92]
    node _T_11 = and(_T_9, _T_10) @[forwardingunit.scala 24:75]
    node _T_12 = eq(io_EX_MEM_RegWrite, UInt<1>("h1")) @[forwardingunit.scala 26:36]
    node _T_13 = neq(io_EX_MEM_rd, UInt<1>("h0")) @[forwardingunit.scala 26:60]
    node _T_14 = and(_T_12, _T_13) @[forwardingunit.scala 26:44]
    node _T_15 = eq(io_EX_MEM_rd, io_ID_EX_rs1_s) @[forwardingunit.scala 26:92]
    node _T_16 = and(_T_14, _T_15) @[forwardingunit.scala 26:75]
    node _GEN_0 = mux(_T_16, UInt<1>("h1"), UInt<1>("h0")) @[forwardingunit.scala 26:113 forwardingunit.scala 27:30 forwardingunit.scala 16:18]
    node _GEN_1 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[forwardingunit.scala 24:113 forwardingunit.scala 25:30 forwardingunit.scala 17:18]
    node _GEN_2 = mux(_T_11, UInt<1>("h0"), _GEN_0) @[forwardingunit.scala 24:113 forwardingunit.scala 16:18]
    node _GEN_3 = mux(_T_6, UInt<1>("h1"), _GEN_2) @[forwardingunit.scala 21:142 forwardingunit.scala 22:22]
    node _GEN_4 = mux(_T_6, UInt<1>("h1"), _GEN_1) @[forwardingunit.scala 21:142 forwardingunit.scala 23:30]
    node _T_17 = eq(io_MEM_WB_RegWrite, UInt<1>("h1")) @[forwardingunit.scala 31:32]
    node _T_18 = neq(io_MEM_WB_rd, UInt<1>("h0")) @[forwardingunit.scala 31:56]
    node _T_19 = and(_T_17, _T_18) @[forwardingunit.scala 31:40]
    node _T_20 = eq(io_EX_MEM_RegWrite, UInt<1>("h1")) @[forwardingunit.scala 31:96]
    node _T_21 = neq(io_EX_MEM_rd, UInt<1>("h0")) @[forwardingunit.scala 31:125]
    node _T_22 = and(_T_20, _T_21) @[forwardingunit.scala 31:108]
    node _T_23 = eq(io_EX_MEM_rd, io_ID_EX_rs1_s) @[forwardingunit.scala 32:22]
    node _T_24 = and(_T_22, _T_23) @[forwardingunit.scala 31:141]
    node _T_25 = eq(io_EX_MEM_rd, io_ID_EX_rs2_s) @[forwardingunit.scala 32:59]
    node _T_26 = and(_T_24, _T_25) @[forwardingunit.scala 32:42]
    node _T_27 = not(_T_26) @[forwardingunit.scala 31:74]
    node _T_28 = and(_T_19, _T_27) @[forwardingunit.scala 31:71]
    node _T_29 = eq(io_MEM_WB_rd, io_ID_EX_rs1_s) @[forwardingunit.scala 32:96]
    node _T_30 = and(_T_28, _T_29) @[forwardingunit.scala 32:80]
    node _T_31 = eq(io_MEM_WB_rd, io_ID_EX_rs2_s) @[forwardingunit.scala 33:22]
    node _T_32 = and(_T_30, _T_31) @[forwardingunit.scala 32:116]
    node _T_33 = eq(io_MEM_WB_RegWrite, UInt<1>("h1")) @[forwardingunit.scala 36:40]
    node _T_34 = neq(io_MEM_WB_rd, UInt<1>("h0")) @[forwardingunit.scala 36:64]
    node _T_35 = and(_T_33, _T_34) @[forwardingunit.scala 36:48]
    node _T_36 = eq(io_EX_MEM_RegWrite, UInt<1>("h1")) @[forwardingunit.scala 36:104]
    node _T_37 = neq(io_EX_MEM_rd, UInt<1>("h0")) @[forwardingunit.scala 36:130]
    node _T_38 = and(_T_36, _T_37) @[forwardingunit.scala 36:113]
    node _T_39 = eq(io_EX_MEM_rd, io_ID_EX_rs2_s) @[forwardingunit.scala 37:19]
    node _T_40 = and(_T_38, _T_39) @[forwardingunit.scala 36:146]
    node _T_41 = not(_T_40) @[forwardingunit.scala 36:82]
    node _T_42 = and(_T_35, _T_41) @[forwardingunit.scala 36:79]
    node _T_43 = eq(io_MEM_WB_rd, io_ID_EX_rs2_s) @[forwardingunit.scala 37:57]
    node _T_44 = and(_T_42, _T_43) @[forwardingunit.scala 37:40]
    node _T_45 = eq(io_MEM_WB_RegWrite, UInt<1>("h1")) @[forwardingunit.scala 39:40]
    node _T_46 = neq(io_MEM_WB_rd, UInt<1>("h0")) @[forwardingunit.scala 39:64]
    node _T_47 = and(_T_45, _T_46) @[forwardingunit.scala 39:48]
    node _T_48 = eq(io_EX_MEM_RegWrite, UInt<1>("h1")) @[forwardingunit.scala 39:104]
    node _T_49 = neq(io_EX_MEM_rd, UInt<1>("h0")) @[forwardingunit.scala 39:129]
    node _T_50 = and(_T_48, _T_49) @[forwardingunit.scala 39:112]
    node _T_51 = eq(io_EX_MEM_rd, io_ID_EX_rs2_s) @[forwardingunit.scala 40:19]
    node _T_52 = and(_T_50, _T_51) @[forwardingunit.scala 39:145]
    node _T_53 = not(_T_52) @[forwardingunit.scala 39:82]
    node _T_54 = and(_T_47, _T_53) @[forwardingunit.scala 39:79]
    node _T_55 = eq(io_MEM_WB_rd, io_ID_EX_rs1_s) @[forwardingunit.scala 40:59]
    node _T_56 = and(_T_54, _T_55) @[forwardingunit.scala 40:41]
    node _GEN_5 = mux(_T_56, UInt<2>("h2"), _GEN_3) @[forwardingunit.scala 40:80 forwardingunit.scala 41:30]
    node _GEN_6 = mux(_T_44, UInt<2>("h2"), _GEN_4) @[forwardingunit.scala 37:78 forwardingunit.scala 38:30]
    node _GEN_7 = mux(_T_44, _GEN_3, _GEN_5) @[forwardingunit.scala 37:78]
    node _GEN_8 = mux(_T_32, UInt<2>("h2"), _GEN_7) @[forwardingunit.scala 33:43 forwardingunit.scala 34:30]
    node _GEN_9 = mux(_T_32, UInt<2>("h2"), _GEN_6) @[forwardingunit.scala 33:43 forwardingunit.scala 35:30]
    io_forward_a <= _GEN_8
    io_forward_b <= _GEN_9

  module HazardDetection :
    input clock : Clock
    input reset : UInt<1>
    input io_IF_ID_INST : UInt<32>
    input io_ID_EX_MEMREAD : UInt<1>
    input io_ID_EX_REGRD : UInt<5>
    input io_pc_in : UInt<32>
    input io_current_pc : UInt<32>
    output io_inst_forward : UInt<1>
    output io_pc_forward : UInt<1>
    output io_ctrl_forward : UInt<1>
    output io_inst_out : UInt<32>
    output io_pc_out : UInt<32>
    output io_current_pc_out : UInt<32>

    node rs1_sel = bits(io_IF_ID_INST, 19, 15) @[hazarddetect.scala 18:30]
    node rs2_sel = bits(io_IF_ID_INST, 24, 20) @[hazarddetect.scala 19:30]
    node _T = eq(io_ID_EX_MEMREAD, UInt<1>("h1")) @[hazarddetect.scala 20:25]
    node _T_1 = eq(io_ID_EX_REGRD, rs1_sel) @[hazarddetect.scala 20:56]
    node _T_2 = eq(io_ID_EX_REGRD, rs2_sel) @[hazarddetect.scala 20:88]
    node _T_3 = or(_T_1, _T_2) @[hazarddetect.scala 20:69]
    node _T_4 = and(_T, _T_3) @[hazarddetect.scala 20:36]
    node _GEN_0 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[hazarddetect.scala 20:103 hazarddetect.scala 21:23 hazarddetect.scala 29:21]
    node _GEN_1 = mux(_T_4, io_IF_ID_INST, io_IF_ID_INST) @[hazarddetect.scala 20:103 hazarddetect.scala 24:19 hazarddetect.scala 32:17]
    node _GEN_2 = mux(_T_4, io_pc_in, io_pc_in) @[hazarddetect.scala 20:103 hazarddetect.scala 25:17 hazarddetect.scala 33:15]
    node _GEN_3 = mux(_T_4, io_current_pc, io_current_pc) @[hazarddetect.scala 20:103 hazarddetect.scala 26:25 hazarddetect.scala 34:23]
    io_inst_forward <= _GEN_0
    io_pc_forward <= _GEN_0
    io_ctrl_forward <= _GEN_0
    io_inst_out <= _GEN_1
    io_pc_out <= _GEN_2
    io_current_pc_out <= _GEN_3

  module DecodeBranchForward :
    input clock : Clock
    input reset : UInt<1>
    input io_ID_EX_REGRD : UInt<5>
    input io_ID_EX_MEMRD : UInt<1>
    input io_EX_MEM_REGRD : UInt<5>
    input io_EX_MEM_MEMRD : UInt<1>
    input io_MEM_WB_REGRD : UInt<5>
    input io_MEM_WB_MEMRD : UInt<1>
    input io_rs1_sel : UInt<5>
    input io_rs2_sel : UInt<5>
    input io_ctrl_branch : UInt<1>
    output io_forward_rs1 : UInt<4>
    output io_forward_rs2 : UInt<4>

    node _T = eq(io_ctrl_branch, UInt<1>("h1")) @[BFU.scala 21:21]
    node _T_1 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 23:23]
    node _T_2 = neq(io_ID_EX_MEMRD, UInt<1>("h1")) @[BFU.scala 23:56]
    node _T_3 = and(_T_1, _T_2) @[BFU.scala 23:38]
    node _T_4 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 23:83]
    node _T_5 = and(_T_3, _T_4) @[BFU.scala 23:64]
    node _T_6 = eq(io_ID_EX_REGRD, io_rs2_sel) @[BFU.scala 23:118]
    node _T_7 = and(_T_5, _T_6) @[BFU.scala 23:99]
    node _T_8 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 26:30]
    node _T_9 = neq(io_ID_EX_MEMRD, UInt<1>("h1")) @[BFU.scala 26:63]
    node _T_10 = and(_T_8, _T_9) @[BFU.scala 26:45]
    node _T_11 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 26:90]
    node _T_12 = and(_T_10, _T_11) @[BFU.scala 26:71]
    node _T_13 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 28:30]
    node _T_14 = neq(io_ID_EX_MEMRD, UInt<1>("h1")) @[BFU.scala 28:63]
    node _T_15 = and(_T_13, _T_14) @[BFU.scala 28:45]
    node _T_16 = eq(io_ID_EX_REGRD, io_rs2_sel) @[BFU.scala 28:90]
    node _T_17 = and(_T_15, _T_16) @[BFU.scala 28:71]
    node _GEN_0 = mux(_T_17, UInt<1>("h1"), UInt<1>("h0")) @[BFU.scala 28:107 BFU.scala 29:20 BFU.scala 20:20]
    node _GEN_1 = mux(_T_12, UInt<1>("h1"), UInt<1>("h0")) @[BFU.scala 26:107 BFU.scala 27:20 BFU.scala 19:20]
    node _GEN_2 = mux(_T_12, UInt<1>("h0"), _GEN_0) @[BFU.scala 26:107 BFU.scala 20:20]
    node _GEN_3 = mux(_T_7, UInt<1>("h1"), _GEN_1) @[BFU.scala 23:135 BFU.scala 24:20]
    node _GEN_4 = mux(_T_7, UInt<1>("h1"), _GEN_2) @[BFU.scala 23:135 BFU.scala 25:20]
    node _T_18 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 33:24]
    node _T_19 = neq(io_EX_MEM_MEMRD, UInt<1>("h1")) @[BFU.scala 33:58]
    node _T_20 = and(_T_18, _T_19) @[BFU.scala 33:39]
    node _T_21 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 34:23]
    node _T_22 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 34:58]
    node _T_23 = and(_T_21, _T_22) @[BFU.scala 34:39]
    node _T_24 = eq(io_ID_EX_REGRD, io_rs2_sel) @[BFU.scala 34:93]
    node _T_25 = and(_T_23, _T_24) @[BFU.scala 34:74]
    node _T_26 = not(_T_25) @[BFU.scala 34:5]
    node _T_27 = and(_T_20, _T_26) @[BFU.scala 33:66]
    node _T_28 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 35:22]
    node _T_29 = and(_T_27, _T_28) @[BFU.scala 34:110]
    node _T_30 = eq(io_EX_MEM_REGRD, io_rs2_sel) @[BFU.scala 35:58]
    node _T_31 = and(_T_29, _T_30) @[BFU.scala 35:38]
    node _T_32 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 40:31]
    node _T_33 = neq(io_EX_MEM_MEMRD, UInt<1>("h1")) @[BFU.scala 40:65]
    node _T_34 = and(_T_32, _T_33) @[BFU.scala 40:46]
    node _T_35 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 41:23]
    node _T_36 = eq(io_ID_EX_REGRD, io_rs2_sel) @[BFU.scala 41:58]
    node _T_37 = and(_T_35, _T_36) @[BFU.scala 41:39]
    node _T_38 = not(_T_37) @[BFU.scala 41:5]
    node _T_39 = and(_T_34, _T_38) @[BFU.scala 40:73]
    node _T_40 = eq(io_EX_MEM_REGRD, io_rs2_sel) @[BFU.scala 42:22]
    node _T_41 = and(_T_39, _T_40) @[BFU.scala 41:75]
    node _T_42 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 46:31]
    node _T_43 = neq(io_EX_MEM_MEMRD, UInt<1>("h1")) @[BFU.scala 46:65]
    node _T_44 = and(_T_42, _T_43) @[BFU.scala 46:46]
    node _T_45 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 47:23]
    node _T_46 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 47:58]
    node _T_47 = and(_T_45, _T_46) @[BFU.scala 47:39]
    node _T_48 = not(_T_47) @[BFU.scala 47:5]
    node _T_49 = and(_T_44, _T_48) @[BFU.scala 46:73]
    node _T_50 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 48:22]
    node _T_51 = and(_T_49, _T_50) @[BFU.scala 47:75]
    node _T_52 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 52:31]
    node _T_53 = eq(io_EX_MEM_MEMRD, UInt<1>("h1")) @[BFU.scala 52:65]
    node _T_54 = and(_T_52, _T_53) @[BFU.scala 52:46]
    node _T_55 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 53:23]
    node _T_56 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 53:58]
    node _T_57 = and(_T_55, _T_56) @[BFU.scala 53:39]
    node _T_58 = eq(io_ID_EX_REGRD, io_rs2_sel) @[BFU.scala 53:93]
    node _T_59 = and(_T_57, _T_58) @[BFU.scala 53:74]
    node _T_60 = not(_T_59) @[BFU.scala 53:5]
    node _T_61 = and(_T_54, _T_60) @[BFU.scala 52:73]
    node _T_62 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 54:22]
    node _T_63 = and(_T_61, _T_62) @[BFU.scala 53:110]
    node _T_64 = eq(io_EX_MEM_REGRD, io_rs2_sel) @[BFU.scala 54:58]
    node _T_65 = and(_T_63, _T_64) @[BFU.scala 54:38]
    node _T_66 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 59:31]
    node _T_67 = eq(io_EX_MEM_MEMRD, UInt<1>("h1")) @[BFU.scala 59:65]
    node _T_68 = and(_T_66, _T_67) @[BFU.scala 59:46]
    node _T_69 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 60:23]
    node _T_70 = eq(io_ID_EX_REGRD, io_rs2_sel) @[BFU.scala 60:58]
    node _T_71 = and(_T_69, _T_70) @[BFU.scala 60:39]
    node _T_72 = not(_T_71) @[BFU.scala 60:5]
    node _T_73 = and(_T_68, _T_72) @[BFU.scala 59:73]
    node _T_74 = eq(io_EX_MEM_REGRD, io_rs2_sel) @[BFU.scala 61:22]
    node _T_75 = and(_T_73, _T_74) @[BFU.scala 60:75]
    node _T_76 = eq(io_ctrl_branch, UInt<1>("h1")) @[BFU.scala 65:30]
    node _T_77 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 65:57]
    node _T_78 = and(_T_76, _T_77) @[BFU.scala 65:38]
    node _T_79 = eq(io_EX_MEM_MEMRD, UInt<1>("h1")) @[BFU.scala 65:91]
    node _T_80 = and(_T_78, _T_79) @[BFU.scala 65:72]
    node _T_81 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 66:23]
    node _T_82 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 66:58]
    node _T_83 = and(_T_81, _T_82) @[BFU.scala 66:39]
    node _T_84 = not(_T_83) @[BFU.scala 66:5]
    node _T_85 = and(_T_80, _T_84) @[BFU.scala 65:99]
    node _T_86 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 67:22]
    node _T_87 = and(_T_85, _T_86) @[BFU.scala 66:75]
    node _GEN_5 = mux(_T_87, UInt<3>("h4"), _GEN_3) @[BFU.scala 67:39 BFU.scala 69:20]
    node _GEN_6 = mux(_T_75, UInt<3>("h4"), _GEN_4) @[BFU.scala 61:39 BFU.scala 63:20]
    node _GEN_7 = mux(_T_75, _GEN_3, _GEN_5) @[BFU.scala 61:39]
    node _GEN_8 = mux(_T_65, UInt<3>("h4"), _GEN_7) @[BFU.scala 54:75 BFU.scala 56:20]
    node _GEN_9 = mux(_T_65, UInt<3>("h4"), _GEN_6) @[BFU.scala 54:75 BFU.scala 57:20]
    node _GEN_10 = mux(_T_51, UInt<2>("h2"), _GEN_8) @[BFU.scala 48:39 BFU.scala 50:20]
    node _GEN_11 = mux(_T_51, _GEN_4, _GEN_9) @[BFU.scala 48:39]
    node _GEN_12 = mux(_T_41, UInt<2>("h2"), _GEN_11) @[BFU.scala 42:39 BFU.scala 44:20]
    node _GEN_13 = mux(_T_41, _GEN_3, _GEN_10) @[BFU.scala 42:39]
    node _GEN_14 = mux(_T_31, UInt<2>("h2"), _GEN_13) @[BFU.scala 35:75 BFU.scala 37:20]
    node _GEN_15 = mux(_T_31, UInt<2>("h2"), _GEN_12) @[BFU.scala 35:75 BFU.scala 38:20]
    node _T_88 = neq(io_MEM_WB_REGRD, UInt<1>("h0")) @[BFU.scala 74:24]
    node _T_89 = neq(io_MEM_WB_MEMRD, UInt<1>("h1")) @[BFU.scala 74:58]
    node _T_90 = and(_T_88, _T_89) @[BFU.scala 74:39]
    node _T_91 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 76:23]
    node _T_92 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 76:58]
    node _T_93 = and(_T_91, _T_92) @[BFU.scala 76:39]
    node _T_94 = eq(io_ID_EX_REGRD, io_rs2_sel) @[BFU.scala 76:93]
    node _T_95 = and(_T_93, _T_94) @[BFU.scala 76:74]
    node _T_96 = not(_T_95) @[BFU.scala 76:5]
    node _T_97 = and(_T_90, _T_96) @[BFU.scala 74:66]
    node _T_98 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 78:24]
    node _T_99 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 78:60]
    node _T_100 = and(_T_98, _T_99) @[BFU.scala 78:40]
    node _T_101 = eq(io_EX_MEM_REGRD, io_rs2_sel) @[BFU.scala 78:96]
    node _T_102 = and(_T_100, _T_101) @[BFU.scala 78:76]
    node _T_103 = not(_T_102) @[BFU.scala 78:5]
    node _T_104 = and(_T_97, _T_103) @[BFU.scala 76:110]
    node _T_105 = eq(io_MEM_WB_REGRD, io_rs1_sel) @[BFU.scala 79:22]
    node _T_106 = and(_T_104, _T_105) @[BFU.scala 78:113]
    node _T_107 = eq(io_MEM_WB_REGRD, io_rs2_sel) @[BFU.scala 79:58]
    node _T_108 = and(_T_106, _T_107) @[BFU.scala 79:38]
    node _T_109 = neq(io_MEM_WB_REGRD, UInt<1>("h0")) @[BFU.scala 85:31]
    node _T_110 = neq(io_MEM_WB_MEMRD, UInt<1>("h1")) @[BFU.scala 85:65]
    node _T_111 = and(_T_109, _T_110) @[BFU.scala 85:46]
    node _T_112 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 87:25]
    node _T_113 = eq(io_ID_EX_REGRD, io_rs2_sel) @[BFU.scala 87:60]
    node _T_114 = and(_T_112, _T_113) @[BFU.scala 87:41]
    node _T_115 = not(_T_114) @[BFU.scala 87:7]
    node _T_116 = and(_T_111, _T_115) @[BFU.scala 85:73]
    node _T_117 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 89:26]
    node _T_118 = eq(io_EX_MEM_REGRD, io_rs2_sel) @[BFU.scala 89:62]
    node _T_119 = and(_T_117, _T_118) @[BFU.scala 89:42]
    node _T_120 = not(_T_119) @[BFU.scala 89:7]
    node _T_121 = and(_T_116, _T_120) @[BFU.scala 87:77]
    node _T_122 = eq(io_MEM_WB_REGRD, io_rs2_sel) @[BFU.scala 90:24]
    node _T_123 = and(_T_121, _T_122) @[BFU.scala 89:79]
    node _T_124 = neq(io_MEM_WB_REGRD, UInt<1>("h0")) @[BFU.scala 95:31]
    node _T_125 = neq(io_MEM_WB_MEMRD, UInt<1>("h1")) @[BFU.scala 95:65]
    node _T_126 = and(_T_124, _T_125) @[BFU.scala 95:46]
    node _T_127 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 97:25]
    node _T_128 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 97:60]
    node _T_129 = and(_T_127, _T_128) @[BFU.scala 97:41]
    node _T_130 = not(_T_129) @[BFU.scala 97:7]
    node _T_131 = and(_T_126, _T_130) @[BFU.scala 95:73]
    node _T_132 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 99:26]
    node _T_133 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 99:62]
    node _T_134 = and(_T_132, _T_133) @[BFU.scala 99:42]
    node _T_135 = not(_T_134) @[BFU.scala 99:7]
    node _T_136 = and(_T_131, _T_135) @[BFU.scala 97:77]
    node _T_137 = eq(io_MEM_WB_REGRD, io_rs1_sel) @[BFU.scala 100:24]
    node _T_138 = and(_T_136, _T_137) @[BFU.scala 99:79]
    node _T_139 = neq(io_MEM_WB_REGRD, UInt<1>("h0")) @[BFU.scala 104:33]
    node _T_140 = eq(io_MEM_WB_MEMRD, UInt<1>("h1")) @[BFU.scala 104:67]
    node _T_141 = and(_T_139, _T_140) @[BFU.scala 104:48]
    node _T_142 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 106:23]
    node _T_143 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 106:58]
    node _T_144 = and(_T_142, _T_143) @[BFU.scala 106:39]
    node _T_145 = eq(io_ID_EX_REGRD, io_rs2_sel) @[BFU.scala 106:93]
    node _T_146 = and(_T_144, _T_145) @[BFU.scala 106:74]
    node _T_147 = not(_T_146) @[BFU.scala 106:5]
    node _T_148 = and(_T_141, _T_147) @[BFU.scala 104:75]
    node _T_149 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 108:24]
    node _T_150 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 108:60]
    node _T_151 = and(_T_149, _T_150) @[BFU.scala 108:40]
    node _T_152 = eq(io_EX_MEM_REGRD, io_rs2_sel) @[BFU.scala 108:96]
    node _T_153 = and(_T_151, _T_152) @[BFU.scala 108:76]
    node _T_154 = not(_T_153) @[BFU.scala 108:5]
    node _T_155 = and(_T_148, _T_154) @[BFU.scala 106:110]
    node _T_156 = eq(io_MEM_WB_REGRD, io_rs1_sel) @[BFU.scala 109:22]
    node _T_157 = and(_T_155, _T_156) @[BFU.scala 108:113]
    node _T_158 = eq(io_MEM_WB_REGRD, io_rs2_sel) @[BFU.scala 109:58]
    node _T_159 = and(_T_157, _T_158) @[BFU.scala 109:38]
    node _T_160 = neq(io_MEM_WB_REGRD, UInt<1>("h0")) @[BFU.scala 115:31]
    node _T_161 = eq(io_MEM_WB_MEMRD, UInt<1>("h1")) @[BFU.scala 115:65]
    node _T_162 = and(_T_160, _T_161) @[BFU.scala 115:46]
    node _T_163 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 117:25]
    node _T_164 = eq(io_ID_EX_REGRD, io_rs2_sel) @[BFU.scala 117:60]
    node _T_165 = and(_T_163, _T_164) @[BFU.scala 117:41]
    node _T_166 = not(_T_165) @[BFU.scala 117:7]
    node _T_167 = and(_T_162, _T_166) @[BFU.scala 115:73]
    node _T_168 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 119:26]
    node _T_169 = eq(io_EX_MEM_REGRD, io_rs2_sel) @[BFU.scala 119:62]
    node _T_170 = and(_T_168, _T_169) @[BFU.scala 119:42]
    node _T_171 = not(_T_170) @[BFU.scala 119:7]
    node _T_172 = and(_T_167, _T_171) @[BFU.scala 117:77]
    node _T_173 = eq(io_MEM_WB_REGRD, io_rs2_sel) @[BFU.scala 120:24]
    node _T_174 = and(_T_172, _T_173) @[BFU.scala 119:79]
    node _T_175 = neq(io_MEM_WB_REGRD, UInt<1>("h0")) @[BFU.scala 125:31]
    node _T_176 = eq(io_MEM_WB_MEMRD, UInt<1>("h1")) @[BFU.scala 125:65]
    node _T_177 = and(_T_175, _T_176) @[BFU.scala 125:46]
    node _T_178 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 127:25]
    node _T_179 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 127:60]
    node _T_180 = and(_T_178, _T_179) @[BFU.scala 127:41]
    node _T_181 = not(_T_180) @[BFU.scala 127:7]
    node _T_182 = and(_T_177, _T_181) @[BFU.scala 125:73]
    node _T_183 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 129:26]
    node _T_184 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 129:62]
    node _T_185 = and(_T_183, _T_184) @[BFU.scala 129:42]
    node _T_186 = not(_T_185) @[BFU.scala 129:7]
    node _T_187 = and(_T_182, _T_186) @[BFU.scala 127:77]
    node _T_188 = eq(io_MEM_WB_REGRD, io_rs1_sel) @[BFU.scala 130:24]
    node _T_189 = and(_T_187, _T_188) @[BFU.scala 129:78]
    node _GEN_16 = mux(_T_189, UInt<3>("h5"), _GEN_14) @[BFU.scala 130:41 BFU.scala 132:22]
    node _GEN_17 = mux(_T_174, UInt<3>("h5"), _GEN_15) @[BFU.scala 120:41 BFU.scala 122:22]
    node _GEN_18 = mux(_T_174, _GEN_14, _GEN_16) @[BFU.scala 120:41]
    node _GEN_19 = mux(_T_159, UInt<3>("h5"), _GEN_18) @[BFU.scala 109:75 BFU.scala 111:20]
    node _GEN_20 = mux(_T_159, UInt<3>("h5"), _GEN_17) @[BFU.scala 109:75 BFU.scala 112:20]
    node _GEN_21 = mux(_T_138, UInt<2>("h3"), _GEN_19) @[BFU.scala 100:41 BFU.scala 102:22]
    node _GEN_22 = mux(_T_138, _GEN_15, _GEN_20) @[BFU.scala 100:41]
    node _GEN_23 = mux(_T_123, UInt<2>("h3"), _GEN_22) @[BFU.scala 90:41 BFU.scala 92:22]
    node _GEN_24 = mux(_T_123, _GEN_14, _GEN_21) @[BFU.scala 90:41]
    node _GEN_25 = mux(_T_108, UInt<2>("h3"), _GEN_24) @[BFU.scala 79:75 BFU.scala 81:20]
    node _GEN_26 = mux(_T_108, UInt<2>("h3"), _GEN_23) @[BFU.scala 79:75 BFU.scala 82:20]
    node _T_190 = eq(io_ctrl_branch, UInt<1>("h0")) @[BFU.scala 137:26]
    node _T_191 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 139:29]
    node _T_192 = neq(io_ID_EX_MEMRD, UInt<1>("h1")) @[BFU.scala 139:62]
    node _T_193 = and(_T_191, _T_192) @[BFU.scala 139:44]
    node _T_194 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 139:89]
    node _T_195 = and(_T_193, _T_194) @[BFU.scala 139:70]
    node _GEN_27 = mux(_T_195, UInt<3>("h6"), UInt<1>("h0")) @[BFU.scala 139:109 BFU.scala 140:26 BFU.scala 19:20]
    node _T_196 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 144:30]
    node _T_197 = neq(io_EX_MEM_MEMRD, UInt<1>("h1")) @[BFU.scala 144:64]
    node _T_198 = and(_T_196, _T_197) @[BFU.scala 144:45]
    node _T_199 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 145:29]
    node _T_200 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 145:64]
    node _T_201 = and(_T_199, _T_200) @[BFU.scala 145:45]
    node _T_202 = not(_T_201) @[BFU.scala 145:11]
    node _T_203 = and(_T_198, _T_202) @[BFU.scala 144:72]
    node _T_204 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 146:28]
    node _T_205 = and(_T_203, _T_204) @[BFU.scala 145:81]
    node _T_206 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 151:37]
    node _T_207 = eq(io_EX_MEM_MEMRD, UInt<1>("h1")) @[BFU.scala 151:71]
    node _T_208 = and(_T_206, _T_207) @[BFU.scala 151:52]
    node _T_209 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 152:31]
    node _T_210 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 152:66]
    node _T_211 = and(_T_209, _T_210) @[BFU.scala 152:47]
    node _T_212 = not(_T_211) @[BFU.scala 152:13]
    node _T_213 = and(_T_208, _T_212) @[BFU.scala 151:79]
    node _T_214 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 153:30]
    node _T_215 = and(_T_213, _T_214) @[BFU.scala 152:83]
    node _GEN_28 = mux(_T_215, UInt<4>("h9"), _GEN_27) @[BFU.scala 153:47 BFU.scala 155:28]
    node _GEN_29 = mux(_T_205, UInt<3>("h7"), _GEN_28) @[BFU.scala 146:45 BFU.scala 148:26]
    node _T_216 = neq(io_MEM_WB_REGRD, UInt<1>("h0")) @[BFU.scala 161:30]
    node _T_217 = neq(io_MEM_WB_MEMRD, UInt<1>("h1")) @[BFU.scala 161:64]
    node _T_218 = and(_T_216, _T_217) @[BFU.scala 161:45]
    node _T_219 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 163:29]
    node _T_220 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 163:64]
    node _T_221 = and(_T_219, _T_220) @[BFU.scala 163:45]
    node _T_222 = not(_T_221) @[BFU.scala 163:11]
    node _T_223 = and(_T_218, _T_222) @[BFU.scala 161:72]
    node _T_224 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 165:30]
    node _T_225 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 165:66]
    node _T_226 = and(_T_224, _T_225) @[BFU.scala 165:46]
    node _T_227 = not(_T_226) @[BFU.scala 165:11]
    node _T_228 = and(_T_223, _T_227) @[BFU.scala 163:81]
    node _T_229 = eq(io_MEM_WB_REGRD, io_rs1_sel) @[BFU.scala 166:28]
    node _T_230 = and(_T_228, _T_229) @[BFU.scala 165:83]
    node _T_231 = neq(io_MEM_WB_REGRD, UInt<1>("h0")) @[BFU.scala 171:38]
    node _T_232 = eq(io_MEM_WB_MEMRD, UInt<1>("h1")) @[BFU.scala 171:72]
    node _T_233 = and(_T_231, _T_232) @[BFU.scala 171:53]
    node _T_234 = neq(io_ID_EX_REGRD, UInt<1>("h0")) @[BFU.scala 173:29]
    node _T_235 = eq(io_ID_EX_REGRD, io_rs1_sel) @[BFU.scala 173:64]
    node _T_236 = and(_T_234, _T_235) @[BFU.scala 173:45]
    node _T_237 = not(_T_236) @[BFU.scala 173:11]
    node _T_238 = and(_T_233, _T_237) @[BFU.scala 171:80]
    node _T_239 = neq(io_EX_MEM_REGRD, UInt<1>("h0")) @[BFU.scala 175:30]
    node _T_240 = eq(io_EX_MEM_REGRD, io_rs1_sel) @[BFU.scala 175:66]
    node _T_241 = and(_T_239, _T_240) @[BFU.scala 175:46]
    node _T_242 = not(_T_241) @[BFU.scala 175:11]
    node _T_243 = and(_T_238, _T_242) @[BFU.scala 173:81]
    node _T_244 = eq(io_MEM_WB_REGRD, io_rs1_sel) @[BFU.scala 176:28]
    node _T_245 = and(_T_243, _T_244) @[BFU.scala 175:83]
    node _GEN_30 = mux(_T_245, UInt<4>("ha"), _GEN_29) @[BFU.scala 176:45 BFU.scala 178:26]
    node _GEN_31 = mux(_T_230, UInt<4>("h8"), _GEN_30) @[BFU.scala 166:45 BFU.scala 168:26]
    node _GEN_32 = mux(_T_190, _GEN_31, UInt<1>("h0")) @[BFU.scala 137:35 BFU.scala 19:20]
    node _GEN_33 = mux(_T, _GEN_25, _GEN_32) @[BFU.scala 21:30]
    node _GEN_34 = mux(_T, _GEN_26, UInt<1>("h0")) @[BFU.scala 21:30 BFU.scala 20:20]
    io_forward_rs1 <= _GEN_33
    io_forward_rs2 <= _GEN_34

  module BranchLogic :
    input clock : Clock
    input reset : UInt<1>
    input io_in_rs1 : SInt<32>
    input io_in_rs2 : SInt<32>
    input io_in_func3 : UInt<3>
    output io_output : UInt<1>

    node _T = eq(io_in_func3, UInt<1>("h0")) @[branchlogic.scala 14:20]
    node _T_1 = eq(io_in_rs1, io_in_rs2) @[branchlogic.scala 16:20]
    node _GEN_0 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[branchlogic.scala 16:35 branchlogic.scala 17:17 branchlogic.scala 19:17]
    node _T_2 = eq(io_in_func3, UInt<1>("h1")) @[branchlogic.scala 21:27]
    node _T_3 = neq(io_in_rs1, io_in_rs2) @[branchlogic.scala 23:20]
    node _GEN_1 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[branchlogic.scala 23:35 branchlogic.scala 24:17 branchlogic.scala 26:17]
    node _T_4 = eq(io_in_func3, UInt<3>("h4")) @[branchlogic.scala 28:27]
    node _T_5 = lt(io_in_rs1, io_in_rs2) @[branchlogic.scala 30:20]
    node _GEN_2 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[branchlogic.scala 30:33 branchlogic.scala 31:17 branchlogic.scala 33:17]
    node _T_6 = eq(io_in_func3, UInt<3>("h5")) @[branchlogic.scala 35:27]
    node _T_7 = geq(io_in_rs1, io_in_rs2) @[branchlogic.scala 37:20]
    node _GEN_3 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[branchlogic.scala 37:34 branchlogic.scala 38:17 branchlogic.scala 40:17]
    node _T_8 = eq(io_in_func3, UInt<3>("h6")) @[branchlogic.scala 42:27]
    node _T_9 = asUInt(io_in_rs1) @[branchlogic.scala 44:20]
    node _T_10 = asUInt(io_in_rs2) @[branchlogic.scala 44:39]
    node _T_11 = lt(_T_9, _T_10) @[branchlogic.scala 44:27]
    node _GEN_4 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[branchlogic.scala 44:47 branchlogic.scala 45:17 branchlogic.scala 47:17]
    node _T_12 = eq(io_in_func3, UInt<3>("h7")) @[branchlogic.scala 49:27]
    node _T_13 = asUInt(io_in_rs1) @[branchlogic.scala 51:20]
    node _T_14 = asUInt(io_in_rs2) @[branchlogic.scala 51:40]
    node _T_15 = geq(_T_13, _T_14) @[branchlogic.scala 51:27]
    node _GEN_5 = mux(_T_15, UInt<1>("h1"), UInt<1>("h0")) @[branchlogic.scala 51:48 branchlogic.scala 52:17 branchlogic.scala 54:17]
    node _GEN_6 = mux(_T_12, _GEN_5, UInt<1>("h0")) @[branchlogic.scala 49:41 branchlogic.scala 57:15]
    node _GEN_7 = mux(_T_8, _GEN_4, _GEN_6) @[branchlogic.scala 42:41]
    node _GEN_8 = mux(_T_6, _GEN_3, _GEN_7) @[branchlogic.scala 35:41]
    node _GEN_9 = mux(_T_4, _GEN_2, _GEN_8) @[branchlogic.scala 28:41]
    node _GEN_10 = mux(_T_2, _GEN_1, _GEN_9) @[branchlogic.scala 21:41]
    node _GEN_11 = mux(_T, _GEN_0, _GEN_10) @[branchlogic.scala 14:34]
    io_output <= _GEN_11

  module StructuralDetector :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1_sel : UInt<5>
    input io_rs2_sel : UInt<5>
    input io_MEM_WB_regWr : UInt<1>
    input io_MEM_WB_REGRD : UInt<5>
    output io_fwd_rs1 : UInt<1>
    output io_fwd_rs2 : UInt<1>

    node _T = eq(io_MEM_WB_regWr, UInt<1>("h1")) @[SDU.scala 13:24]
    node _T_1 = eq(io_MEM_WB_REGRD, io_rs1_sel) @[SDU.scala 13:52]
    node _T_2 = and(_T, _T_1) @[SDU.scala 13:32]
    node _GEN_0 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[SDU.scala 13:68 SDU.scala 14:16 SDU.scala 16:16]
    node _T_3 = eq(io_MEM_WB_regWr, UInt<1>("h1")) @[SDU.scala 18:24]
    node _T_4 = eq(io_MEM_WB_REGRD, io_rs2_sel) @[SDU.scala 18:51]
    node _T_5 = and(_T_3, _T_4) @[SDU.scala 18:32]
    node _GEN_1 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[SDU.scala 18:67 SDU.scala 19:16 SDU.scala 21:16]
    io_fwd_rs1 <= _GEN_0
    io_fwd_rs2 <= _GEN_1

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<32>
    output io_addr : UInt<10>

    inst PCMod of pc @[top.scala 12:19]
    inst ALUMod of ALU_ @[top.scala 13:20]
    inst ALUcMod of alucontrol @[top.scala 14:22]
    inst CntrlDecMod of controldec @[top.scala 16:26]
    inst datamemMod of datamem @[top.scala 17:25]
    inst ImmgenMod of ImmdValGen1 @[top.scala 18:23]
    inst instmemMod of InstMem @[top.scala 19:25]
    inst jalrCompMod of jalr @[top.scala 20:26]
    inst regfileMod of regfile @[top.scala 21:25]
    inst ifid of IF_ID @[top.scala 22:18]
    inst idex of ID_EX @[top.scala 23:18]
    inst exemem of EX_MEM @[top.scala 24:20]
    inst memwb of MEM_WB @[top.scala 25:19]
    inst FU of ForwardUnit @[top.scala 26:16]
    inst HD of HazardDetection @[top.scala 27:16]
    inst BFU of DecodeBranchForward @[top.scala 28:17]
    inst BLU of BranchLogic @[top.scala 29:17]
    inst SDU of StructuralDetector @[top.scala 30:17]
    node _instmemMod_io_addr_T = bits(PCMod.io_pc, 11, 2) @[top.scala 44:34]
    node _CntrlDecMod_io_opcode_T = bits(ifid.io_ins_out, 6, 0) @[top.scala 50:41]
    node _regfileMod_io_rs1_T = bits(ifid.io_ins_out, 19, 15) @[top.scala 55:36]
    node _regfileMod_io_rs2_T = bits(ifid.io_ins_out, 24, 20) @[top.scala 56:37]
    node _SDU_io_rs1_sel_T = bits(ifid.io_ins_out, 19, 15) @[top.scala 68:34]
    node _SDU_io_rs2_sel_T = bits(ifid.io_ins_out, 24, 20) @[top.scala 69:34]
    node _T = eq(SDU.io_fwd_rs1, UInt<1>("h1")) @[top.scala 73:21]
    node _GEN_0 = mux(_T, regfileMod.io_WriteData, regfileMod.io_rdata1) @[top.scala 73:30 top.scala 74:15 top.scala 76:15]
    node _T_1 = eq(SDU.io_fwd_rs2, UInt<1>("h1")) @[top.scala 79:21]
    node _GEN_1 = mux(_T_1, regfileMod.io_WriteData, regfileMod.io_rdata2) @[top.scala 79:30 top.scala 80:15 top.scala 82:15]
    node _T_2 = eq(HD.io_ctrl_forward, UInt<1>("h1")) @[top.scala 85:25]
    node _GEN_2 = mux(_T_2, UInt<1>("h0"), CntrlDecMod.io_MemWrite) @[top.scala 85:37 top.scala 86:22 top.scala 97:22]
    node _GEN_3 = mux(_T_2, UInt<1>("h0"), CntrlDecMod.io_MemRead) @[top.scala 85:37 top.scala 87:21 top.scala 98:21]
    node _GEN_4 = mux(_T_2, UInt<1>("h0"), CntrlDecMod.io_Branch) @[top.scala 85:37 top.scala 88:20 top.scala 99:19]
    node _GEN_5 = mux(_T_2, UInt<1>("h0"), CntrlDecMod.io_RegWrite) @[top.scala 85:37 top.scala 89:22 top.scala 100:23]
    node _GEN_6 = mux(_T_2, UInt<1>("h0"), CntrlDecMod.io_Mem2Reg) @[top.scala 85:37 top.scala 90:21 top.scala 101:22]
    node _GEN_7 = mux(_T_2, UInt<1>("h0"), CntrlDecMod.io_aluop) @[top.scala 85:37 top.scala 91:19 top.scala 102:19]
    node _GEN_8 = mux(_T_2, UInt<1>("h0"), CntrlDecMod.io_opAsel) @[top.scala 85:37 top.scala 92:20 top.scala 103:19]
    node _GEN_9 = mux(_T_2, UInt<1>("h0"), CntrlDecMod.io_opBsel) @[top.scala 85:37 top.scala 93:20 top.scala 104:19]
    node _GEN_10 = mux(_T_2, UInt<1>("h0"), CntrlDecMod.io_nextPCsel) @[top.scala 85:37 top.scala 94:20 top.scala 105:20]
    node _BFU_io_rs1_sel_T = bits(ifid.io_ins_out, 19, 15) @[top.scala 115:34]
    node _BFU_io_rs2_sel_T = bits(ifid.io_ins_out, 24, 20) @[top.scala 116:34]
    node _BLU_io_in_func3_T = bits(ifid.io_ins_out, 14, 12) @[top.scala 121:35]
    node _T_3 = eq(BFU.io_forward_rs1, UInt<1>("h0")) @[top.scala 124:25]
    node _T_4 = eq(BFU.io_forward_rs1, UInt<1>("h1")) @[top.scala 128:32]
    node _T_5 = eq(BFU.io_forward_rs1, UInt<2>("h2")) @[top.scala 132:32]
    node _T_6 = eq(BFU.io_forward_rs1, UInt<2>("h3")) @[top.scala 136:32]
    node _T_7 = eq(BFU.io_forward_rs1, UInt<3>("h4")) @[top.scala 140:32]
    node _T_8 = eq(BFU.io_forward_rs1, UInt<3>("h5")) @[top.scala 144:32]
    node _T_9 = eq(BFU.io_forward_rs1, UInt<3>("h6")) @[top.scala 148:31]
    node _T_10 = eq(BFU.io_forward_rs1, UInt<3>("h7")) @[top.scala 152:32]
    node _T_11 = eq(BFU.io_forward_rs1, UInt<4>("h8")) @[top.scala 156:32]
    node _T_12 = eq(BFU.io_forward_rs1, UInt<4>("h9")) @[top.scala 160:32]
    node _T_13 = eq(BFU.io_forward_rs1, UInt<4>("ha")) @[top.scala 164:32]
    node _GEN_11 = mux(_T_13, regfileMod.io_WriteData, regfileMod.io_rdata1) @[top.scala 164:47 top.scala 166:24 top.scala 170:24]
    node _GEN_12 = mux(_T_13, regfileMod.io_rdata1, regfileMod.io_rdata1) @[top.scala 164:47 top.scala 167:19 top.scala 169:19]
    node _GEN_13 = mux(_T_12, datamemMod.io_out, _GEN_11) @[top.scala 160:47 top.scala 162:24]
    node _GEN_14 = mux(_T_12, regfileMod.io_rdata1, _GEN_12) @[top.scala 160:47 top.scala 163:19]
    node _GEN_15 = mux(_T_11, regfileMod.io_WriteData, _GEN_13) @[top.scala 156:47 top.scala 158:24]
    node _GEN_16 = mux(_T_11, regfileMod.io_rdata1, _GEN_14) @[top.scala 156:47 top.scala 159:18]
    node _GEN_17 = mux(_T_10, exemem.io_alu_out, _GEN_15) @[top.scala 152:47 top.scala 154:24]
    node _GEN_18 = mux(_T_10, regfileMod.io_rdata1, _GEN_16) @[top.scala 152:47 top.scala 155:19]
    node _GEN_19 = mux(_T_9, ALUMod.io_output, _GEN_17) @[top.scala 148:46 top.scala 150:24]
    node _GEN_20 = mux(_T_9, regfileMod.io_rdata1, _GEN_18) @[top.scala 148:46 top.scala 151:19]
    node _GEN_21 = mux(_T_8, regfileMod.io_WriteData, _GEN_20) @[top.scala 144:47 top.scala 146:16]
    node _GEN_22 = mux(_T_8, regfileMod.io_rdata1, _GEN_19) @[top.scala 144:47 top.scala 147:22]
    node _GEN_23 = mux(_T_7, datamemMod.io_out, _GEN_21) @[top.scala 140:47 top.scala 142:17]
    node _GEN_24 = mux(_T_7, regfileMod.io_rdata1, _GEN_22) @[top.scala 140:47 top.scala 143:22]
    node _GEN_25 = mux(_T_6, regfileMod.io_WriteData, _GEN_23) @[top.scala 136:47 top.scala 138:17]
    node _GEN_26 = mux(_T_6, regfileMod.io_rdata1, _GEN_24) @[top.scala 136:47 top.scala 139:22]
    node _GEN_27 = mux(_T_5, exemem.io_alu_out, _GEN_25) @[top.scala 132:47 top.scala 134:17]
    node _GEN_28 = mux(_T_5, regfileMod.io_rdata1, _GEN_26) @[top.scala 132:47 top.scala 135:22]
    node _GEN_29 = mux(_T_4, ALUMod.io_output, _GEN_27) @[top.scala 128:47 top.scala 130:17]
    node _GEN_30 = mux(_T_4, regfileMod.io_rdata1, _GEN_28) @[top.scala 128:47 top.scala 131:21]
    node _GEN_31 = mux(_T_3, regfileMod.io_rdata1, _GEN_29) @[top.scala 124:40 top.scala 126:17]
    node _GEN_32 = mux(_T_3, regfileMod.io_rdata1, _GEN_30) @[top.scala 124:40 top.scala 127:22]
    node _T_14 = eq(BFU.io_forward_rs2, UInt<1>("h0")) @[top.scala 173:25]
    node _T_15 = eq(BFU.io_forward_rs2, UInt<1>("h1")) @[top.scala 176:32]
    node _T_16 = eq(BFU.io_forward_rs2, UInt<2>("h2")) @[top.scala 179:32]
    node _T_17 = eq(BFU.io_forward_rs2, UInt<2>("h3")) @[top.scala 182:32]
    node _T_18 = eq(BFU.io_forward_rs2, UInt<3>("h4")) @[top.scala 185:32]
    node _T_19 = eq(BFU.io_forward_rs2, UInt<3>("h5")) @[top.scala 188:32]
    node _GEN_33 = mux(_T_19, regfileMod.io_WriteData, regfileMod.io_rdata2) @[top.scala 188:46 top.scala 190:18 top.scala 193:20]
    node _GEN_34 = mux(_T_18, datamemMod.io_out, _GEN_33) @[top.scala 185:46 top.scala 187:17]
    node _GEN_35 = mux(_T_17, regfileMod.io_WriteData, _GEN_34) @[top.scala 182:46 top.scala 184:18]
    node _GEN_36 = mux(_T_16, exemem.io_alu_out, _GEN_35) @[top.scala 179:46 top.scala 181:18]
    node _GEN_37 = mux(_T_15, ALUMod.io_output, _GEN_36) @[top.scala 176:46 top.scala 178:18]
    node _GEN_38 = mux(_T_14, regfileMod.io_rdata2, _GEN_37) @[top.scala 173:39 top.scala 175:18]
    node _T_20 = eq(HD.io_pc_forward, UInt<1>("h1")) @[top.scala 196:23]
    node _T_21 = eq(CntrlDecMod.io_nextPCsel, UInt<1>("h1")) @[top.scala 199:35]
    node _T_22 = eq(BLU.io_output, UInt<1>("h1")) @[top.scala 200:26]
    node _T_23 = eq(CntrlDecMod.io_Branch, UInt<1>("h1")) @[top.scala 200:59]
    node _T_24 = and(_T_22, _T_23) @[top.scala 200:34]
    node _PCMod_io_input_T = asUInt(ImmgenMod.io_sb_imm) @[top.scala 201:47]
    node _GEN_39 = mux(_T_24, _PCMod_io_input_T, PCMod.io_pc4) @[top.scala 200:68 top.scala 201:24 top.scala 206:24]
    node _GEN_40 = mux(_T_24, UInt<1>("h0"), PCMod.io_pc) @[top.scala 200:68 top.scala 202:20 top.scala 46:12]
    node _GEN_41 = mux(_T_24, UInt<1>("h0"), PCMod.io_pc4) @[top.scala 200:68 top.scala 203:21 top.scala 47:13]
    node _GEN_42 = mux(_T_24, UInt<1>("h0"), instmemMod.io_inst) @[top.scala 200:68 top.scala 204:21 top.scala 48:13]
    node _T_25 = eq(CntrlDecMod.io_nextPCsel, UInt<1>("h1")) @[top.scala 208:37]
    node _PCMod_io_input_T_1 = asUInt(ImmgenMod.io_uj_imm) @[top.scala 209:45]
    node _T_26 = eq(CntrlDecMod.io_nextPCsel, UInt<2>("h3")) @[top.scala 213:41]
    node _PCMod_io_input_T_2 = asUInt(jalrCompMod.io_out) @[top.scala 214:46]
    node _GEN_43 = mux(_T_26, _PCMod_io_input_T_2, PCMod.io_pc4) @[top.scala 213:54 top.scala 214:22 top.scala 220:22]
    node _GEN_44 = mux(_T_26, UInt<1>("h0"), PCMod.io_pc) @[top.scala 213:54 top.scala 215:18 top.scala 46:12]
    node _GEN_45 = mux(_T_26, UInt<1>("h0"), PCMod.io_pc4) @[top.scala 213:54 top.scala 216:19 top.scala 47:13]
    node _GEN_46 = mux(_T_26, UInt<1>("h0"), instmemMod.io_inst) @[top.scala 213:54 top.scala 217:19 top.scala 48:13]
    node _GEN_47 = mux(_T_25, _PCMod_io_input_T_1, _GEN_43) @[top.scala 208:50 top.scala 209:22]
    node _GEN_48 = mux(_T_25, UInt<1>("h0"), _GEN_44) @[top.scala 208:50 top.scala 210:18]
    node _GEN_49 = mux(_T_25, UInt<1>("h0"), _GEN_45) @[top.scala 208:50 top.scala 211:19]
    node _GEN_50 = mux(_T_25, UInt<1>("h0"), _GEN_46) @[top.scala 208:50 top.scala 212:19]
    node _GEN_51 = mux(_T_21, _GEN_39, _GEN_47) @[top.scala 199:48]
    node _GEN_52 = mux(_T_21, _GEN_40, _GEN_48) @[top.scala 199:48]
    node _GEN_53 = mux(_T_21, _GEN_41, _GEN_49) @[top.scala 199:48]
    node _GEN_54 = mux(_T_21, _GEN_42, _GEN_50) @[top.scala 199:48]
    node _GEN_55 = mux(_T_20, HD.io_pc_out, _GEN_51) @[top.scala 196:35 top.scala 197:18]
    node _GEN_56 = mux(_T_20, PCMod.io_pc, _GEN_52) @[top.scala 196:35 top.scala 46:12]
    node _GEN_57 = mux(_T_20, PCMod.io_pc4, _GEN_53) @[top.scala 196:35 top.scala 47:13]
    node _GEN_58 = mux(_T_20, instmemMod.io_inst, _GEN_54) @[top.scala 196:35 top.scala 48:13]
    node _T_27 = eq(HD.io_inst_forward, UInt<1>("h1")) @[top.scala 224:25]
    node _GEN_59 = mux(_T_27, HD.io_inst_out, instmemMod.io_inst) @[top.scala 224:37 top.scala 225:15 top.scala 228:17]
    node _GEN_60 = mux(_T_27, HD.io_current_pc_out, _GEN_56) @[top.scala 224:37 top.scala 226:14]
    node _idex_io_func3_T = bits(ifid.io_ins_out, 14, 12) @[top.scala 248:33]
    node _idex_io_func7_T = bits(ifid.io_ins_out, 30, 30) @[top.scala 249:33]
    node _idex_io_rs1_s_T = bits(ifid.io_ins_out, 19, 15) @[top.scala 252:33]
    node _idex_io_rs2_s_T = bits(ifid.io_ins_out, 24, 20) @[top.scala 253:33]
    node _idex_io_rd_T = bits(ifid.io_ins_out, 11, 7) @[top.scala 254:30]
    node _T_28 = eq(idex.io_OpA_s_out, UInt<2>("h2")) @[top.scala 266:25]
    node _ALUMod_io_in_A_T = asSInt(idex.io_pc4_out) @[top.scala 267:39]
    node _T_29 = eq(FU.io_forward_a, UInt<1>("h0")) @[top.scala 269:22]
    node _T_30 = eq(FU.io_forward_a, UInt<1>("h1")) @[top.scala 271:29]
    node _T_31 = eq(FU.io_forward_a, UInt<2>("h2")) @[top.scala 273:29]
    node _GEN_61 = mux(_T_31, regfileMod.io_WriteData, idex.io_rs1_out) @[top.scala 273:42 top.scala 274:18 top.scala 276:19]
    node _GEN_62 = mux(_T_30, exemem.io_alu_out, _GEN_61) @[top.scala 271:42 top.scala 272:19]
    node _GEN_63 = mux(_T_29, idex.io_rs1_out, _GEN_62) @[top.scala 269:35 top.scala 270:19]
    node _GEN_64 = mux(_T_28, _ALUMod_io_in_A_T, _GEN_63) @[top.scala 266:38 top.scala 267:20]
    node _T_32 = eq(CntrlDecMod.io_Ex_sel, UInt<1>("h0")) @[top.scala 280:29]
    node _T_33 = eq(CntrlDecMod.io_Ex_sel, UInt<1>("h0")) @[top.scala 282:42]
    node _T_34 = eq(CntrlDecMod.io_Ex_sel, UInt<1>("h0")) @[top.scala 284:42]
    node _GEN_65 = mux(_T_34, ImmgenMod.io_s_imm, asSInt(UInt<1>("h0"))) @[top.scala 284:54 top.scala 285:29 top.scala 286:33]
    node _GEN_66 = mux(_T_33, ImmgenMod.io_u_imm, _GEN_65) @[top.scala 282:54 top.scala 283:29]
    node _GEN_67 = mux(_T_32, ImmgenMod.io_i_imm, _GEN_66) @[top.scala 280:41 top.scala 281:29]
    node _T_35 = eq(idex.io_OpB_s_out, UInt<1>("h1")) @[top.scala 289:24]
    node _T_36 = eq(FU.io_forward_b, UInt<1>("h1")) @[top.scala 292:31]
    node _T_37 = eq(FU.io_forward_b, UInt<2>("h2")) @[top.scala 293:44]
    node _T_38 = eq(FU.io_forward_b, UInt<1>("h0")) @[top.scala 294:44]
    node _GEN_68 = mux(_T_38, idex.io_rs2_out, idex.io_rs2_out) @[top.scala 294:57 top.scala 294:72 top.scala 296:31]
    node _GEN_69 = mux(_T_37, regfileMod.io_WriteData, _GEN_68) @[top.scala 293:57 top.scala 293:72]
    node _GEN_70 = mux(_T_36, exemem.io_alu_out, _GEN_69) @[top.scala 292:43 top.scala 292:58]
    node _T_39 = eq(FU.io_forward_b, UInt<1>("h0")) @[top.scala 300:38]
    node _T_40 = eq(FU.io_forward_b, UInt<1>("h1")) @[top.scala 303:31]
    node _T_41 = eq(FU.io_forward_b, UInt<2>("h2")) @[top.scala 306:31]
    node _GEN_71 = mux(_T_41, regfileMod.io_WriteData, idex.io_rs2_out) @[top.scala 306:44 top.scala 307:20 top.scala 310:19]
    node _GEN_72 = mux(_T_40, exemem.io_alu_out, _GEN_71) @[top.scala 303:44 top.scala 304:20]
    node _GEN_73 = mux(_T_39, idex.io_rs2_out, _GEN_72) @[top.scala 300:51 top.scala 301:20]
    node _GEN_74 = mux(_T_35, idex.io_imm_out, _GEN_73) @[top.scala 289:32 top.scala 290:32]
    node _GEN_75 = mux(_T_35, _GEN_70, _GEN_73) @[top.scala 289:32]
    node _datamemMod_io_Addr_T = bits(exemem.io_alu_out, 9, 2) @[top.scala 361:41]
    node _regfileMod_io_WriteData_T = eq(memwb.io_MemtoReg_out, UInt<1>("h0")) @[top.scala 377:24]
    node _regfileMod_io_WriteData_T_1 = eq(memwb.io_MemtoReg_out, UInt<1>("h1")) @[top.scala 378:24]
    node _regfileMod_io_WriteData_T_2 = mux(_regfileMod_io_WriteData_T_1, memwb.io_mem_out, asSInt(UInt<1>("h0"))) @[Mux.scala 98:16]
    node _regfileMod_io_WriteData_T_3 = mux(_regfileMod_io_WriteData_T, memwb.io_alu_out, _regfileMod_io_WriteData_T_2) @[Mux.scala 98:16]
    io_out <= UInt<1>("h0") @[top.scala 382:8]
    io_addr <= instmemMod.io_addr @[top.scala 51:9]
    PCMod.clock <= clock
    PCMod.reset <= reset
    PCMod.io_input <= _GEN_55
    ALUMod.clock <= clock
    ALUMod.reset <= reset
    ALUMod.io_in_A <= _GEN_64
    ALUMod.io_in_B <= _GEN_74
    ALUMod.io_aluc <= ALUcMod.io_aluc @[top.scala 315:16]
    ALUcMod.clock <= clock
    ALUcMod.reset <= reset
    ALUcMod.io_aluOp <= idex.io_AluOp_out @[top.scala 64:18]
    ALUcMod.io_func3 <= idex.io_func3_out @[top.scala 65:18]
    ALUcMod.io_func7 <= idex.io_func7_out @[top.scala 66:18]
    CntrlDecMod.clock <= clock
    CntrlDecMod.reset <= reset
    CntrlDecMod.io_opcode <= _CntrlDecMod_io_opcode_T @[top.scala 50:23]
    datamemMod.clock <= clock
    datamemMod.reset <= reset
    datamemMod.io_Addr <= _datamemMod_io_Addr_T @[top.scala 361:20]
    datamemMod.io_Data <= exemem.io_rs2_out @[top.scala 362:20]
    datamemMod.io_MemWrite <= exemem.io_MemWrite_out @[top.scala 363:24]
    datamemMod.io_MemRead <= exemem.io_MemRead @[top.scala 364:23]
    ImmgenMod.clock <= clock
    ImmgenMod.reset <= reset
    ImmgenMod.io_instruction <= ifid.io_ins_out @[top.scala 60:26]
    ImmgenMod.io_pc <= ifid.io_pc_out @[top.scala 61:17]
    instmemMod.clock <= clock
    instmemMod.reset <= reset
    instmemMod.io_addr <= _instmemMod_io_addr_T @[top.scala 44:20]
    jalrCompMod.clock <= clock
    jalrCompMod.reset <= reset
    jalrCompMod.io_rs1 <= _GEN_32
    jalrCompMod.io_imm <= ImmgenMod.io_i_imm @[top.scala 123:20]
    regfileMod.clock <= clock
    regfileMod.reset <= reset
    regfileMod.io_RegWrite <= memwb.io_RegWrite_out @[top.scala 380:24]
    regfileMod.io_rs1 <= _regfileMod_io_rs1_T @[top.scala 55:18]
    regfileMod.io_rs2 <= _regfileMod_io_rs2_T @[top.scala 56:19]
    regfileMod.io_rd <= memwb.io_rd_out @[top.scala 381:18]
    regfileMod.io_WriteData <= _regfileMod_io_WriteData_T_3 @[top.scala 376:25]
    ifid.clock <= clock
    ifid.reset <= reset
    ifid.io_pc <= _GEN_60
    ifid.io_pc4 <= _GEN_57
    ifid.io_ins <= _GEN_59
    idex.clock <= clock
    idex.reset <= reset
    idex.io_pc <= ifid.io_pc_out @[top.scala 237:12]
    idex.io_pc4 <= ifid.io_pc4_out @[top.scala 238:13]
    idex.io_MemWrite <= CntrlDecMod.io_MemWrite @[top.scala 239:17]
    idex.io_Branch <= CntrlDecMod.io_Branch @[top.scala 240:16]
    idex.io_MemRead <= CntrlDecMod.io_MemRead @[top.scala 241:17]
    idex.io_RegWrite <= CntrlDecMod.io_RegWrite @[top.scala 242:18]
    idex.io_MemtoReg <= CntrlDecMod.io_Mem2Reg @[top.scala 243:18]
    idex.io_AluOp <= CntrlDecMod.io_aluop @[top.scala 244:15]
    idex.io_OpA_s <= CntrlDecMod.io_opAsel @[top.scala 245:15]
    idex.io_OpB_s <= CntrlDecMod.io_opBsel @[top.scala 246:15]
    idex.io_NextPc <= CntrlDecMod.io_nextPCsel @[top.scala 247:16]
    idex.io_imm <= _GEN_67
    idex.io_func3 <= _idex_io_func3_T @[top.scala 248:15]
    idex.io_func7 <= _idex_io_func7_T @[top.scala 249:15]
    idex.io_rs1 <= regfileMod.io_rdata1 @[top.scala 250:13]
    idex.io_rs2 <= regfileMod.io_rdata2 @[top.scala 251:13]
    idex.io_rs1_s <= _idex_io_rs1_s_T @[top.scala 252:15]
    idex.io_rs2_s <= _idex_io_rs2_s_T @[top.scala 253:15]
    idex.io_rd <= _idex_io_rd_T @[top.scala 254:12]
    exemem.clock <= clock
    exemem.reset <= reset
    exemem.io_MemWrite <= idex.io_MemWrite_out @[top.scala 332:20]
    exemem.io_MemRead <= idex.io_MemRead_out @[top.scala 333:19]
    exemem.io_RegWrite <= idex.io_RegWrite_out @[top.scala 335:20]
    exemem.io_MemtoReg <= idex.io_MemtoReg_out @[top.scala 336:20]
    exemem.io_rs2 <= idex.io_rs2_out @[top.scala 337:15]
    exemem.io_alu <= ALUMod.io_output @[top.scala 338:15]
    exemem.io_rd <= idex.io_rd_out @[top.scala 339:14]
    memwb.clock <= clock
    memwb.reset <= reset
    memwb.io_RegWrite <= exemem.io_RegWrite_out @[top.scala 366:19]
    memwb.io_MemtoReg <= exemem.io_MemtoReg_out @[top.scala 367:19]
    memwb.io_MemRead <= exemem.io_MemRead_out @[top.scala 368:18]
    memwb.io_mem <= datamemMod.io_out @[top.scala 369:14]
    memwb.io_alu <= exemem.io_alu_out @[top.scala 370:14]
    memwb.io_rd <= exemem.io_rd_out @[top.scala 371:13]
    FU.clock <= clock
    FU.reset <= reset
    FU.io_EX_MEM_rd <= exemem.io_rd_out @[top.scala 31:17]
    FU.io_ID_EX_rs1_s <= idex.io_rs1_s_out @[top.scala 32:19]
    FU.io_ID_EX_rs2_s <= idex.io_rs2_s_out @[top.scala 33:19]
    FU.io_EX_MEM_RegWrite <= exemem.io_RegWrite_out @[top.scala 34:23]
    FU.io_MEM_WB_rd <= memwb.io_rd_out @[top.scala 35:17]
    FU.io_MEM_WB_RegWrite <= memwb.io_RegWrite_out @[top.scala 36:23]
    HD.clock <= clock
    HD.reset <= reset
    HD.io_IF_ID_INST <= ifid.io_ins_out @[top.scala 260:18]
    HD.io_ID_EX_MEMREAD <= idex.io_MemRead_out @[top.scala 261:21]
    HD.io_ID_EX_REGRD <= idex.io_rd_out @[top.scala 262:19]
    HD.io_pc_in <= ifid.io_pc4_out @[top.scala 263:13]
    HD.io_current_pc <= ifid.io_pc_out @[top.scala 264:18]
    BFU.clock <= clock
    BFU.reset <= reset
    BFU.io_ID_EX_REGRD <= idex.io_rd_out @[top.scala 109:20]
    BFU.io_ID_EX_MEMRD <= idex.io_MemRead_out @[top.scala 110:20]
    BFU.io_EX_MEM_REGRD <= exemem.io_rd_out @[top.scala 111:21]
    BFU.io_EX_MEM_MEMRD <= exemem.io_MemRead_out @[top.scala 113:21]
    BFU.io_MEM_WB_REGRD <= memwb.io_rd_out @[top.scala 112:21]
    BFU.io_MEM_WB_MEMRD <= memwb.io_MemRead_out @[top.scala 114:21]
    BFU.io_rs1_sel <= _BFU_io_rs1_sel_T @[top.scala 115:16]
    BFU.io_rs2_sel <= _BFU_io_rs2_sel_T @[top.scala 116:16]
    BFU.io_ctrl_branch <= CntrlDecMod.io_Branch @[top.scala 117:20]
    BLU.clock <= clock
    BLU.reset <= reset
    BLU.io_in_rs1 <= _GEN_31
    BLU.io_in_rs2 <= _GEN_38
    BLU.io_in_func3 <= _BLU_io_in_func3_T @[top.scala 121:17]
    SDU.clock <= clock
    SDU.reset <= reset
    SDU.io_rs1_sel <= _SDU_io_rs1_sel_T @[top.scala 68:16]
    SDU.io_rs2_sel <= _SDU_io_rs2_sel_T @[top.scala 69:16]
    SDU.io_MEM_WB_regWr <= memwb.io_RegWrite_out @[top.scala 71:21]
    SDU.io_MEM_WB_REGRD <= memwb.io_rd_out @[top.scala 70:21]
