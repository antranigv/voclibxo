MODULE libxoTest;

IMPORT
  Out,
  Args,
  xo;

VAR
  str0, str1: ARRAY 16 OF CHAR;
  handle: xo.Handle;
BEGIN
  IF Args.argc > 1 THEN
    xo.ParseArgs;
  END;
  (* Is this proper NULL? *)
  handle := NIL;
  xo.SetFlag(handle, xo.Color);
  (* ^ Why doesn't this work? *)
  xo.OpenContainer("best-languages");
  str0 := '{:lang} and ';
  str1 := "oberon";
  xo.Emit(str0, str1);
  xo.Ln;
  xo.Emit("{:lang}", "rust");
  xo.Print("something's going {C:fg-red}foo{C:}!!!");
  xo.Ln;
  xo.Finish;
END libxoTest.
