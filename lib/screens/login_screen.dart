import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import 'restaurants_screen.dart';

class LoginScreen extends ConsumerWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6lGS4eqEWzMJAH4LSxahyR-2wVrzMlud93g&s',
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    } else if (!isEmailValid(value.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ref.read(authProvider.notifier).login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (ref.read(authProvider)) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => RestaurantsScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid credentials')),
                        );
                      }
                    }
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers/auth_provider.dart';
// import 'restaurants_screen.dart';
//
// class LoginScreen extends ConsumerWidget {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   bool isEmailValid(String email) {
//     final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
//     return emailRegex.hasMatch(email);
//   }
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isLoggedIn = ref.watch(authProvider);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Image.network(
//                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6lGS4eqEWzMJAH4LSxahyR-2wVrzMlud93g&s',
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(height: 24),
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'Email is required';
//                   } else if (!isEmailValid(value.trim())) {
//                     return 'Enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'Password is required';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ref.read(authProvider.notifier).login(
//                       emailController.text.trim(),
//                       passwordController.text.trim(),
//                     );
//
//                     if (ref.read(authProvider)) {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (_) => RestaurantsScreen()),
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Invalid credentials')),
//                       );
//                     }
//                   }
//                 },
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
