import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {

  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            Text(
              'Here are the rules of the game:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '//Here will be some rules',
            ),
          ],
        ),
      ),
    );
  }
}