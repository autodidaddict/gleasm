pub fn decode_unsigned(binary: BitString) -> tuple(Int, BitString) {
    case binary {
        <<n, rest:binary>> if n < 128 -> tuple(n, rest)
        <<n, rest:binary>> if n>= 128 -> {
            let tuple(m, rest) = decode_unsigned(rest)
            tuple(n - 128 + 128 * m, rest)
        }
    }
}

pub fn decode_signed(binary: BitString) -> tuple(Int, BitString) {
    case binary {
        <<n, rest:binary>> if n < 64 -> tuple(n, rest)
        <<n, rest:binary>> if n >= 64 && n < 128 -> tuple(n - 128, rest)
        <<n, rest:binary>> if n>= 128 -> {
            let tuple(m, rest) = decode_signed(rest)
            tuple(n - 128 + 128 *m, rest)
        }
    }
}