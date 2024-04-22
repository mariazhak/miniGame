import 'package:flutter/material.dart';
import 'package:app8/screens/games_screen.dart';
import 'package:app8/screens/rules_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app8/cubit/logic_cubit.dart';
import 'package:app8/screens/pop_window.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/games': (context) =>BlocProvider<LogicCubit>(
          create: (context) => LogicCubit(),
          child: const GameScreen(),),
        '/rules': (context) => const RulesScreen(),
        '/pop': (context) => const PopWindow(),
      },
    );
  }
}


class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  /*int previousGuess(){
    SharedPreferences.getInstance().then((prefs){
      return prefs.getInt('guess') ?? 0;
    });
    return 20;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Image.asset("app8/assets/sky.jpg").color,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network("https://i.pinimg.com/564x/8e/f1/16/8ef1160f8ead2a7c6b367e7a3958a889.jpg").image,
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
                const Text(
                  'Welcome to mini game app!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/games');
                  },
                    child: const Text('Games')),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/rules');

                  }, child: const Text('Rules'))
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
