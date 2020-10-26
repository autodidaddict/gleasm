import gleam/option.{Option}

pub type Instruction {
  // Parametric instructions represented by a single byte code
  Drop
  Select
  // Variable instructions are byte code followed by encoded index
  GetLocal(idx: Int)
  SetLocal(idx: Int)
  TeeLocal(idx: Int)
  GetGLobal(idx: Int)
  SetGlobal(idx: Int)
  // Memory instructions are byte codes followed by memarg (align, offset)
  I32Load(align: Int, offset: Int)
  I64Load(align: Int, offset: Int)
  F32Load(align: Int, offset: Int)
  F64Load(align: Int, offset: Int)
  I32Load8Signed(align: Int, offset: Int)
  I32Load8Unsigned(align: Int, offset: Int)
  I32Load16Signed(align: Int, offset: Int)
  I32Load16Unsigned(align: Int, offset: Int)
  I64Load8Signed(align: Int, offset: Int)
  I64Load8Unsigned(align: Int, offset: Int)
  I64Load16Signed(align: Int, offset: Int)
  I64Load16Unsigned(align: Int, offset: Int)
  I64Load32Signe(align: Int, offset: Int)
  I64Load32Unsigned(align: Int, offset: Int)
  I32Store(align: Int, offset: Int)
  I64Store(align: Int, offset: Int)
  F32Store(align: Int, offset: Int)
  F64Store(align: Int, offset: Int)
  I32Store8(align: Int, offset: Int)
  I32Store16(align: Int, offset: Int)
  I64Store8(align: Int, offset: Int)
  I64Store16(align: Int, offset: Int)
  I64Store32(align: Int, offset: Int)
  MemorySize
  // memarg is 0x00 in v1.1 spec
  MemoryGrow
  // memarg is 0x00 in v1.1 spec
  // Const instructions are bytecodes followed by numeric literal
  I32Const(val: Int)
  I64Const(val: Int)
  F32Consst(val: Float)
  F64Const(val: Float)
  // Remaining numeric instructions are bare opcodes with no operands
  I32Eqz
  I32Eq
  I32NotEqual
  I32LessThanSigned
  I32LessThanUnsigned
  I32GreaterThanSigned
  I32GreaterThanUnsigned
  I32LessThanOrEqualSigned
  I32LessThanOrEqualUnsigned
  I32GreaterThanOrEqualSigned
  I32GreaterThanOrEqualUnsigned

  I64Eqz
  I64Eq
  I64NotEqual
  I64LessThanSigned
  I64LessThanUnsigned
  I64GreaterThanSigned
  I64GreaterThanUnsigned
  I64LessThanOrEqualSigned
  I64LessThanOrEqualUnsigned
  I64GreaterThanOrEqualSigned
  I64GreaterThanOrEqualUnsigned

  F32Eq
  F32NotEqual
  F32LessThan
  F32GreaterThan
  F32LessThanOrEqual
  F32GreaterThanOrEqual

  F64Eq
  F64NotEqual
  F64LessThan
  F64GreaterThan
  F64LessThanOrEqual
  F64GreaterThanOrEqual

  I32LeadingZeros
  I32TrailingZeros
  I32PopCount
  I32Add
  I32Subtract
  I32Multiply
  I32DivideSigned
  I32DivideUnsigned
  I32RemainderSigned
  I32RemainderUnsigned
  I32And
  I32Or
  I32Xor
  I32ShiftLeft
  I32ShiftRightSigned
  I32ShiftRightUnsigned
  I32RotateLeft
  I32RotateRight
  I64LeadingZeros
  I64TrailingZeros
  I64PopCount
  I64Add
  I64Subtract
  I64Multiply
  I64DivideSigned
  I64DivideUnsigned
  I64RemainderSigned
  I64RemainderUnsigned
  I64And
  I64Or
  I64Xor
  I64ShiftLeft
  I64ShiftRightSigned
  I64ShiftRightUnsigned
  I64RotateLeft
  I64RotateRight

  F32Abs
  F32Neg
  F32Ceiling
  F32Floor
  F32Trunc
  F32Nearest
  F32SquareRoot
  F32Add
  F32Sub
  F32Mul
  F32Div
  F32Min
  F32Max
  F32CopySign

  F64Abs
  F64Neg
  F64Ceiling
  F64Floor
  F64Trunc
  F64Nearest
  F64SquareRoot
  F64Add
  F64Sub
  F64Mul
  F64Div
  F64Min
  F64Max
  F64CopySign

  I32WrapI64
  I32TruncF32Signed
  I32TruncF32Unsigned
  I32TruncF64Signed
  I32TruncF64Unsigned
  I64ExtendI32Signed
  I64ExtendI32Unsigned
  I64TruncF32Signed
  I64TruncF32Unsigned
  F32ConvertI32Signed
  F32ConvertI32Unsigned
  F32ConvertI64Signed
  F32ConvertI64Unsigned
  F32DemoteF64
  F64ConvertI32Signed
  F64ConvertI32Unsigned
  F64PromoteF32
  I32ReinterpretF32
  I64ReinterpretF64
  F32ReinterpretI32
  F64ReinterpetI64

  I32Extend8Signed
  I32Extend16Signed
  I64Extend8Signed
  I64Extend16Signed
  I64Extend32Signed

  I32TruncSatF32Signed
  I32TruncSatF32Unsigned
  I32TruncSatF64Signed
  I32TruncSatF64Unsigned
  I64TruncSatF32Signed
  I64TruncSatF32Unsigned
  I64TruncSatF64Signed
  I64TruncSatF64Unsigned

  Unreachable
  End
  Nop
  Block(result_type: Int, value_type: Option(Int))
  Loop(result_type: Int, value_type: Option(Int))
  If(result_type: Int, value_type: Option(Int))
  Br(label_index: Int)
  BrTable(target_table: List(Int), default_target: Int)
  BrIf(label_index: Int)
  Return
  Call(func_index: Int)
  CallIndirect(type_index: Int)
}

pub fn decode_instruction(
  instruction: BitString,
) -> tuple(Instruction, BitString) {
  case instruction {
    // Control instructions 
    <<0x00:4, rest:binary>> -> tuple(Unreachable, rest)
    <<0x01:4, rest:binary>> -> tuple(Nop, rest)
  }
  //<<0x02:4, rest:binary>> -> tuple(Block, rest)
}
