import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 100,
                color: const Color.fromARGB(255, 203, 227, 247),
                child: const Center(
                  child: Text(
                    'HELLO!!!!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            
            const Center(
              child: Image(
                image: AssetImage('/images/photo_1_2025-09-06_22-11-25.jpg'),
                width: 300,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              left: 20,
              right: 20,
              top: 570,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFloatingActionButton(1),
                  _buildFloatingActionButton(2),
                  _buildFloatingActionButton(3),
                  _buildFloatingActionButton(4),
                  _buildFloatingActionButton(5),                                                                        
                ],
              ),
            ),

            Positioned(
              top: 110, 
              right: 20, 
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color.fromARGB(255, 142, 156, 168),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 60,
                color: const Color.fromARGB(255, 203, 227, 247),
                child: const Center(
                  child: Text(
                    'Footer',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(int index) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: const Color.fromARGB(255, 142, 156, 168),
      mini: true,
      shape: const CircleBorder(),
      child: const SizedBox(
        width: 24,
        height: 24,
      ),
    );
  }
}