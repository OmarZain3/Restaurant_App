import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../models/product.dart';
import '../services/mock_data.dart';
import 'product_details_screen.dart';
import '../screens/checkout_screen.dart';

class ProductsScreen extends StatefulWidget {
  final Restaurant restaurant;

  ProductsScreen({required this.restaurant});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final products = mockProducts
        .where((p) => p.restaurantId == widget.restaurant.id)
        .where((p) => p.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(widget.restaurant.name)),
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
          Image.network(widget.restaurant.imageUrl, height: 200),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Products',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => searchQuery = value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.imageUrl, width: 75),
                  title: Text(product.name),
                  subtitle: Text('${product.price.toStringAsFixed(2)} EGP'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsScreen(product: product),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
