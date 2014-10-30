module Fuzzy;

multi sub infix:<feq>(Any:D $a, Any:D $b) returns Bool is assoc<none> is export {
  my $s1 = $a.Str or die "Cannot coerce '$a' to Str";
  my $s2 = $b.Str or die "Cannot coerce '$b' to Str";
  return True;
};

