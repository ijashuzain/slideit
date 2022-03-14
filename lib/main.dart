import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slideit/board.dart';
import 'package:slideit/starter_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SlideIt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StarterPage(),
    );
  }
}
