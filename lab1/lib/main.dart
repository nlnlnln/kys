import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 235, 221),
        appBar: AppBar(title: Text('l1')),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'ьььь',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
                
                SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 40),
                    Icon(Icons.favorite, color: Colors.red, size: 40),
                  ],
                ),
              
                SizedBox(height: 20),
                
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://avatars.mds.yandex.net/i?id=b2dce4256f2a2358900a4f217d182816_l-9461059-images-thumbs&ref=rim&n=13&w=1077&h=1077',
                  ),
                ),
                
                SizedBox(height: 20),
                
                // Row с кнопками
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Действие кнопки 1
                      },
                      child: Text('кнопка 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Действие кнопки 2
                      },
                      child: Text('кнопка 2'),
                    ),
                  ],
                ),
                
                SizedBox(height: 20),
                
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color.fromARGB(255, 151, 206, 153), width: 1),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'дополнительный элемент',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.green[900],
                    ),
                  ),
                ),
                
                SizedBox(height: 20),
                
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(208, 184, 223, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color.fromARGB(255, 121, 155, 200), width: 1),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'еще один элемент',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 16, 60, 161),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  'еще текст',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),

              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Действие FAB
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}