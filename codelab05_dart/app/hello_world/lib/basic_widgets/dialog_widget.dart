import 'package:flutter/material.dart';

// Fungsi untuk menampilkan AlertDialog
void showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("My title"),
    content: const Text(
      "This is my message.\nNama saya Afrizal Qurratul Faizin, sedang belajar Pemrograman Mobile\nNIM 2341720083",
    ),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// Widget ElevatedButton
class MyLayout extends StatelessWidget {
  const MyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text('Show alert'),
        onPressed: () {
          // Panggil fungsi showAlertDialog
          showAlertDialog(context);
        },
      ),
    );
  }
}