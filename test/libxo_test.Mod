MODULE libxoTest;

IMPORT
  xo,
  Out,
  Args,
  VT100;

PROCEDURE TestColor();
BEGIN
  xo.SetFlag(xo.Color);
  xo.Print("Starting Test"); xo.Ln;
  xo.Print("{C:fg-default}Testing default"); xo.Ln;
  xo.Print("{C:fg-black}Testing black"); xo.Ln;
  xo.Print("{C:fg-blue}Testing blue"); xo.Ln;
  xo.Print("{C:fg-cyan}Testing cyan"); xo.Ln;
  xo.Print("{C:fg-green}Testing green"); xo.Ln;
  xo.Print("{C:fg-meganta}Testing meganta"); xo.Ln;
  xo.Print("{C:fg-red}Testing red"); xo.Ln;
  xo.Print("{C:fg-white}Testing white"); xo.Ln;
  xo.Print("{C:fg-yellow}Testing yellow"); xo.Ln;
  xo.Print("{C:reset}Resetting all!"); xo.Ln;
  xo.Ln;
  xo.Finish;
  xo.Destroy
END TestColor;

PROCEDURE TestEmit();
VAR
  style : INTEGER;
BEGIN
  style := 0;
  REPEAT
    xo.SetStyle(style);
    xo.SetFlag(xo.FFlush);
    xo.SetFlag(xo.Pretty);
    xo.SetFlag(xo.Underscores);
    xo.OpenContainer("best");
    xo.Emit("The Value of 'lang' is {:programming-language}", "Oberon");
    xo.CloseContainer("best");
    xo.Ln;
    xo.Finish;
    INC(style);
  UNTIL style > 3;
  xo.Destroy
END TestEmit;

PROCEDURE TestContainers();
TYPE
  user  = ARRAY 10 OF CHAR;
VAR
  style : INTEGER;
  i     : INTEGER;
  users : ARRAY 4  OF user;
BEGIN
  users[0] := "antranigv";
  users[1] := "norayr";
  users[2] := "shekspir";
  users[3] := "spectrum";
  style := 0;
  REPEAT
    xo.SetStyle(style);
    xo.SetFlag(xo.Pretty);
    xo.OpenContainer("user-data");
    xo.OpenList("users");
    REPEAT
      xo.OpenInstance("user");
      xo.Emit("User {:name} has ID ", users[i]);
      xo.EmitInt("{:id/%d}", i);
      xo.Ln;
      xo.CloseInstance("user");
      INC(i)
    UNTIL i >= LEN(users);
    xo.CloseList("users");
    xo.CloseContainer("user-data");
    xo.Finish;
    i := 0;
    INC(style)
  UNTIL style > 2;
  xo.Destroy
END TestContainers;

(* Main *)
BEGIN
  IF Args.argc > 1 THEN
    xo.ParseArgs;
  END;

  TestColor;

  TestEmit;

  TestContainers;

  VT100.SetAttr(VT100.Green);
  Out.String("DONE!");
  VT100.SetAttr(VT100.ResetAll);
  Out.Ln;
END libxoTest.
