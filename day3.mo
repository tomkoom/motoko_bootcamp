import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

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

  // challenge 4 nat_opt_to_nat
  public func nat_opt_to_nat(n : ?Nat, m : Nat) : async ?Nat {
    switch (n) {
      case (null) {
        return ?m;
      };
      case (?num) {
        return n;
      };
    };
  };

  // challenge 5 day_of_the_week
  public func day_of_the_week2(n : Nat) : async ?Text {
    switch (n) {
      case (1) ?"Monday";
      case (2) ?"Tuesday";
      case (3) ?"Wednesday";
      case (4) ?"Thursday";
      case (5) ?"Friday";
      case (6) ?"Saturday";
      case (7) ?"Sunday";
      case default null;
    };
  };

  // challenge 6 populate_array
  public func populate_array(arr : [?Nat]) : async [Nat] {
    let populate = func(n : ?Nat) : Nat {
      switch (n) {
        case (null) 0;
        case (?exists) exists;
      };
    };

    let res = Array.map<?Nat, Nat>(arr, populate);
    return res;
  };

  // challenge 7 sum_of_array
  public func sum_of_array(arr : [Nat]) : async Nat {
    let sum = func(acc : Nat, n : Nat) : Nat {
      return acc + n;
    };
    return Array.foldLeft(arr, 0, sum);
  };

  // challenge 8 squared_array
  public func squared_array(arr : [Nat]) : async [Nat] {
    let square = func(n : Nat) : Nat {
      return n ** 2;
    };
    return Array.map(arr, square);
  };

  // challenge 9 increase_by_index
  public func increase_by_index(arr : [Nat]) : async [Nat] {
    let inc = func(n : Nat, i : Nat) : Nat {
      return n + i;
    };
    return Array.mapEntries(arr, inc);
  };

  // challenge 10 contains<A>
  func contains<A>(arr : [A], a : A, f : ((A, A)) -> Bool) : Bool { // should be not public because type can be only for private functions, return type should not be async
    for (val in arr.vals()) {
      if (f(val, a)) {
        return true;
      };
    };
    return false;
  };

  public query func testContains(arr : [Nat], a : Nat) : async Bool {
    return contains<Nat>(arr, a, func(a, b) {a == b});
  };


  // etc

  // optional type
  public func index_of_one(array : [Nat]) : async ?Nat {
    for (i in array.keys()) { // for keys in array, if arr[key] == 1, then return value of that key
      if (i == 1) {
        return ?array[i];
      };
    };
  return null;
  };

  public func null_or_nat(n : ?Nat) : async Text {
    switch (n) {
      // Case where n is null
      case (null) {
        return ("The argument is null");
      };
      // Case where n is a nat
      case (?something) {
        return ("The argument is : " # Nat.toText(something));
      };
    };
  };
};
