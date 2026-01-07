import 'package:flutter/widgets.dart';

class Items {
  String name = "Placeholder Name";
  int price = 0;
  AssetImage? photo;
  int stock = 0;
  double rating = 0.0;

  Items({required this.name, required this.price, this.photo, this.stock = 0, this.rating = 0.0});
}