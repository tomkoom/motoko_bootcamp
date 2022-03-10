import Array "mo:base/Array";
import List "mo:base/List";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

import Animal "./animal";
import Emoji "./custom";

actor {

  // day 4 https://github.com/motoko-bootcamp/bootcamp/blob/main/daily_challenges/day_4/CHALLENGE.MD

  // challenge 1 fun
  public type Emoji = Emoji.Emoji;
  public func fun() : async Emoji {
    let testEmoji : Emoji = { // object in motoko = record in candid (record { num = 59 : nat; "text" = "🌈" })
      text = "🌈";
      num = 59;
    };
    return testEmoji; // return value -> (record { num = 59 : nat; "text" = "🌈" })
  };

  // challenge 2
  public type Animal = Animal.Animal;
  
  let cat : Animal = {
    specie = "Cat";
    energy = 1;
  };

  // challenge 3 animal_sleep
  public func animal_sleep(animal : Animal) : async Animal {
    var animalRecharged = animal;
    animalRecharged := {
      specie = animal.specie;
      energy = animal.energy + 10;
    };

    // var animalRecharged : Animal = {
    //   specie = animal.specie;
    //   energy = animal.energy + 10;
    // };

    return animalRecharged;
  };

  // challenge 4 create_animal_then_takes_a_break
  public func create_animal_then_takes_a_break(specie : Text, energy : Nat) : async Animal {
    let animal = Animal.new(specie, energy); // new record of type Animal
    return Animal.animal_sleep(animal); // adds metod animal sleep to the record (?)
  };

  
  // challenge 5
  stable var animals = List.nil<Animal>(); // new stable list of type Animal

  // challenge 6
};

