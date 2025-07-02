import 'package:flutter/material.dart';

import '../../features/add_food/presentation/view/add_food_view.dart';
import '../../features/cart/presentation/view/cart_view.dart';
import '../../features/choose_language/presentation/view/choose_language_view.dart';
import '../../features/choose_role/presentation/view/choose_role_view.dart';
import '../../features/details_food/presentation/view/details_food_view.dart';
import '../../features/details_order/presentation/view/details_order_view.dart';
import '../../features/foods_category/presentation/view/foods_category_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/login/presentation/view/change_password_view.dart';
import '../../features/login/presentation/view/forgot_password_view.dart';
import '../../features/login/presentation/view/login_view.dart';
import '../../features/my_restaurant/presentation/view/my_restaurant_view.dart';
import '../../features/restaurant/presentation/view/restaurant_view.dart';
import '../../features/signup/presentation/view/signup_view.dart';
import '../../features/verification/presentation/view/verification_view.dart';
import '../../features/your_addresses/view/your_addresses_view.dart';
import 'app_route_name.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.chooseLanguage:
        return MaterialPageRoute(builder: (_) => const ChooseLanguageView());
      case AppRouteName.chooseRole:
        return MaterialPageRoute(builder: (_) => const ChooseRoleView());
      case AppRouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case AppRouteName.signup:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case AppRouteName.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case AppRouteName.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordView());
      case AppRouteName.verification:
        return MaterialPageRoute(builder: (_) => const VerificationView());
      case AppRouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case AppRouteName.foodsCategory:
        return MaterialPageRoute(builder: (_) => const FoodsCategoryView());
      case AppRouteName.addFood:
        return MaterialPageRoute(builder: (_) => const AddFoodView());
      case AppRouteName.detailsOrder:
        return MaterialPageRoute(builder: (_) => const DetailsOrderView());
      case AppRouteName.detailsFood:
        return MaterialPageRoute(builder: (_) => const DetailsFoodView());
      case AppRouteName.yourAddresses:
        return MaterialPageRoute(builder: (_) => const YourAddressesView());
      case AppRouteName.restaurant:
        return MaterialPageRoute(builder: (_) => const RestaurantView());
      case AppRouteName.cart:
        return MaterialPageRoute(builder: (_) => const CartView());
      case AppRouteName.myRestaurant:
        return MaterialPageRoute(builder: (_) => const MyRestaurantView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Unknown Route')),
            body: const Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
