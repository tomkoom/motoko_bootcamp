module {

  // challenge 7

  public type List<T> = ?(T, List<T>);

  public func is_null<T>(l : List<T>) : Bool { // no async
    switch (l) {
      case (null) true;
      case (?something) false;
    };
  };
};