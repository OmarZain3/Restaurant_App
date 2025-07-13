import '../models/restaurant.dart';
import '../models/product.dart';

final mockRestaurants = [
  Restaurant(
    id: 'r1',
    name: 'Pizza Hub',
    description: 'Delicious pizza and pasta',
    imageUrl: 'https://images.ctfassets.net/trvmqu12jq2l/4DqGcMLoD86WC4zOlwhgZ/c5d61d8d12cfb1cba5e73c07c0c2a735/zalat_pizza_group.jpg?q=70&w=1208&h=1080&f=faces&fit=fill',
    rating: 4.5,
  ),
  Restaurant(
    id: 'r2',
    name: 'Burger Spot',
    description: 'Juicy burgers and fries',
    imageUrl: 'https://www.tastingtable.com/img/gallery/what-makes-restaurant-burgers-taste-different-from-homemade-burgers-upgrade/l-intro-1662064407.jpg',
    rating: 4.2,
  ),
  Restaurant(
    id: 'r3',
    name: 'Sushi House',
    description: 'Amazing high quality sushi',
    imageUrl: 'https://i.shgcdn.com/5911cb01-8c5d-4286-aee1-b0277d32b565/-/format/auto/-/preview/3000x3000/-/quality/lighter/',
    rating: 4.4,
  ),
  Restaurant(
    id: 'r4',
    name: 'Kebdaky',
    description: 'Oriental Liver and sausage',
    imageUrl: 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/0570aed9-cd0b-4fad-8046-710d7aa372ca.jpg',
    rating: 4.7,
  )
];

final mockProducts = [
  Product(
    id: 'p1',
    restaurantId: 'r1',
    name: 'Pepperoni Pizza',
    description: 'A classic pizza featuring a dough base, tomato sauce, mozzarella cheese, and slices of cured, spicy pepperoni',
    price: 89.99,
    imageUrl: 'https://images.ctfassets.net/ttw7uwgviuml/3tlrBPPky3SNq7sxDowxOc/73958ae22c00682deb72f4ce5a68fde8/PLU_WF_LIFESTYLE_Pepperoni_Pizza_READYMEALS.jpg?fm=webp&w=650&h=650',
  ),
  Product(
    id: 'p2',
    restaurantId: 'r1',
    name: 'Margherita Pizza',
    description: 'A thin crust topped with tomato sauce, fresh mozzarella cheese, and basil leaves',
    price: 79.99,
    imageUrl: 'https://cookingitalians.com/wp-content/uploads/2024/11/Margherita-Pizza.jpg',
  ),
  Product(
    id: 'p3',
    restaurantId: 'r1',
    name: 'Cheese Pizza',
    description: 'A delicious chewy crust topped with gooey cheese',
    price: 84.99,
    imageUrl: 'https://img.tastelife.tv/assets/uploads/2022/06/Found_a_new_way_to_make_Double_Cheese_Pizza_No_kneading_Incredibly_easy_Best_pizza_in_the_world-1200x675.jpg',
  ),
  Product(
    id: 'p4',
    restaurantId: 'r2',
    name: 'Cheese Burger',
    description: 'Grilled beef burger with cheese',
    price: 54.99,
    imageUrl: 'https://leitesculinaria.com/wp-content/uploads/2020/02/classic-cheeseburger-1200.jpg',
  ),
  Product(
    id: 'p5',
    restaurantId: 'r2',
    name: 'Classic Burger',
    description: 'Grilled beef burger with onions and tomato',
    price: 49.99,
    imageUrl: 'https://mymarios.com/pystedod/2020/04/Classic-Burger-MARIOSBurgers-MJ6280-25.7.2020-online.png',
  ),
  Product(
    id: 'p6',
    restaurantId: 'r2',
    name: 'Chicken Burger',
    description: 'Fried Chicken burger with lettuce and tomato',
    price: 49.99,
    imageUrl: 'https://www.indianhealthyrecipes.com/wp-content/uploads/2024/06/chicken-burger-recipe.jpg',
  ),
  Product(
    id: 'p7',
    restaurantId: 'r3',
    name: 'Hot Lemon Roll',
    description: 'Salmon, avocado, cucumber and other ingredients topped with a refreshing slice of lemon and Ko-chan special sauce',
    price: 59.99,
    imageUrl: 'https://i.pinimg.com/736x/94/2d/e6/942de6999a041a24417fe055935544a3.jpg',
  ),
  Product(
    id: 'p8',
    restaurantId: 'r3',
    name: 'New Styles Philadelphia Roll',
    description: 'Smoked salmon, cream cheese, and cucumber, with the rice on the outside',
    price: 64.99,
    imageUrl: 'https://www.tiger-corporation.com/wp-content/uploads/2023/02/hero-img-recipe-philadelphia-roll-cd2c9161aad91f5ba6ee520ecac7abe1.jpg',
  ),
  Product(
    id: 'p9',
    restaurantId: 'r4',
    name: 'Oriental Kebda',
    description: 'Stir-frying thin strips of liver with garlic and chilies',
    price: 54.99,
    imageUrl: 'https://www.tasteatlas.com/images/dishes/f4d8a7febf434305a362fbf8a3936986.jpg',
  ),
  Product(
    id: 'p10',
    restaurantId: 'r4',
    name: 'Oriental Sogo2',
    description: 'Ground beef and it is combined with spices such as garlic, salt, cumin, sumac and red pepper before being piped into a sausage casing.',
    price: 54.99,
    imageUrl: 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/c441d2a3-e46e-4fa0-a6db-d212d14f9967.jpg',
  ),
];
