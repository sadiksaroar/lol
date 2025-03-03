import 'package:flutter/material.dart';

void main() {
  runApp(LessonsApp());
}

class LessonsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LessonsScreen(),
    );
  }
}

class LessonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Lessons',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(
                Icons.favorite,
                color: index == 0 ? Colors.grey : Colors.red,
              );
            }),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'images/asad.png',
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListView(
                  children: [
                    LessonItem(image: 'images/asad.png', isLocked: true),
                    LessonItem(image: 'images/asad.png', isLocked: true),
                    LessonItem(image: 'images/asad.png', isLocked: false),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }
}

class LessonItem extends StatelessWidget {
  final String image;
  final bool isLocked;

  LessonItem({required this.image, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image, height: 50),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLocked) Icon(Icons.lock, color: Colors.grey),
          Switch(value: false, onChanged: (bool value) {}),
        ],
      ),
    );
  }
}
