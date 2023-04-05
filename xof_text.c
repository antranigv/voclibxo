#include <libxo/xo.h>
#include <stdio.h>

main(int argc, char **argv){
  xo_warnx("what am I doing here?...");
  xo_warn("what am I doing here?...");
  xo_parse_args(argc, argv);
  xo_set_flags(NULL, XOF_COLOR);
  printf("%lu\n", sizeof(XOF_COLOR));
  printf("%llu\n", XOF_COLOR);
  printf("%llu\n", XOF_CONTINUATION);
  xo_emit("what the {C:fg-red}{:what}{C:}\n", "hellll");
  xo_emit("this is a number : {:number/%d}\n", 4);
};
