import 'package:flutter/material.dart';

class Gridviewlayout extends StatelessWidget {
  const Gridviewlayout({super.key});

  Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(8),
  );

  List<Widget> _buildGridTileList(int count) =>
      List.generate(count, (i) => Image.asset('images/pic$i.jpg'));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: 
        Column(
          children: [
            Expanded(child: _buildGrid()),
            Text('Afrizal\'s Gallery - 2341720083', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ],
        ),
    );
  }
}
