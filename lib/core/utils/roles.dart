import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/my_restaurant/presentation/view/my_restaurant_view.dart';
import '../../features/your_addresses/view/your_addresses_view.dart';

sealed class UserRole {
  void navigate(BuildContext context);
}

class Seller extends UserRole {
  @override
  String toString() => 'Seller';

  @override
  void navigate(BuildContext context) {
    context.push(MyRestaurantView.id);
  }
}

class Buyer extends UserRole {
  @override
  String toString() => 'Buyer';

  @override
  void navigate(BuildContext context) {
    context.push(YourAddressesView.id);
  }
}
