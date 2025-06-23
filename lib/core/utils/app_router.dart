import 'package:foodix/core/utils/my_shared_preferences.dart';
import 'package:foodix/features/add_food/presentation/view/add_food_view.dart';
import 'package:foodix/features/cart/presentation/view/cart_view.dart';
import 'package:foodix/features/choose_language/presentation/view/choose_language_view.dart';
import 'package:foodix/features/details_order/presentation/view/details_order_view.dart';
import 'package:foodix/features/food_details/presentation/view/food_details_view.dart';
import 'package:foodix/features/home/presentation/view/home_view.dart';
import 'package:foodix/features/login/presentation/view/change_password_view.dart';
import 'package:foodix/features/login/presentation/view/forget_password_view.dart';
import 'package:foodix/features/login/presentation/view/login_view.dart';
import 'package:foodix/features/restaurant/presentation/view/restaurant_view.dart';
import 'package:foodix/features/signup/presentation/view/signup_view.dart';
import 'package:foodix/features/verification/presentation/view/verification_view.dart';
import 'package:foodix/features/your_addresses/view/your_addresses_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/choose_role/presentation/view/choose_role_view.dart';
import '../../features/foods_category/presentation/view/foods_category_view.dart';
import '../../features/my_restaurant/presentation/view/my_restaurant_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: MySharedPreferences().getInitRoute(),
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const ChooseLanguageView(),
      ),
      GoRoute(
        path: ChooseRoleView.id,
        builder: (context, state) => const ChooseRoleView(),
      ),
      GoRoute(
        path: SignupView.id,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: LoginView.id,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(path: HomeView.id, builder: (context, state) => const HomeView()),
      GoRoute(
        path: VerificationView.id,
        builder: (context, state) => const VerificationView(),
      ),
      GoRoute(
        path: ForgetPasswordView.id,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: ChangePasswordView.id,
        builder: (context, state) => const ChangePasswordView(),
      ),
      GoRoute(
        path: FoodsCategoryView.id,
        builder: (context, state) => const FoodsCategoryView(),
      ),
      GoRoute(
        path: AddFoodView.id,
        builder: (context, state) => const AddFoodView(),
      ),
      GoRoute(
        path: DetailsOrderView.id,
        builder: (context, state) => const DetailsOrderView(),
      ),
      GoRoute(
        path: FoodDetailsView.id,
        builder: (context, state) => const FoodDetailsView(),
      ),
      GoRoute(
        path: YourAddressesView.id,
        builder: (context, state) => const YourAddressesView(),
      ),
      GoRoute(
        path: RestaurantView.id,
        builder: (context, state) => const RestaurantView(),
      ),
      GoRoute(path: CartView.id, builder: (context, state) => const CartView()),
      GoRoute(
        path: MyRestaurantView.id,
        builder: (context, state) => const MyRestaurantView(),
      ),
    ],
  );
}
