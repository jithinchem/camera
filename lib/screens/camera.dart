import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? images;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'CAMERA',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  takepic();
                },
                icon: const Icon(
                  CupertinoIcons.photo_camera,
                ),
                label: const Text(
                  'Click to click',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  takepic() async {
    final image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(
      () {
        if (image != null) {
          images = File(image.path);
          GallerySaver.saveImage(image.path, albumName: 'flutter cam');
        }
      },
    );
  }
}
