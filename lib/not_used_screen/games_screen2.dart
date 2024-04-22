import 'package:flutter/material.dart';

class GameScreen2 extends StatelessWidget {

  const GameScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Choose the game:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, child: const Text('Game 1')),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){}, child: const Text('Game 2'))
          ],
        ),
      ),
    );
  }
}