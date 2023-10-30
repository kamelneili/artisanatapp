import 'package:artisanaflutterapp/models/order.dart';
import 'package:artisanaflutterapp/models/product.dart';
import 'package:artisanaflutterapp/models/user_model.dart';
import 'package:artisanaflutterapp/product_details/product_details_screen.dart';
import 'package:artisanaflutterapp/screens/account/screens/account_screen.dart';
import 'package:artisanaflutterapp/screens/address/screens/address_screen.dart';
import 'package:artisanaflutterapp/screens/cart/screens/cart_screen.dart';
import 'package:artisanaflutterapp/screens/home/screens/category_deals_screen.dart';
import 'package:artisanaflutterapp/screens/home/screens/home_screen.dart';
import 'package:artisanaflutterapp/screens/login/logIn_screen.dart';
import 'package:artisanaflutterapp/screens/order_details/screens/order_details.dart';
import 'package:artisanaflutterapp/screens/product_details/product_details/screens/product_details_screen.dart';
import 'package:artisanaflutterapp/screens/search/screens/search_screen.dart';
import 'package:artisanaflutterapp/screens/signup/signup_screen.dart';
import 'package:artisanaflutterapp/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const SigninScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/ProductDetails':
        return MaterialPageRoute(
          builder: (_) => ProductDetails(
            product: settings.arguments as Product,
          ),
        );
      case '/ProductDetailsScreen':
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(
            product: settings.arguments as Product,
          ),
        );
      case '/category-deals':
        return MaterialPageRoute(
          builder: (_) => CategoryDealsScreen(
            category: settings.arguments as String,
          ),
        );
      case '/cart-deals':
        return MaterialPageRoute(
          builder: (_) => CartScreen(
            data: settings.arguments as Map,
          ),
        );
      case '/address':
        return MaterialPageRoute(builder: (_) {
          List<dynamic> args = settings.arguments as List<dynamic>;

          return AddressScreen(
            cart: args[0],
            totalAmount: args[1],
          );
        });
      case '/account':
        return MaterialPageRoute(builder: (_) {
          return const AccountScreen();
        });
      case '/search-screen':
        return MaterialPageRoute(builder: (_) {
          return SearchScreen(
            searchQuery: settings.arguments as String,
          );
        });
      case '/orderDetails':
        return MaterialPageRoute(
          builder: (_) => OrderDetailScreen(
            order: settings.arguments as Order,
          ),
        );
    }
    return null;
  }
}
