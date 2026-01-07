import 'dart:async';
//import 'package:async_books/geolocation.dart';
import 'package:async_books/navigation_dialog.dart';
// import 'package:async_books/navigation_first.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo - Afrizal',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: const FuturePage(),
      // PERCOBAAN 6
      //home: LocationScreen(),
      // PERCOBAAN 8
      home: const NavigationDialogScreen(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});
  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  // P3
  late Completer completer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back From Future - Afrizal')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                /* PERCOBAAN 1
                setState(() {});
                getData()
                    .then((value) {
                      result = value.body.toString().substring(0, 450);
                      setState(() {});
                    })
                    .catchError((_) {
                      result = 'Well... there goes.';
                      setState(() {});
                    });*/
                
                // PERCOBAAN 2
                //count();

                // PERCOBAAN 3
                /*
                getNumber().then((value){
                  setState(() {
                    result = value.toString();
                  });
                }).catchError((_) {
                  setState(() {
                    result = '...rest in pepperoni...';
                  });
                }); */
                
                // PERCOBAAN 4
                //returnFG();

                // PERCOBAAN 5
                /*
                returnError().then((value){
                  setState(() {
                    result = 'Task Failed Successfully';
                  });
                }).catchError((error){
                  setState(() {
                    result = error.toString();
                  });
                }).whenComplete(() {
                  print('Aight, Clear');
                }); */
                //handleError();
              },
              child: const Text('GO!'),
            ),
            /*
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
            */
          ],
        ),
      ),
    );
  }

  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/46X-DwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  // PERCOBAAN 2
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  // PERCOBAAN 3
  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }

  // PERCOBAAN 4
  void returnFG(){
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List <int> value) {
      int total = 0;
      for (var element in value){
        total += element;
      }
      setState((){
        result = total.toString();
      });
    });
  }

  void returnFG2(){
    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);
    futures.then((List<int> value) {
      int total = 0;
      for (var element in value){
        total += element;
      }
      setState((){
        result = total.toString();
      });
    });
  }

  // PERCOBAAN 5
  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('I think something just EXPLODED...');
  }

  Future handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    }
    finally {
      print('Aight, Clear');
    }
  }
}
