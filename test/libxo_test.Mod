MODULE libxoTest;

IMPORT
  Out,
  libxo;

VAR
  handle : libxo.xoHandle;
BEGIN
  libxo.xoCreate(libxo.xoStyleText, libxo.xoFormatWarn, handle);
  libxo.xoEmit(["{:jails/%d}\n", 10]);
END libxoTest.
