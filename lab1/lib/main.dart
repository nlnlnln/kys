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
        appBar: AppBar(title: Text('l1')),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10),
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
                    Icon(Icons.favorite, color: Colors.red, size: 40),                  ],
                ),
                
                SizedBox(height: 20),
                
                Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey[300],
  ),
  child: Image.network(
    'https://avatars.mds.yandex.net/i?id=b2dce4256f2a2358900a4f217d182816_l-9461059-images-thumbs&ref=rim&n=13&w=1077&h=1077',
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      return Center(child: Text('Ошибка: ${error.toString()}'));
    },
  ),
),
                
                SizedBox(height: 20),
                
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purple,
                  child: Text(
                    'ss',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
                SizedBox(height: 20),
                
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Text('дополнительный элемент'),
                ),
                
                SizedBox(height: 20),
                
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Text('еще один элемент'),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}