import gleasm/decoder.{decode_sections, RawModule}

pub type VirtualMachine {
  VirtualMachine(
    foo: Bool
  )
}

pub fn load_module(module: RawModule) -> VirtualMachine {
  let sections = decode_sections(module)

  VirtualMachine(foo: True)
}
