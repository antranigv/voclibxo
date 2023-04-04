MODULE libxoTest;

IMPORT
  libxo;

VAR
  handle : libxo.xoHandle;
BEGIN
  libxo.xoCreate(libxo.xoStyleText, libxo.xoFormatWarn, handle);
  libxo.xoEmit("{:lang}", "oberon");
  Out.Ln;
END libxoTest.
