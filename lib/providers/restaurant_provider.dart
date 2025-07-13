import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/restaurant.dart';
import '../services/mock_data.dart';

final restaurantProvider = Provider<List<Restaurant>>((ref) => mockRestaurants);
