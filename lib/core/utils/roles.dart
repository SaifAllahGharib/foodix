import 'package:flutter/cupertino.dart';  
import 'package:foodix/core/routing/app_route_name.dart';  
import 'package:foodix/core/utils/extensions.dart';  

import '../../features/your_addresses/view/your_addresses_view.dart';  

sealed class UserRole {
  void executeAction(BuildContext context);
}

class Seller extends UserRole {
  @override
  String toString() => 'Seller';

  @override
  void executeAction(BuildContext context) {
    context.navigator.pushNamed(AppRouteName.myRestaurant);
  }
}

class Buyer extends UserRole {
  @override
  String toString() => 'Buyer';

  @override
  void executeAction(BuildContext context) {
    context.navigator.pushNamed(YourAddressesView.id);
  }
}
