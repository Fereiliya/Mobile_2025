import 'package:basic_navigation/widgets/footer.dart';
import 'package:basic_navigation/widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:basic_navigation/models/items.dart';

class ItemPage extends StatelessWidget {
  final Items item;
  const ItemPage({super.key, required this.item});
  static const String routeName = '/item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'item-photo-${item.name}',
              child: Image(
                image: item.photo!,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            ItemDetails(item: item),
          ],
        ),
      bottomNavigationBar: Footer()
    );
  }
}
