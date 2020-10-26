import gleam/bit_string
import gleam/result.{unwrap}
import gleam/io
import gleasm/leb128

pub type DataEntry {
  DataEntry(index: Int, offset: Int, data: BitString)
}

pub type Section {
  TypeSection
  FunctionSection
  GlobalSection
  TableSection
  MemorySection
  ExportSection
  ImportSection
  StartSection
  ElementSection
  CodeSection
  CustomSection(name: String, raw: BitString)
  DataSection(entries: List(DataEntry))
  NameSection
}

fn parse_name_section(unparsed: BitString) -> Section {
  NameSection
}

fn parse_custom_section(unparsed: BitString) -> Section {
  let tuple(name_len, rest) = leb128.decode_unsigned(unparsed)
  let <<name:binary-size(name_len), rest:binary>> = rest
  io.debug(name)
  let sect_name =
    name
    |> bit_string.to_string
    |> unwrap("unknown")
  case sect_name {
    "name" -> parse_name_section(rest)
    _ -> CustomSection(name: sect_name, raw: rest)
  }
}

fn parse_type_section(unparsed: BitString) -> Section {
  TypeSection
}

fn parse_global_section(unparsed: BitString) -> Section {
  GlobalSection
}

fn parse_import_section(unparsed: BitString) -> Section {
  ImportSection
}

fn parse_function_section(unparsed: BitString) -> Section {
  FunctionSection
}

fn parse_table_section(unparsed: BitString) -> Section {
  TableSection
}

fn parse_memory_section(unparsed: BitString) -> Section {
  MemorySection
}

fn parse_export_section(unparsed: BitString) -> Section {
  ExportSection
}

fn parse_start_section(unparsed: BitString) -> Section {
  StartSection
}

fn parse_element_section(unparsed: BitString) -> Section {
  ElementSection
}

fn parse_code_section(unparsed: BitString) -> Section {
  CodeSection
}

//fn parse_entries(parsed: List(DataEntry), binary: BitString) -> List(DataEntry) {
//  case binary {
//<<>> -> parsed
//    _ -> {
//      let tuple(index, rest) = leb128.decode_unsigned(binary)
//      let tuple(offset, rest) = Util.evaluate_init_expr(rest)
//    {size, rest} = LEB128.decode_unsigned(rest)
//    <<data::bytes-size(size), rest::binary>> = rest
//    }
//  }
//}
fn parse_data_section(unparsed: BitString) -> Section {
  let tuple(count, entries) = leb128.decode_unsigned(unparsed)
  //  let entries = case count, entries {
  //0, _ -> []
  //_, entries -> parse_entries([],entries)    
  //}
  DataSection(entries: [])
}

pub fn parse_section(section_code: Int, unparsed: BitString) -> Section {
  case section_code {
    0 -> parse_custom_section(unparsed)
    1 -> parse_type_section(unparsed)
    2 -> parse_import_section(unparsed)
    3 -> parse_function_section(unparsed)
    4 -> parse_table_section(unparsed)
    5 -> parse_memory_section(unparsed)
    6 -> parse_global_section(unparsed)
    7 -> parse_export_section(unparsed)
    8 -> parse_start_section(unparsed)
    9 -> parse_element_section(unparsed)
    10 -> parse_code_section(unparsed)
    11 -> parse_data_section(unparsed)
  }
}
