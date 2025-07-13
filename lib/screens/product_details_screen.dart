import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../providers/basket_provider.dart';
import 'checkout_screen.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CheckoutScreen()),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.network(product.imageUrl),
          const SizedBox(height: 30),
          Text(product.description, style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Text('Price: ${product.price} EGP', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              ref.read(basketProvider.notifier).addProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} added to basket!'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Text('Add to Basket'),
          ),

        ],
      ),
    );
  }
}
