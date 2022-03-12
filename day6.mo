import HashMap "mo:base/HashMap";

actor {

  // day 6 https://github.com/motoko-bootcamp/bootcamp/blob/main/daily_challenges/day_6/CHALLENGE.MD

  // challenge 1
  type TokenIndex : Nat;
  type Error = {
    #Ok;
    #Error; 
  };


  // challenge 2
  let registry =  HashMap.HashMap<TokenIndex, Principal>(0, TokenIndex.equal, TokenIndex.hash);
};