const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyCategory = 'category';
const keyImageUrl = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String category;
  final String imageUrl;

  //constructor
  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
  });

  //from json
  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: int.tryParse(json[keyId].toString()) ?? 0,
      pizzaName: json[keyName] != null ? json[keyName].toString() : 'No Name',
      description: json[keyDescription] != null ? json[keyDescription].toString() : 'No Description',
      price: double.tryParse(json[keyPrice].toString()) ?? 0.0,
      category: json[keyCategory] != null ? json[keyCategory].toString() : 'No Category',
      imageUrl: json[keyImageUrl] ?? '',
    ); 
  }

  Map<String, dynamic> toJson(){
    return{
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyCategory: category,
      keyImageUrl: imageUrl,
    };
  }
}