import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app8/cubit/logic_cubit.dart';
import 'package:app8/cubit_states/cubit_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Guesser extends StatelessWidget {
  int length;
  Guesser({super.key, required this.length});

  void biggerValue(BuildContext context){
    BlocProvider.of<LogicCubit>(context).bigger();
  }

  void smallerValue(BuildContext context){
    BlocProvider.of<LogicCubit>(context).smaller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.network("https://i.pinimg.com/564x/88/ed/9c/88ed9cc52cbc2e2df7e77287211eb621.jpg").image,
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: BlocBuilder<LogicCubit, LogicState>(
              builder:(context, state)=>
              Container(
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
                    children: [
                      Text(
                        state.guesses.isEmpty?'Is your number ${length~/2}?':'Is your number ${state.currentGuess}?',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row (
                        children: [
                          Expanded(
                            child: ElevatedButton(onPressed: (){
                              if (state.guesses.isEmpty){
                                BlocProvider.of<LogicCubit>(context).createArray(length);
                              }
                              biggerValue(context);
                            },
                                child: const Text('More')),
                          ),
                          const SizedBox(width: 10),
                          Expanded(child: ElevatedButton(onPressed: (){
                            Navigator.pop(context, state.currentGuess);
                            },
                              child: const Text('Equal')),),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(onPressed: (){
                              if (state.guesses.isEmpty){
                                BlocProvider.of<LogicCubit>(context).createArray(length);
                              }
                              smallerValue(context);
                            },
                                child: const Text('Less')),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
              ),
          ),
    );
  }
}