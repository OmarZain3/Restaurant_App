import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/restaurant_provider.dart';
import '../models/restaurant.dart';
import 'checkout_screen.dart';
import 'products_screen.dart';

class RestaurantsScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends ConsumerState<RestaurantsScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final allRestaurants = ref.watch(restaurantProvider);
    final restaurants = allRestaurants
        .where((r) => r.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Restaurants')),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Restaurants',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => searchQuery = value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (_, index) {
                final restaurant = restaurants[index];
                return ListTile(
                  leading: Image.network(restaurant.imageUrl, width: 75),
                  title: Text(restaurant.name),
                  subtitle: Text(restaurant.description),
                  trailing: Text('⭐ ${restaurant.rating}'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductsScreen(restaurant: restaurant),
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
