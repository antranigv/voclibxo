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

TYPE
  Style = INTEGER;
  StyleName = ARRAY 4 OF CHAR;
  Flag = HUGEINT;
  Handle* = SYSTEM.PTR;

VAR
  CloseFp-      : HUGEINT;
  Pretty-       : HUGEINT;
  LogSyslog-    : HUGEINT;
  Resv3-        : HUGEINT;
  Warn-         : HUGEINT;
  Xpath-        : HUGEINT;
  Info-         : HUGEINT;
  WarnXML-      : HUGEINT;
  NoENV-        : HUGEINT;
  NoVAarg-      : HUGEINT;
  Dtrt-         : HUGEINT;
  Keys-         : HUGEINT;
  IgnoreClose-  : HUGEINT;
  NotFirst-     : HUGEINT;
  NoLocale-     : HUGEINT;
  Resv15-       : HUGEINT;
  NoTop-        : HUGEINT;
  Resv17-       : HUGEINT;
  Units-        : HUGEINT;
  Resv19-       : HUGEINT;
  Underscores-  : HUGEINT;
  Columns-      : HUGEINT;
  FFlush-       : HUGEINT;
  FFlushLine-   : HUGEINT;
  NoClose-      : HUGEINT;
  ColorAllowed- : HUGEINT;
  Color-        : HUGEINT;
  NoHumanize-   : HUGEINT;
  LogGettext-   : HUGEINT;
  Utf8-         : HUGEINT;
  RetainAll-    : HUGEINT;
  RetainNone-   : HUGEINT;
  ColorMap-     : HUGEINT;
  Continuation- : HUGEINT;


PROCEDURE -Aincludexo '#include <libxo/xo.h>';

(* Create and Destroy *)
PROCEDURE -xoCreate(style: Style; flag: Flag): Handle
"xo_create(style, flag)";

PROCEDURE -xoDestroyHandle(VAR handle: Handle)
"xo_destroy(handle)";

PROCEDURE -xoDestroy()
"xo_destroy(NULL)";

PROCEDURE Create*(style: Style; flag: Flag; VAR handle: Handle);
BEGIN
  handle := xoCreate(style, flag);
END Create;

PROCEDURE DestroyHandle*(VAR handle: Handle);
BEGIN
  xoDestroyHandle(handle)
END DestroyHandle;

PROCEDURE Destroy*();
BEGIN
  xoDestroy
END Destroy;

(* Multiple wrappers for printing and emitting *)
(* Wrappers *)
PROCEDURE -xoEmit(VAR fmt: ARRAY OF CHAR; VAR var: ARRAY OF CHAR)
"xo_emit(fmt, var)";

PROCEDURE -xoEmitInt(VAR fmt: ARRAY OF CHAR; num: INTEGER)
"xo_emit(fmt, num)";

PROCEDURE -xoPrint(VAR fmt: ARRAY OF CHAR)
"xo_emit(fmt)";

PROCEDURE -xoEmitLn()
'xo_emit("\n")';

(* Exported Functions *)
PROCEDURE Emit*(format: ARRAY OF CHAR; value: ARRAY OF CHAR);
BEGIN
  xoEmit(format, value)
END Emit;

PROCEDURE EmitInt*(format: ARRAY OF CHAR; value: INTEGER);
BEGIN
  xoEmitInt(format, value)
END EmitInt;

PROCEDURE Print*(string: ARRAY OF CHAR);
BEGIN
  xoPrint(string)
END Print;

PROCEDURE Ln*();
BEGIN
  xoEmitLn
END Ln;

(* Flush and Finish *)
(* Wrappers *)
PROCEDURE -xoFlush()
"xo_flush()";

PROCEDURE -xoFinish()
"xo_finish()";

(* Exported Functions *)
PROCEDURE Flush*();
BEGIN
  xoFlush
END Flush;

PROCEDURE Finish*();
BEGIN
  xoFinish
END Finish;

(* Parse Args *)
PROCEDURE -xoParseArgs(argc: INTEGER; argv: SYSTEM.ADDRESS)
"xo_parse_args(argc, (char **) argv)";

PROCEDURE ParseArgs*();
BEGIN
  xoParseArgs(Args.argc, Args.argv)
END ParseArgs;

(* Open and Close Functions *)
(* TODO The following functions are not implemented nor wrapped
 * xo_open_list
 * xo_open_instance
 * and their close functions
*)
(* Wrappers *)
PROCEDURE -xoOpenContainer(VAR cont: ARRAY OF CHAR)
"xo_open_container(cont)";

PROCEDURE -xoOpenContainerDTRT(VAR cont: ARRAY OF CHAR)
"xo_open_container_d(cont)";

PROCEDURE -xoCloseContainer(VAR cont: ARRAY OF CHAR)
"xo_close_container(cont)";

PROCEDURE -xoCloseContainerDTRT()
"xo_close_container_d";

PROCEDURE -xoOpenList(VAR name: ARRAY OF CHAR)
"xo_open_list(name)";

PROCEDURE -xoOpenInstance(VAR name: ARRAY OF CHAR)
"xo_open_instance(name)";

PROCEDURE -xoCloseList(VAR name: ARRAY OF CHAR)
"xo_close_list(name)";

PROCEDURE -xoCloseInstance(VAR name: ARRAY OF CHAR)
"xo_close_instance(name)";

(* Exported Functions *)
(* Container *)
PROCEDURE OpenContainer*(name: ARRAY OF CHAR);
BEGIN
  xoOpenContainer(name)
END OpenContainer;

PROCEDURE OpenContainerDTRT*(name: ARRAY OF CHAR);
BEGIN
  xoOpenContainerDTRT(name)
