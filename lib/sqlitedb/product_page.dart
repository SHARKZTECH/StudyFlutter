import 'package:flutter/material.dart';
import '../../statefull/rating_box.dart';
import 'product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.item});

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/user.png"),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(item.description),
                    Text(item.price.toString()),
                    const RatingBox()
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
