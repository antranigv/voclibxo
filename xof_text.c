#include <libxo/xo.h>

main(){
  unsigned long long xofv[] = {
    XOF_CLOSE_FP    ,
    XOF_PRETTY      ,
    XOF_LOG_SYSLOG  ,
    XOF_RESV3       ,
    XOF_WARN        ,
    XOF_XPATH       ,
    XOF_INFO        ,
    XOF_WARN_XML    ,
    XOF_NO_ENV      ,
    XOF_NO_VA_ARG   ,
    XOF_DTRT        ,
    XOF_KEYS        ,
    XOF_IGNORE_CLOSE,
    XOF_NOT_FIRST   ,
    XOF_NO_LOCALE   ,
    XOF_RESV15      ,
    XOF_NO_TOP      ,
    XOF_RESV17      ,
    XOF_UNITS       ,
    XOF_RESV19      ,
    XOF_COLUMNS     ,
    XOF_FLUSH       ,
    XOF_FLUSH_LINE  ,
    XOF_NO_CLOSE    ,
    XOF_COLOR_ALLOWED,
    XOF_COLOR       ,
    XOF_NO_HUMANIZE ,
    XOF_LOG_GETTEXT ,
    XOF_UTF8        ,
    XOF_RETAIN_ALL  ,
    XOF_RETAIN_NONE ,
    XOF_COLOR_MAP   ,
    XOF_CONTINUATION,
  };

  char * xofk[] = {
    "XOF_CLOSE_FP    ",
    "XOF_PRETTY      ",
    "XOF_LOG_SYSLOG  ",
    "XOF_RESV3       ",
    "XOF_WARN        ",
    "XOF_XPATH       ",
    "XOF_INFO        ",
    "XOF_WARN_XML    ",
    "XOF_NO_ENV      ",
    "XOF_NO_VA_ARG   ",
    "XOF_DTRT        ",
    "XOF_KEYS        ",
    "XOF_IGNORE_CLOSE",
    "XOF_NOT_FIRST   ",
    "XOF_NO_LOCALE   ",
    "XOF_RESV15      ",
    "XOF_NO_TOP      ",
    "XOF_RESV17      ",
    "XOF_UNITS       ",
    "XOF_RESV19      ",
    "XOF_COLUMNS     ",
    "XOF_FLUSH       ",
    "XOF_FLUSH_LINE  ",
    "XOF_NO_CLOSE    ",
    "XOF_COLOR_ALLOWED",
    "XOF_COLOR       ",
    "XOF_NO_HUMANIZE ",
    "XOF_LOG_GETTEXT ",
    "XOF_UTF8        ",
    "XOF_RETAIN_ALL  ",
    "XOF_RETAIN_NONE ",
    "XOF_COLOR_MAP   ",
    "XOF_CONTINUATION",
  };

  int array_size = sizeof(xofk) / sizeof(xofk[0]);
  for (int i = 0; i < array_size; i++) {
    printf("%s\t: %llu\n", xofk[i], xofv[i]);
  }

  printf("\n\n\n");
  xo_emit("{:jails}\n", "jails");
};
