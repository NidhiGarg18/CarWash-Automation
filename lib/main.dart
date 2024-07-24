import 'package:flutter/material.dart';
import'splash_screen.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}
void main() {
  runApp(home());
}
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:splashscreen(),
    );
  }
}