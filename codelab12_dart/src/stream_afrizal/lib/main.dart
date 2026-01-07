import 'package:flutter/material.dart';
import 'package:stream_afrizal/random_screen.dart';
import 'package:stream_afrizal/stream_builder.dart';
//import 'stream.dart';
import 'dart:async';
//import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Afrizal',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const RandomScreen(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});
  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  //Praktikum 6
  late Stream<int> NumberStream;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Builder - Afrizal'),
      ),
      body: StreamBuilder(
        stream: NumberStream,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("RIP");
          }
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 96),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    NumberStream = NumberStreamBuilder().getNumbers();
  }

  /* Praktikum 1 sampai 5
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  int lastNumber = 0;
  late NumberStream numberStream;
  late StreamTransformer transformer;
  late StreamSubscription subscription;
  late StreamSubscription subscriptionTWO;
  String values = "";

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream();
    Stream stream = numberStream.controller.stream.asBroadcastStream();
    subscription = stream.listen((event){
      setState(() {
        values += '$event - ';
      });
    });
    subscriptionTWO = stream.listen((event){
      setState(() {
        values += '$event - ';
      });
    });
    //Stream stream = numberStream.stream;
    /*
    subscription = stream.listen((event){
        setState(() {
          lastNumber = event;
        });
      });
    subscription.onError((error){
      setState(() {
        lastNumber = -1;
      });
    });
    subscription.onDone((){
      print("Aight, all done");
    });
    
    stream
        .listen((event) {
          setState(() {
            lastNumber = event;
          });
        })
        .onError((error) {
          setState(() {
            lastNumber = -1;
          });
        });*/
        /*
    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink){
        sink.add(value * 10);
      },
      handleError: (error, stackTrace, sink) {
        sink.add(-1);
      },
      handleDone: (sink) => sink.close(),
    );
    stream.transform(transformer).listen((event) {
      setState(() {
        lastNumber = event;
      });
    }).onError((error)
    {
      setState(() {
        lastNumber = -1;
      });
    }); */

    super.initState();
  }

  void stopStream(){
    numberStream.close();
  }

  @override
  void dispose() {
    numberStream.close();
    super.dispose();
    subscription.cancel();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    if (!numberStream.controller.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
    // numberStream.addError();
  }

  void changeColor() async {
    /* Percobaan 1
    await for (var eventColor in colorStream.getColorStream()) {
      setState(() {
        bgColor = eventColor;
      });
    }*/
    ColorStream().getColorStream().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream - Afrizal')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(values),
            //Text(lastNumber.toString()),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: Text("New Random Number"),
            ),
            ElevatedButton(
              onPressed: () => stopStream(),
              child: const Text("Stop Stream")
            )
          ]
        ),
      ), 
    );
  }*/
}
