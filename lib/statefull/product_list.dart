import 'package:flutter/material.dart';
import 'package:study_project/statefull/product_page.dart';
import 'rating_box.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Listings"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductPage()));
            },
            child: const ProductBox(
              name: 'name',
              description: 'description',
              price: '10.0',
              image: 'user.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductPage()));
            },
            child: const ProductBox(
              name: 'name',
              description: 'description',
              price: '10.0',
              image: 'user.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductPage()));
            },
            child: const ProductBox(
              name: 'name',
              description: 'description',
              price: '10.0',
              image: 'user.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductPage()));
            },
            child: const ProductBox(
              name: 'name',
              description: 'description',
              price: '10.0',
              image: 'user.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductPage()));
            },
            child: const ProductBox(
              name: 'name',
              description: 'description',
              price: '10.0',
              image: 'user.png',
            ),
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  final String name;
  final String description;
  final String price;
  final String image;

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
              "assets/images/$image",
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(description),
                  Text(price.toString()),
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
