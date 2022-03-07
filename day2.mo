import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";

actor {

  // day 2 https://github.com/motoko-bootcamp/bootcamp/blob/main/daily_challenges/day_2/CHALLENGE.MD

  // challenge 1 nat_to_nat8
  public func nat_to_nat8(n : Nat) : async Nat8 { // return conditionally
    if (n >= 0 and n < 256) {
      return(Nat8.fromNat(n));
    } else {
      return 0;
    };
  };

  // challenge 2 max_number_with_n_bits
  public func max_number_with_n_bits(n : Nat) : async Nat {
    return (2 ** n) - 1;
  };

  // challenge 3 decimal_to_bits
  public func decimal_to_bits(n : Nat) : async Text {
    var res : Text = "";
    var num : Nat = n;

    while (num != 0) {
      res := Text.concat(Nat.toText(num % 2), res); 
      num := num / 2;
    };
    return res;
  };

};


  
  