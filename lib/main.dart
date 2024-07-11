import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Gesture(),
    );
  }
}

class Gesture extends StatelessWidget {
  const Gesture({super.key});

  void _showDialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("message"),
            content: const Text("Sharkz Reigns"),
            actions: [
              CloseButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _showDialogue(context);
          },
          child: const Text("show"),
        ),
      ),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Listings"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: const [
          ProductBox(
            name: 'name',
            description: 'description',
            price: '10.0',
            image: 'user.png',
          ),
          ProductBox(
            name: 'name',
            description: 'description',
            price: '10.0',
            image: 'user.png',
          ),
          ProductBox(
            name: 'name',
            description: 'description',
            price: '10.0',
            image: 'user.png',
          ),
          ProductBox(
            name: 'name',
            description: 'description',
            price: '10.0',
            image: 'user.png',
          ),
          ProductBox(
            name: 'name',
            description: 'description',
            price: '10.0',
            image: 'user.png',
          ),
          ProductBox(
            name: 'name',
            description: 'description',
            price: '10.0',
            image: 'user.png',
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
      height: 120.0,
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
                  Text(price.toString())
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
