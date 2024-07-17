import 'package:flutter/material.dart';
import 'package:study_project/sqlitedb/product_page.dart';
import 'package:study_project/statefull/rating_box.dart';
import 'product.dart';

class Main extends StatelessWidget {
  final Future<List<Product>> products;

  const Main({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products Listings"),
        ),
        body: Center(
          child: FutureBuilder<List<Product>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ProductList(
                      items: snapshot.data ?? [],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ));
  }
}

class ProductList extends StatelessWidget {
  final List<Product> items;
  const ProductList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ProductBox(item: items[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(item: items[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.item,
  });

  final Product item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      height: 130.0,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/${item.image}",
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.description,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  Text(item.price.toString()),
                  const RatingBox()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
