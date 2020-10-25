import gleam/io
import gleam/result.{flatten}
import gleam/bit_string.{byte_size}
import gleasm/leb128
import gleasm/section.{Section, parse_section}
import gleasm/instruction
//import gleasm/instruction.{Instruction}

pub type RawModule =
  BitString

fn split_section(bin: BitString) -> tuple(BitString, BitString) {
  let tuple(size, rest) = leb128.decode_unsigned(bin)
  io.debug(size)

  let <<section:binary-size(size), rest:binary>> = rest

  tuple(section, rest)
}

fn split_sections(sections: List(Section), rest: BitString) -> List(Section) {
  //let <<section_code:binary-size(1), section_size:32, remaining:binary>> = rest
  let <<section_code, rest:binary>> = rest
  io.debug(section_code)
  let tuple(unparsed_section, rest) = split_section(rest)
  let parsed = parse_section(section_code, unparsed_section)

  case rest {
    <<>> -> [parsed, ..sections]
    bin -> split_sections([parsed, ..sections], bin)
  }
}

pub fn decode_sections(raw: RawModule) -> Result(List(Section), String) {
  let <<magic:binary-size(4), version:binary-size(4), rest:binary>> = raw

  case <<0, 97, 115, 109>> == magic {
    True -> Ok(split_sections([], rest))
    False -> Error("Bad module header - magic value incorrect")
  }
}
