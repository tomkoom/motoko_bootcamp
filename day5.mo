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

  // who am i
  public shared(msg) func whoami() : async Principal {
    let principal_caller = msg.caller;
    return(principal_caller);
  };

  public shared({caller}) func whoami2() : async Principal {
    return(caller);
  };

  // anonymous principal - "2vxsx-fae"

};