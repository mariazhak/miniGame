import 'package:bloc/bloc.dart';
import 'package:app8/cubit_states/cubit_states.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(InitialState());

  void bigger() {
    var guessBuffer = [];
    for (var i in state.guesses){
      if (i > state.currentGuess){
        guessBuffer.add(i);
      }
    }
    emit(GuesserState(decision: true, guess: guessBuffer, current: guessBuffer[guessBuffer.length ~/ 2], length: state.length));
  }

  void smaller() {
    var guessBuffer = [];
    for (var i in state.guesses){
      if (i < state.currentGuess){
        guessBuffer.add(i);
      }
    }
    emit(GuesserState(decision: false, guess: guessBuffer, current: guessBuffer[guessBuffer.length ~/ 2], length: state.length));
  }

  void createArray(int length){
    var guessBuffer = [];
    for (var i = 1; i <= length; i++){
      guessBuffer.add(i);
    }
    emit(GuesserState(decision: true, guess: guessBuffer, current: guessBuffer[guessBuffer.length ~/ 2], length: length));
  }
}