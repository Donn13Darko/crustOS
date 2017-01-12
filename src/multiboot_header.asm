section .multiboot_header
header_start:
  dd 0xe85250d6                 ; magic number (multiboot 2)
  dd 0                          ; architecture (0 is for i386, 4 is for MIPS)
  dd header_end - header_start  ; header length (including tags)

  ; checksum => [checksum - (magic_number + architecture + header_length)]
  dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))

  ; required end tag
  dw 0  ; type
  dw 0  ; flags
  dd 8  ; size
header_end: