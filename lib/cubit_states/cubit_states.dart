abstract class LogicState{
  var guesses = [];
  int currentGuess ;
  int length = 20;

  LogicState({this.currentGuess = 0, this.length = 20, this.guesses = const []});
  LogicState.broad({required this.currentGuess, required this.guesses, required this.length});
}

class InitialState extends LogicState{
  InitialState(): super();
}


class GuesserState extends LogicState{
  GuesserState({required bool decision, required List<dynamic> guess, required int current, required int length}): super.broad(currentGuess: current, guesses: guess, length: length);
}