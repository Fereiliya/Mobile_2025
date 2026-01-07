import 'package:basic_navigation/models/items.dart';
import 'package:basic_navigation/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Items> items = [
    Items(
      name: "Sugar",
      price: 5000,
      photo: AssetImage("images/pic0.jpg"),
      stock: 10,
      rating: 4.5,
    ),
    Items(
      name: "Salt",
      price: 2000,
      photo: AssetImage("images/pic1.jpg"),
      stock: 15,
      rating: 4.0,
    ),
    Items(
      name: "Rice",
      price: 15000,
      photo: AssetImage("images/pic2.jpg"),
      stock: 8,
      rating: 4.8,
    ),
    Items(
      name: "Flour",
      price: 7000,
      photo: AssetImage("images/pic3.jpg"),
      stock: 20,
      rating: 4.3,
    ),
    Items(
      name: "Cooking Oil",
      price: 12000,
      photo: AssetImage("images/pic4.jpg"),
      stock: 5,
      rating: 4.6,
    ),
    Items(
      name: "Bread",
      price: 6000,
      photo: AssetImage("images/pic5.jpg"),
      stock: 12,
      rating: 4.2,
    ),
    Items(
      name: "Eggs",
      price: 10000,
      photo: AssetImage("images/pic6.jpg"),
      stock: 30,
      rating: 4.7,
    ),
    Items(
      name: "Butter",
      price: 8000,
      photo: AssetImage("images/pic7.jpg"),
      stock: 18,
      rating: 4.4,
    ),
  ];
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Afrizal's Shopping List"), centerTitle: true, backgroundColor: Colors.blueAccent),
      body: Container(
        margin: EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 360,
            crossAxisSpacing: 8,
            childAspectRatio: 1.1,
            mainAxisSpacing: 8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.push('/item', extra: items[index]);
              },
              child: Card(
                elevation: 4,
                child: Column(
                  children: [
                    if (items[index].photo != null)
                      Hero(
                        tag:
                            'item-photo-${items[index].name}',
                        child: AspectRatio(
                          aspectRatio: 16/9,
                          child: Container(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              child: Image(
                                image: items[index].photo!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Rp. ' + items[index].price.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Stock: ' + items[index].stock.toString(),
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Rating: ' + items[index].rating.toString(),
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Footer()
    );
  }
}
