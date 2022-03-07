import Char "mo:base/Char";
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

  // challenge 4 capitalize_character
  public func capitalize_character(c : Char) : async Text {
    let char : Nat32 = Char.toNat32(c);
    var res : Char = Char.fromNat32(char - 32);
    return Text.fromChar(res);
  };

  // challenge 5 capitalize_text
  public func capitalize_text(t : Text) : async Text {
    var res : Text = "";
    var charNum : Nat32 = 0;
    var charCapital : Text = "";

    for(char in t.chars()) {
      charNum := Char.toNat32(char);
      charCapital := Text.fromChar(Char.fromNat32(charNum - 32));
      res := Text.concat(res, charCapital);
    };
    return res;
  };

  // challenge 6 is_inside
  public func is_inside(t : Text, c : Char) : async Bool {
    for (char in t.chars()) {
      if (char == c) {
        return true;
      };
    };
    return false;
  };

  // challenge 7 trim_whitespace
  public func trim_whitespace(t : Text) : async Text {
    let whitespace : Char = ' ';
    var textChar : Text = "";
    var res : Text = "";
    
    for (char in t.chars()) {
      if (char != whitespace) {
        textChar := Char.toText(char);
        res := Text.concat(res, textChar);
      };
    };
    return res;
  };

  // challenge 8 duplicated_character
  // public func duplicated_character(t : Text) : async Text {
  //   for (char in t.chars()) {
  //     var str : ?Text = Text.stripStart(t, #char char);
  //     if (Text.contains(str, #char char)) {
  //       return Char.toText(char);
  //     };
  //   };
  //   return t;
  // };

  // return the character corresponding to the unicode value n
  public func unicode_to_character(n : Nat32) : async Text {
    let char : Char = Char.fromNat32(n);
    return(Char.toText(char));
  };

};


  
  