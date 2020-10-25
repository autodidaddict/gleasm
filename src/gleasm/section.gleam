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
    CustomSection
    DataSection
}

fn parse_custom_section(unparsed: BitString) -> Section {
    CustomSection
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

fn parse_data_section(unparsed: BitString) -> Section {
    DataSection
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
        10-> parse_code_section(unparsed)
        11-> parse_data_section(unparsed)
    }
}