module Operator::feq;

role Operator::feq {
  method compare($a, $b) { ... }
}


sub infix:<feq>(Any:D $a, Any:D $b) returns Bool is assoc<none> is export {
  my $s1  = $a.Str or die "Cannot coerce '$a' to Str";
  my $s2  = $b.Str or die "Cannot coerce '$b' to Str";
  try { 
    require ::($*FEQLIB || 'Operator::feq::Levenshtein');
    CATCH { $*FEQLIB = 'Operator::feq::Levenshtein'; }
  };
  my $len = ::($*FEQLIB || 'Operator::feq::Levenshtein').compare($s1,$s2);
  $len /= max($s1.chars, $s2.chars);
  return $len < ($*FEQTHRESHOLD || .1); #10 % default threshold
};
