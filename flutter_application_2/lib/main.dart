import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: const Color.fromARGB(255, 238, 195, 192),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: const Color.fromARGB(255, 178, 203, 223),
                  ),
                ],
              ),              
              Center(child:Text('image')),
  SizedBox(height: 50),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  someText(),someText(),
                ],),
                  SizedBox(height: 50),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                someText(),someText(),  ],)
              ],),]             
        )
      ),
    );
  }
}

Widget someText() {

  return Container(child: RichText(text: TextSpan(
                children: [
                  TextSpan(text: 'bold\n', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'world', style: TextStyle(color: Colors.brown)),

                ]
              )));
}