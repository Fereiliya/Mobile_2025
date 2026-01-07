import 'package:flutter/material.dart';

class Stacklayout extends StatelessWidget {
  const Stacklayout({super.key});
  Widget _buildStack() {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('images/pic0.jpg'),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.black45),
          child: const Text(
            'Afrizal Qurratul Faizin',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStack(),
          Text('by Afrizal - 2341720083', style: TextStyle(fontSize: 12),)
        ],
      )
    );
  }
}
