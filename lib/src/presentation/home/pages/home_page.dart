import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appBarTitle = 'SunMate'; // Initial title

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Pass dynamic title
        body: Column(
      children: [MainAppBar()],
    ));
  }
}
