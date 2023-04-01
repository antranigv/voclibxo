MODULE libxo;

IMPORT SYSTEM;

CONST
  xoStyleText*     = 0;
  xoStyleXML*      = 1;
  xoStyleJSON*     = 2;
  xoStyleHTML*     = 3;
  xoStyleSDPARAMS* = 4;
  xoStyleEncoder*  = 5;

  xoFormatCloseFp*      = 1;
  xoFormatPretty*       = 2;
  xoFormatLogSyslog*    = 4;
  xoFormatResv3*        = 8;
  xoFormatWarn*         = 16;
  xoFormatXpath*        = 32;
  xoFormatInfo*         = 64;
  xoFormatWarnXML*      = 128;
  xoFormatNoENV*        = 256;
  xoFormatNoVAarg*      = 512;
  xoFormatDtrt*         = 1024;
  xoFormatKeys*         = 2048;
  xoFormatIgnoreClose*  = 4096;
  xoFormatNotFirst*     = 8192;
  xoFormatNoLocale*     = 16384;
  xoFormatResv15*       = 32768;
  xoFormatNoTop*        = 65536;
  xoFormatResv17*       = 131072;
  xoFormatUnits*        = 262144;
  xoFormatResv19*       = 524288;
  xoFormatColumns*      = 2097152;
  xoFormatFlush*        = 4194304;
  xoFormatFlushLine*    = 8388608;
  xoFormatNoClose*      = 16777216;
  xoFormatColorAllowed* = 33554432;
  xoFormatColor*        = 67108864;
  xoFormatNoHumanize*   = 134217728;
  xoFormatLogGettext*   = 268435456;
  xoFormatUtf8*         = 536870912;
  xoFormatRetainAll*    = 1073741824;
  xoFormatRetainNone*   = 2147483648;
  xoFormatColorMap*     = 4294967296;
  xoFormatContinuation* = 8589934592;

TYPE
  Style = SHORTINT;
  Flags = LONGINT;
  xoHandle* = SYSTEM.PTR;

PROCEDURE -Aincludexo '#include <libxo/xo.h>';

PROCEDURE -xocreate(style: Style; flags: Flags): xoHandle
"xo_create(style, flags)";

PROCEDURE xoCreate*(style: Style; flags: Flags; VAR handle: xoHandle);
BEGIN
  handle := xocreate(style, flags);
END xoCreate;

PROCEDURE -xoemit(fmt: ARRAY OF CHAR)
"xo_emit(fmt)";

PROCEDURE xoEmit*(fmt: ARRAY OF CHAR);
(* TODO *)
BEGIN
END xoEmit;

END libxo.
