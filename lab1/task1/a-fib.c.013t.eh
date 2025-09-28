
;; Function main (main, funcdef_no=23, decl_uid=5027, cgraph_uid=24, symbol_order=23)

int main ()
{
  int n;
  int t;
  int i;
  int b;
  int a;
  int D.5038;

  a = 0;
  b = 1;
  i = 1;
  scanf ("%d", &n);
  printf ("%d\n", a);
  printf ("%d\n", b);
  goto <D.5035>;
  <D.5036>:
  t = b;
  b = a + b;
  printf ("%d\n", b);
  a = t;
  i = i + 1;
  <D.5035>:
  n.0_1 = n;
  if (i < n.0_1) goto <D.5036>; else goto <D.5034>;
  <D.5034>:
  D.5038 = 0;
  goto <D.5040>;
  <D.5040>:
  n = {CLOBBER(eol)};
  goto <D.5039>;
  D.5038 = 0;
  goto <D.5039>;
  <D.5039>:
  return D.5038;
}



;; Function printf (<unset-asm-name>, funcdef_no=15, decl_uid=1742, cgraph_uid=16, symbol_order=15)

__attribute__((artificial, gnu_inline, always_inline))
__attribute__((nonnull (1), format (printf, 1, 2)))
int printf (const char * restrict __fmt)
{
  int D.5041;

  D.5041 = __printf_chk (2, __fmt, __builtin_va_arg_pack ());
  goto <D.5042>;
  <D.5042>:
  return D.5041;
}