END OpenContainerDTRT;

PROCEDURE CloseContainer*(name: ARRAY OF CHAR);
BEGIN
  xoCloseContainer(name)
END CloseContainer;

PROCEDURE CloseContainerDTRT*();
BEGIN
  xoCloseContainerDTRT
END CloseContainerDTRT;

(* List *)
PROCEDURE OpenList*(name: ARRAY OF CHAR);
BEGIN
  xoOpenList(name)
END OpenList;

PROCEDURE CloseList*(name: ARRAY OF CHAR);
BEGIN
  xoCloseList(name)
END CloseList;

(* Instance *)

PROCEDURE OpenInstance*(name: ARRAY OF CHAR);
BEGIN
  xoOpenInstance(name)
END OpenInstance;

PROCEDURE CloseInstance*(name: ARRAY OF CHAR);
BEGIN
  xoCloseInstance(name)
END CloseInstance;

(* Exit with error code *)
PROCEDURE -xoErrx(code: INTEGER; VAR msg: ARRAY OF CHAR)
"xo_errx(code, msg)";

PROCEDURE ErrorExit*(code: INTEGER; message: ARRAY OF CHAR);
BEGIN
  xoErrx(code, message);
END ErrorExit;

(* Warn to stderr *)
PROCEDURE -xoWarnx(VAR msg: ARRAY OF CHAR)
"xo_warnx(msg)";

PROCEDURE Warnx*(message: ARRAY OF CHAR);
BEGIN
  xoWarnx(message)
END Warnx;

(* Set Options and Flags *)
(**
 xo_set_options xo_set_flags and xo_set_style have two wrappers, one with a
 Handle and another without it. The non-Handle versions passes NULL to xo_set_*
 functions. These can be used to modify the default handle
 *)

(* Wrappers *)
(* Options *)
PROCEDURE -xoSetOptions(VAR opts: ARRAY OF CHAR)
"xo_set_options(NULL, opts)";

PROCEDURE -xoSetHandleOptions(VAR handle: Handle; opts: ARRAY OF CHAR)
"xo_set_options(handle, opts)";

(* Flags *)
PROCEDURE -xoSetHandleFlag(VAR handle: Handle; flag: Flag)
"xo_set_flags(handle, flag)";

PROCEDURE -xoSetFlag(flag: Flag)
"xo_set_flags(NULL, flag)";

(* Style *)
PROCEDURE -xoSetStyle(style: Style)
"xo_set_style(NULL, style)";

PROCEDURE -xoSetHanleStyle(VAR handle: Handle; style: Style)
"xo_set_style(handle, style)";

PROCEDURE -xoSetStyleName(style: StyleName)
"xo_set_style(NULL, style)";

PROCEDURE -xoSetHandleStyleName(VAR handle: Handle; style: StyleName)
"xo_set_style(handle, style)";

(* Exported Functions *)
(* Options *)
PROCEDURE SetOptions*(options: ARRAY OF CHAR);
BEGIN
  xoSetOptions(options)
END SetOptions;

PROCEDURE SetHandleOptions*(VAR handle: Handle; options: ARRAY OF CHAR);
BEGIN
  xoSetHandleOptions(handle, options)
END SetHandleOptions;

(* Flags *)
PROCEDURE SetHandleFlag*(VAR handle: Handle; flag: Flag);
BEGIN
  xoSetHandleFlag(handle, flag)
END SetHandleFlag;

PROCEDURE SetFlag*(flag: Flag);
BEGIN
  xoSetFlag(flag)
END SetFlag;

(* Style *)
PROCEDURE SetStyle*(style: Style); BEGIN xoSetStyle(style) END SetStyle;
PROCEDURE SetHandleStyle*(VAR handle: Handle; style: Style); BEGIN xoSetHanleStyle(handle, style) END SetHandleStyle;
PROCEDURE SetStyleName*(style: StyleName); BEGIN xoSetStyleName(style) END SetStyleName;
PROCEDURE SetHandleStyleName*(VAR handle: Handle; style: StyleName);
BEGIN
  xoSetHandleStyleName(handle, style)
END SetHandleStyleName;

(* Main *)
BEGIN
(* Init Variables *)
  CloseFp      := ASH(1, 0);
  Pretty       := ASH(1, 1);
  LogSyslog    := ASH(1, 2);
  Resv3        := ASH(1, 3);
  Warn         := ASH(1, 4);
  Xpath        := ASH(1, 5);
  Info         := ASH(1, 6);
  WarnXML      := ASH(1, 7);
  NoENV        := ASH(1, 8);
  NoVAarg      := ASH(1, 9);
  Dtrt         := ASH(1, 10);
  Keys         := ASH(1, 11);
  IgnoreClose  := ASH(1, 12);
  NotFirst     := ASH(1, 13);
  NoLocale     := ASH(1, 14);
  Resv15       := ASH(1, 15);
  NoTop        := ASH(1, 16);
  Resv17       := ASH(1, 17);
  Units        := ASH(1, 18);
  Resv19       := ASH(1, 19);
  Underscores  := ASH(1, 20);
  Columns      := ASH(1, 21);
  FFlush       := ASH(1, 22);
  FFlushLine   := ASH(1, 23);
  NoClose      := ASH(1, 24);
  ColorAllowed := ASH(1, 25);
  Color        := ASH(1, 26);
  NoHumanize   := ASH(1, 27);
  LogGettext   := ASH(1, 28);
  Utf8         := ASH(1, 29);
  RetainAll    := ASH(1, 30);
  RetainNone   := ASH(1, 31);
  ColorMap     := ASH(1, 32);
  Continuation := ASH(1, 33);
END xo.
