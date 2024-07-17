import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:study_project/sqlitedb/database.dart';
import 'package:study_project/sqlitedb/product.dart';

// import 'package:study_project/rest_api/product.dart';
// import 'product_statefull.dart';
// import 'scoped_model/product_list.dart';
import 'package:study_project/sqlitedb/product_list.dart';

void main() {
  // runApp(MyApp(products: fetchProducts()));
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure the Flutter bindings are initialized

  runApp(MyApp(products: SQLiteDbProvider.db.getAllProducts()));
}

List<Product> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromMap(json)).toList();
}

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('http://192.168.100.140:8000/products.json'));

  if (response.statusCode == 200) {
    return parseProducts(response.body);
  } else {
    throw Exception("Unable to fetch products from REST API");
  }
}

class MyApp extends StatelessWidget {
  final Future<List<Product>> products;

  const MyApp({super.key, required this.products});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Main(
        products: products,
      ),
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
