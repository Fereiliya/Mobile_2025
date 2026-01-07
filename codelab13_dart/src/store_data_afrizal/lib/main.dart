//import 'dart:convert';
import 'package:flutter/material.dart';
//import 'model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Afrizal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pwdController = TextEditingController();
  String myPass = '';
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async {
    String secret = await storage.read(key: myKey) ?? '';
    return secret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Secure Storage - Afrizal'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: pwdController,
            ),
            ElevatedButton(child: const Text('Save Value'),
            onPressed: (){
              writeToSecureStorage();
            }),
            ElevatedButton(child: Text('Read Value'),
            onPressed: () {
              readFromSecureStorage().then((value){
                setState(() {
                  myPass = value;
                });
              });
            }),
            Text(myPass),
          ],
        ),
      ),
    );
  }

  // PRAKTIKUM 5 & 6
  /*
  late File myFile;
  String fileText = '';

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Pepperoni, Pineapple Abomination, Meaty');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  String documentsPath = '';
  String tempPath = '';

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  @override
  void initState() {
    getPaths().then((_){
      myFile = File('$documentsPath/pizza.txt');
      writeFile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Path Provider - Afrizal"),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Doc path: $documentsPath"),
          Text("Temp path: $tempPath"),
          ElevatedButton(
            child: const Text("Read File"),
            onPressed: () => readFile(),
          ),
          Text(fileText),
        ],
      ),
    );
  } */

  /* PRAKTIKUM 4
  int appCounter = 0;
  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  @override
  void initState() {
    readAndWritePreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preference Demo - Afrizal'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'You have opened this app $appCounter times',
            ),
            ElevatedButton(onPressed: (){
              deletePreference();
            }, child: Text("RESET COUNTER"))
          ],
        )
      ),
    );
  }
  */

  // PERCOBAAN 1 SAMPAI 3
  /*
  String pizzaString = '';
  List<Pizza> myPizzas = [];

  String convertToJson(List<Pizza> pizzas){
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  Future<List<Pizza>> readJsonFile() async{
    String myString = await DefaultAssetBundle.of(context).loadString('../assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    String json = convertToJson(myPizzas);
    print(json);
    /* P1 - Langkah 7
    setState(() {
      pizzaString = myString;
    });*/
    return myPizzas;
  }

  @override
  void initState(){
    super.initState();
    readJsonFile().then((value){
      setState(() {
        myPizzas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON - Afrizal'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: myPizzas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myPizzas[index].pizzaName),
            subtitle: Text(myPizzas[index].description + " - \$" + myPizzas[index].price.toString()),
          );
        }
      ),
    );
  }
  */
}
