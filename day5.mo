import Cycles "mo:base/ExperimentalCycles";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";

actor {

  // challenge 1
  public shared(msg) func is_anonymous() : async Bool {
    let principal_caller = msg.caller;
    let principal_caller_text : Text = Principal.toText(principal_caller);
    switch (principal_caller_text) {
      case "2vxsx-fae" true;
      case _ false; // case default false;
    };
  };

  // challenge 2
  let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

  // challenge 3
  public shared(msg) func add_favorite_number(n : Nat) : async () { 
    let principal = msg.caller;
    favoriteNumber.put(principal, n); // if the same caller calls the function more than one time the number will be updated
  };

  public shared query (msg) func show_favorite_number() : async ?Nat {
    let principal = msg.caller;
    return (favoriteNumber.get(principal));
  };

  // challenge 4
  public shared(msg) func add_favorite_number2(n : Nat) : async Text {
    let principal = msg.caller;
    if (favoriteNumber.get(principal) == null) {
      favoriteNumber.put(principal, n);
      return "You've successfully registered your number";
    } else {
      return "You've already registered your number";
    };
  };

  // challenge 5
  public shared(msg) func update_favorite_number(n : Nat) : async ?Nat {
    let principal = msg.caller;
    return favoriteNumber.replace(principal, n);
  };

  public shared(msg) func delete_favorite_number() : async Text {
    let principal = msg.caller;
    if (favoriteNumber.get(principal) == null) {
      return "There is no favorite number associated with this caller";
    } else {
      favoriteNumber.delete(principal);
      return "Favorite number deleted";
    };
  };

  // challenge 6
  // challenge 7

  // challenge 8
  stable var counter : Nat = 0;
  // stable var versionNumber : Nat = 0;

  public func increment_counter(n : Nat) : async Nat {
    counter += n;
    return counter;
  };

  // etc

  // who am i
  public shared(msg) func whoami() : async Principal {
    let principal_caller = msg.caller;
    return(principal_caller);
  };

  public shared({caller}) func whoami2() : async Principal {
    return(caller);
  };

  // anonymous principal - "2vxsx-fae"

  public func balance() : async Nat {
    return(Cycles.balance())
  };

  public func message_available() : async Nat {
    return(Cycles.available())
  };

  let AMOUNT_TO_PAY : Nat = 100_000;

  public func pay_to_access() : async Text {
    if(Cycles.available() < 100_000) {
      return("This is not enough, send more cycles.");
    };
  let received = Cycles.accept(AMOUNT_TO_PAY);
  return("Thanks for paying, you are now a premium user 😎");
  };
};