import 'package:flutter/material.dart';
import 'package:basic_navigation/models/items.dart';

class ItemDetails extends StatelessWidget {
  final Items item;
  const ItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Price: ' + item.price.toString(),
            style: TextStyle(fontSize: 18, color: Colors.green),
          ),
          SizedBox(height: 2),
          Text(
            'Item Remaining: ' + item.stock.toString(),
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
