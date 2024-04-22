import 'package:flutter/material.dart';
import 'package:app8/screens/guesser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app8/cubit/logic_cubit.dart';

class GameScreen extends StatefulWidget{
  const GameScreen({super.key});

  @override
  _GameScreen createState() => _GameScreen();
}

class _GameScreen extends State<GameScreen>{
  int rangeEndFinal = 20;
  int previousGuess = 0;

  Future<int> setPreviousGuess(int length) async{
      return await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BlocProvider<LogicCubit>(
        create: (context) => LogicCubit(),
        child: Guesser(length: length),),));
  }

  void setRangeEnd() async{
    Navigator.pushNamed(context, '/pop', arguments: rangeEndFinal).then((value){
      setState(() {
        if (value != null){
          rangeEndFinal = value as int;
        }
      });
    },);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network("https://i.pinimg.com/564x/22/89/ed/2289ed4bab98044ec28ffeff8f2ffd5f.jpg").image,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[500]!,
                  width: 3,
                ),
                right: BorderSide(
                  color: Colors.grey[500]!,
                  width: 3,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Think up the number from 1 to $rangeEndFinal',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () async{
                  int buffer = await setPreviousGuess(rangeEndFinal);
                  setState(() {
                    previousGuess = buffer;
                  });
                  },
                    child: const Text('I am ready!')),
                const SizedBox(height: 10),
                Text(previousGuess!=0?'Previous guess: $previousGuess': 'Previous guess: Unknown')
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          setRangeEnd();
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}