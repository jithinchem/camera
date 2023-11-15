import 'package:flutter/material.dart';
import 'package:cam/screens/splash.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PermissionStatus camerastatus = await Permission.camera.request();
  PermissionStatus storagestatus = await Permission.storage.request();
  if (camerastatus == PermissionStatus.granted &&
      storagestatus == PermissionStatus.granted) {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
