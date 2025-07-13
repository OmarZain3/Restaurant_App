import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/basket_provider.dart';
import '../models/product.dart';

class CheckoutScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basket = ref.watch(basketProvider);

    double total = basket.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: basket.isEmpty
          ? Center(child: Text('Your basket is empty.'))
          : Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: basket.length,
              itemBuilder: (_, index) {
                final product = basket[index];
                return ListTile(
                  leading: Image.network(product.imageUrl, width: 75),
                  title: Text(product.name, style: TextStyle(fontSize: 20)),
                  trailing: Text('${product.price.toStringAsFixed(2)} EGP', style: TextStyle(fontSize: 16)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Total: ${total.toStringAsFixed(2)} EGP',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Order Placed!')),
                    );
                  },
                  child: Text('Place Order'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
