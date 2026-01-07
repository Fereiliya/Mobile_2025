import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  const MyLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[300],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('by Afrizal Qurratul Faizin - 2341720083', style: TextStyle(fontSize: 20, color: Colors.white)),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.green[700]),
                Icon(Icons.star, color: Colors.green[700]),
                Icon(Icons.star, color: Colors.green[700]),
                Icon(Icons.star, color: Colors.green[700]),
                Icon(Icons.star, color: Colors.black),
              ],
            )

            // Sizing Remains
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('images/kotoriExample.jpg')),
                Expanded(flex: 2, child: Image.asset('images/kotoriExample.jpg')),
                Expanded(child: Image.asset('images/kotoriExample.jpg')),
              ],
            ),
            //SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('images/kotoriExample.jpg', width: 100, height: 100, fit: BoxFit.cover),
                Image.asset('images/kotoriExample.jpg', width: 100, height: 100, fit: BoxFit.cover),
                Image.asset('images/kotoriExample.jpg', width: 100, height: 100, fit: BoxFit.cover),
              ],
            ), */
          ],
        ),
      ),
    );
  }
}