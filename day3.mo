import Array "mo:base/Array";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

actor {

  // day 3 https://github.com/motoko-bootcamp/bootcamp/blob/main/daily_challenges/day_3/CHALLENGE.MD

  // challenge 1 swap private (1. mutable arrays can only be in private functions, 2. private functions are not async)
  private func _swap(arrMut : [var Nat], i : Nat, j : Nat) : [var Nat] {
    let arrValI = arrMut[i];
    let arrValJ = arrMut[j];
    arrMut[i] := arrValJ;
    arrMut[j] := arrValI;

    return arrMut;
  };

  // challenge 1 swap public
  public func swapPub(arr : [Nat], i : Nat, j : Nat) : async [Nat] {
    let arrMut = Array.thaw<Nat>(arr); // convert to mutable array
    let arrI = arrMut[i];
    let arrJ = arrMut[j];
    arrMut[i] := arrJ;
    arrMut[j] := arrI;

    return Array.freeze<Nat>(arrMut);
  };

  // challenge 2 init_count
  public func init_count(n : Nat) : async [Nat] {
    var i : Nat = 0;
    var arr : [var Nat] = Array.init(n, 0);

    while (i < n) {
      arr[i] := i;
      i += 1;
    };

    return Array.freeze<Nat>(arr); // convert to immutable arr
  };

  // challenge 3 seven
  public func seven(arr : [Nat]) : async Text {
    var valText : Text = "";

    for (val in arr.vals()) {
      valText := Nat.toText(val);
      if (Text.contains(valText, #char '7')) {
        return "Seven is found";
      };
    };
    return "Seven not found";
  };

};
