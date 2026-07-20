unit libwebp_min;

interface

const
  // use o decoder-only (mais leve, suficiente para abrir WebP)
  LIB_WEBP = 'libwebpdecoder.dll';

{ -----------------------------------------------------------------------------
  Funções principais de decode do WebP
  -----------------------------------------------------------------------------
  - WebPGetInfo          : obtém largura e altura da imagem sem decodificar tudo
  - WebPDecodeBGRAInto   : decodifica WebP direto em BGRA (32 bpp)
  - WebPDecodeRGBAInto   : decodifica WebP direto em RGBA (32 bpp)
  ----------------------------------------------------------------------------- }

function WebPGetInfo(const data: Pointer; data_size: Integer;
  width, height: PInteger): Integer; cdecl; external LIB_WEBP;

function WebPDecodeBGRAInto(const data: Pointer; data_size: Integer;
  output_buffer: Pointer; output_buffer_size: Integer;
  output_stride: Integer): Pointer; cdecl; external LIB_WEBP;

function WebPDecodeRGBAInto(const data: Pointer; data_size: Integer;
  output_buffer: Pointer; output_buffer_size: Integer;
  output_stride: Integer): Pointer; cdecl; external LIB_WEBP;

implementation

end.
