import Array "mo:base/Array";
import List "mo:base/List";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

import Animal "./animal";
import CustomList "./list";
import Emoji "./custom";

actor {

  // day 4 https://github.com/motoko-bootcamp/bootcamp/blob/main/daily_challenges/day_4/CHALLENGE.MD

  // Animal.Animal;
  // let animal = Animal.new(specie, energy);

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
  
  let cat : Animal.Animal = {
    specie = "Cat";
    energy = 1;
  };

  // challenge 3 animal_sleep
  public func animal_sleep(animal : Animal.Animal) : async Animal.Animal {
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
  // public func create_animal_then_takes_a_break(specie : Text, energy : Nat) : async Animal.Animal {
  //   var animal : Animal.Animal = {
  //     specie = specie;
  //     energy = energy;
  //   };
  //   Animal.animal_sleep(animal);
  // };

  
  // challenge 5
  stable var animals = List.nil<Animal.Animal>(); // new stable list of type Animal

  // challenge 6
  public func push_animal(animal : Animal.Animal) : async () {
    animals := List.push<Animal.Animal>(animal, animals);
  };

  public query func get_animals() : async [Animal.Animal] {
    return List.toArray(animals);
  };

  // challenge 7
  // test

  public query func is_null(l : List.List<Nat>): async Bool {
        CustomList.is_null(l);
    };
};

