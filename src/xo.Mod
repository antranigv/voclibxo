MODULE xo;

IMPORT
  Args,
  SYSTEM;

CONST
  Text*     = 0;
  XML*      = 1;
  JSON*     = 2;
  HTML*     = 3;
  SDPARAMS* = 4;
  Encoder*  = 5;

  CloseFp*      = ASH(1, 0);
  Pretty*       = ASH(1, 1);
  LogSyslog*    = ASH(1, 2);
  Resv3*        = ASH(1, 3);
  Warn*         = ASH(1, 4);
  Xpath*        = ASH(1, 5);
  Info*         = ASH(1, 6);
  WarnXML*      = ASH(1, 7);
  NoENV*        = ASH(1, 8);
  NoVAarg*      = ASH(1, 9);
  Dtrt*         = ASH(1, 10);
  Keys*         = ASH(1, 11);
  IgnoreClose*  = ASH(1, 12);
  NotFirst*     = ASH(1, 13);
  NoLocale*     = ASH(1, 14);
  Resv15*       = ASH(1, 15);
  NoTop*        = ASH(1, 16);
  Resv17*       = ASH(1, 17);
  Units*        = ASH(1, 18);
  Resv19*       = ASH(1, 19);
  Columns*      = ASH(1, 20);
  FFlush*       = ASH(1, 21);
  FFlushLine*   = ASH(1, 22);
  NoClose*      = ASH(1, 23);
  ColorAllowed* = ASH(1, 24);
  Color*        = ASH(1, 25);
  NoHumanize*   = ASH(1, 26);
  LogGettext*   = ASH(1, 27);
  Utf8*         = ASH(1, 28);
  RetainAll*    = ASH(1, 29);
  RetainNone*   = ASH(1, 30);
  ColorMap*     = ASH(1, 31);
  Continuation* = ASH(1, 32);

TYPE
  Style = INTEGER;
  Flag = HUGEINT;
  Handle* = SYSTEM.PTR;

PROCEDURE -Aincludexo '#include <libxo/xo.h>';

PROCEDURE -xoCreate(style: Style; flag: Flag): Handle
"xo_create(style, flag)";

PROCEDURE Create*(style: Style; flag: Flag; VAR handle: Handle);
BEGIN
  handle := xoCreate(style, flag);
END Create;

PROCEDURE -xoEmit(VAR fmt: ARRAY OF CHAR; VAR var: ARRAY OF CHAR)
"xo_emit(fmt, var)";

PROCEDURE -xoPrint(VAR fmt: ARRAY OF CHAR)
"xo_emit(fmt)";

PROCEDURE Emit*(format: ARRAY OF CHAR; value: ARRAY OF CHAR);
BEGIN
  xoEmit(format, value)
END Emit;

PROCEDURE Print*(string: ARRAY OF CHAR);
BEGIN
  xoPrint(string)
END Print;

PROCEDURE -emitln()
'xo_emit("\n")';

PROCEDURE Ln*();
BEGIN
  emitln
END Ln;

PROCEDURE -flush()
"xo_flush()";

PROCEDURE Flush*();
BEGIN
  flush
END Flush;

PROCEDURE -finish()
"xo_finish()";

PROCEDURE Finish*();
BEGIN
  finish
END Finish;

PROCEDURE -parseArgs(argc: INTEGER; argv: SYSTEM.ADDRESS)
"xo_parse_args(argc, (char **) argv)";

PROCEDURE ParseArgs*();
BEGIN
  parseArgs(Args.argc, Args.argv)
END ParseArgs;

PROCEDURE -xoOpenContainer(VAR cont: ARRAY OF CHAR)
"xo_open_container(cont)";

PROCEDURE OpenContainer*(name: ARRAY OF CHAR);
BEGIN
  xoOpenContainer(name)
END OpenContainer;

PROCEDURE -xoErrx(code: INTEGER; VAR msg: ARRAY OF CHAR)
"xo_errx(code, msg)";

PROCEDURE ErrorExit*(code: INTEGER; message: ARRAY OF CHAR);
BEGIN
  xoErrx(code, message);
END ErrorExit;

PROCEDURE -xoWarnx(VAR msg: ARRAY OF CHAR)
"xo_warnx(msg)";

PROCEDURE Warnx*(message: ARRAY OF CHAR);
BEGIN
  xoWarnx(message)
END Warnx;

PROCEDURE -xoSetOptions(VAR handle: Handle; VAR opts: ARRAY OF CHAR)
"xo_set_options(handle, opts)";

PROCEDURE SetOptions*(VAR handle: Handle; options: ARRAY OF CHAR);
BEGIN
  xoSetOptions(handle, options)
END SetOptions;

PROCEDURE -xoSetFlag(VAR handle: Handle; flag: Flag)
"xo_set_flags(handle, flag)";

PROCEDURE SetFlag*(VAR handle: Handle; flag: Flag);
BEGIN
  xoSetFlag(handle, flag);
END SetFlag;

END xo.
