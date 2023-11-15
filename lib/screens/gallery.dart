import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cam/screens/viewimage.dart';

final Directory _photoDir =
    Directory('/storage/emulated/0/Pictures/flutter cam');

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    var imageList = _photoDir
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".jpg"))
        .toList();

    if (imageList.length > 0) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Gallery",
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            padding: const EdgeInsets.all(5.0),
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              String imgPath = imageList[index];
              return Material(
                elevation: 3.0,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewImage(path: imgPath),
                      ),
                    );
                  },
                  child: Image.file(
                    File(imgPath),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Gallery"),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: const Text(
              "Sorry, No Images Where Found.",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      );
    }
  }
}
