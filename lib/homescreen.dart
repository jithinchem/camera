import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cam/screens/camera.dart';
import 'package:cam/screens/gallery.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentSelectedIndex = 0;

  final _pages = [
    const Camera(),
    const Gallery(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _currentSelectedIndex,
        onTap: (newIndex) {
          setState(
            () {
              _currentSelectedIndex = newIndex;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.photo_camera,
              color: Colors.black,
            ),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.folder_open,
              color: Colors.black,
            ),
            label: 'Gallery',
          ),
        ],
      ),
    );
  }
}
