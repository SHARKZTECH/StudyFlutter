import 'package:flutter/material.dart';
import 'rating_box.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
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
                child: const Column(
                  children: [
                    Text(
                      "name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("description"),
                    Text("10.0"),
                    RatingBox()
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
