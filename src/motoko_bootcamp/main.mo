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

};
