import 'package:flutter/material.dart';

class PopWindow extends StatefulWidget{
  const PopWindow({super.key});
  @override
  State<PopWindow> createState() => _PopWindowState();
}

class _PopWindowState extends State<PopWindow> {
  int rangeEnd = 0;
  String error = '';

  @override
  Widget build(BuildContext context){
    var currentRangeEnd = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Enter the value for range end:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
              Card(
                child: TextField(
                  onChanged: (value){
                    setState(() {
                      try{
                        rangeEnd = int.parse(value);
                        error = '';
                      }
                      catch(e){
                        error = 'Invalid input';
                      }
                    });
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop(rangeEnd);
              }, child: const Text('Submit')),
              Text("Current range end: $currentRangeEnd"),
              Text(error)
            ],
          ),
        ),
      ),
    );
  }
}