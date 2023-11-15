import 'dart:io';

import 'package:cam/screens/gallery.dart';
import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  ViewImage({Key? key, required this.path}) : super(key: key);
  String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => Gallery()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Images"),
      ),
      body: Container(
        child: Image.file(File(path)),
      ),
    );
  }
}
