import Nat "mo:base/Nat";
import Array "mo:base/Array";

actor {
    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };

    // day 1

    // add
    public func add(n : Nat, m : Nat) : async Nat {
        return n + m;
    };

    // square
    public func square(n : Nat) : async Nat {
        return n * n;
    };

    // days_to_seconds
    public func days_to_seconds(n : Nat) : async Nat {
        let seconds : Nat = n * 24 * 60 * 60;
        return seconds;
    };


    // increment_counter
    stable var counter : Nat = 0;

    public func increment_counter(n : Nat) : async Nat {
        counter += n;
        return counter;
    };

    // clear_counter
    public func clear_counter() : async () {
        counter := 0;
    };

    // divide
    public func divide(n : Nat, m : Nat) : async Bool {
        if (n % m == 0) {
            return true;
        } else {
            return false;
        }
    };

    // is_even
    public func is_even(n : Nat) : async Bool {
        if (n % 2 == 0) {
            return true;
        } else {
            return false;
        }
    };

    // sum_of_array
    public func sum_of_array(arr : [Nat]) : async Nat {
        var sum : Nat = 0;
        for (value in arr.vals()) {
            sum += value;
        };
        return sum;
    };

    // maximum
    public func maximum(arr : [Nat]) : async Nat {
        if (arr.size() != 0) {
            var max : Nat = 0;
            for (value in arr.vals()) {
                if (max < value) {
                    max := value;
                };
            };
            return max;
        } else {
            return 0;
        };
    };

    // remove_from_array
    public func remove_from_array(arr : [Nat], n : Nat) : async [Nat] {
        let filter = func (x : Nat) : Bool {
            return x != n;
        };
        let newArr : [Nat] = Array.filter(arr, filter);
        return newArr;
    };

    // remove_from_array2
    public func remove_from_array2(arr : [Nat], n : Nat) : async [Nat] {
        var res : [Nat] = [];
        for (val in arr.vals()) {
            if (val != n) {
                res := Array.append(res, [val]);
                // res := Array.append<Nat>(res, [val]) : [Nat];
            };
        };
        return res;
    };

    // selection_sort
    public func selection_sort(arr : [Nat]) : async [Nat] {
        return Array.sort(arr, Nat.compare);
    };
};
