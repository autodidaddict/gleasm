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
    MemorySize // memarg is 0x00 in v1.1 spec
    MemoryGrow // memarg is 0x00 in v1.1 spec
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


}