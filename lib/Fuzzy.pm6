module Fuzzy;

multi sub infix:<feq>(Str:D $a, Str:D $b) returns Bool is assoc<none> is export {
  return True;
};

