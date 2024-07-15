import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'product.dart';
import 'product_page_scope_model.dart';

class Main extends StatelessWidget {
  Main({super.key});

  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products Listings"),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ProductBox(item: items[index]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductPage(item: items[index])));
                },
              );
            }));
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
              child: ScopedModel(
                model: item,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(item.description),
                    Text(item.price.toString()),
                    ScopedModelDescendant<Product>(
                        builder: (context, child, item) {
                      return RatingBox(item: item);
                    })
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class RatingBox extends StatelessWidget {
  const RatingBox({super.key, required this.item});

  final Product item;

  @override
  Widget build(BuildContext context) {
    double size = 20;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (item.rating >= 1
                ? Icon(
                    Icons.star,
                    size: size,
                  )
                : Icon(
                    Icons.star_border,
                    size: size,
                  )),
            color: Colors.red[500],
            iconSize: size,
            onPressed: () => item.updateRating(1),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (item.rating >= 2
                ? Icon(
                    Icons.star,
                    size: size,
                  )
                : Icon(
                    Icons.star_border,
                    size: size,
                  )),
            color: Colors.red[500],
            iconSize: size,
            onPressed: () => item.updateRating(2),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (item.rating >= 3
                ? Icon(
                    Icons.star,
                    size: size,
                  )
                : Icon(
                    Icons.star_border,
                    size: size,
                  )),
            color: Colors.red[500],
            iconSize: size,
            onPressed: () => item.updateRating(3),
          ),
        )
      ],
    );
  }
}
