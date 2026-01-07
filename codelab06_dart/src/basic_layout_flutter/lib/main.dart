import 'package:basic_layout_flutter/commonLayout/cardlayout.dart';
import 'package:basic_layout_flutter/commonLayout/gridviewlayout.dart';
import 'package:basic_layout_flutter/nestinglayout.dart';
import 'package:flutter/material.dart';
import 'anotherlayout.dart';
import 'nestinglayout.dart';
import 'commonLayout/containerlayout.dart';
import 'commonLayout/listviewlayout.dart';
import 'commonLayout/stacklayout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: //MyLayout(), <== Only used for Basic Layouts
            //Nestinglayout(), // <== Only used for Nesting Layouts
            //Containerlayout(),
            //Gridviewlayout(),
            //Listviewlayout(),
            //Stacklayout(),
            Cardlayout(),
      ),
    );
  }
}
