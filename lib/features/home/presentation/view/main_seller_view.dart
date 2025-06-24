import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/functions/snack_bar.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_error_widget.dart';
import 'package:foodix/core/widgets/empty_widget.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/home/presentation/view/widgets/category_seller_list_view.dart';
import 'package:foodix/features/home/presentation/view/widgets/complete_reataurant_dialog_widget.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_float_button.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_widget_float_button_add_category.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/main_seller/main_seller_cubit.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/main_seller/main_seller_state.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

import '../../../../core/shared/models/category_model.dart';
import '../../../../core/utils/di.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/my_shared_preferences.dart';

class MainSellerView extends StatefulWidget {
  const MainSellerView({super.key});

  @override
  State<MainSellerView> createState() => _MainSellerViewState();
}

class _MainSellerViewState extends State<MainSellerView> {
  late final TextEditingController _searchCategoryController;
  late final TextEditingController _searchFoodController;
  late final TextEditingController _categoryController;
  late final RestaurantModel _restaurant;
  final List<CategoryModel> _listOfCategories = [];

  @override
  void initState() {
    _searchCategoryController = TextEditingController();
    _searchFoodController = TextEditingController();
    _categoryController = TextEditingController();
    _getCategories();
    _getMyRestaurant();

    super.initState();
  }

  @override
  void dispose() {
    _searchCategoryController.dispose();
    _searchFoodController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _getMyRestaurant() async {
    if (_myRestaurantIsNotValid) {
      await context.read<MainSellerCubit>().getMyRestaurant();
    }
  }

  void _addCategoryBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomWidgetFloatButtonAddCategory(
          categoryController: _categoryController,
        );
      },
    );
  }

  void _getCategories() {
    context.read<MainSellerCubit>().getCategories();
  }

  void _getCategoriesSuccess(MainSellerGetCategory state) {
    _listOfCategories.clear();
    _listOfCategories.addAll(state.categories ?? []);
  }

  void _handleState(MainSellerState state) async {
    if (state is MainSellerGetCategory) {
      _getCategoriesSuccess(state);
    } else if (state is MainSellerGetMyRestaurant) {
      _restaurant = state.restaurant;
      await _storeRestaurantInLocalDB(_restaurant);
    } else if (state is MainSellerFailure) {
      snackBar(context: context, text: state.errorMsg);
    }
  }

  bool get _myRestaurantIsNotValid {
    final mySharedPreferences = getIt<MySharedPreferences>();
    final String? restaurantName = mySharedPreferences.getString(
      RestaurantInfoParams.restaurantName.toString(),
    );
    final String? deliveryTime = mySharedPreferences.getString(
      RestaurantInfoParams.deliveryTime.toString(),
    );
    final String? deliveryCost = mySharedPreferences.getString(
      RestaurantInfoParams.deliveryCost.toString(),
    );
    final String? openTime = mySharedPreferences.getString(
      RestaurantInfoParams.openTime.toString(),
    );
    final String? closeTime = mySharedPreferences.getString(
      RestaurantInfoParams.closeTime.toString(),
    );

    return (restaurantName == null || restaurantName.isEmpty) ||
        (deliveryTime == null || deliveryTime.isEmpty) ||
        (deliveryCost == null || deliveryCost.isEmpty) ||
        (openTime == null || openTime.isEmpty) ||
        (closeTime == null || closeTime.isEmpty);
  }

  void _handleAddCategory() async {
    if (!_restaurant.isValid) {
      _showCompleteRestaurantDialog(context);
    } else if (_myRestaurantIsNotValid) {
      bool restaurantStoredSuccess = await _storeRestaurantInLocalDB(
        _restaurant,
      );
      if (restaurantStoredSuccess) {
        _addCategoryBottomSheet();
      } else {
        snackBar(context: context, text: "Failed to store restaurant");
      }
      snackBar(context: context, text: "Not In Local DB");
    } else if (_restaurant.isValid && !_myRestaurantIsNotValid) {
      _addCategoryBottomSheet();
    }
  }

  Future<bool> _storeRestaurantInLocalDB(RestaurantModel restaurant) async {
    return await context.read<MainSellerCubit>().storeRestaurantInLocalDB(
      restaurant,
    );
  }

  void _showCompleteRestaurantDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const CompleteRestaurantDialogWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.height20 * 2,
        right: Dimensions.height20,
        left: Dimensions.height20,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextField(
                isSeller: true,
                controller: _searchCategoryController,
                onChange: (value) {},
              ),
              Expanded(
                child: BlocConsumer<MainSellerCubit, MainSellerState>(
                  listener: (context, state) => _handleState(state),
                  builder: (context, state) {
                    if (state is MainSellerLoading) {
                      return const Loading();
                    } else if (state is MainSellerFailure) {
                      return CustomErrorWidget(errorMessage: state.errorMsg);
                    }

                    if (_listOfCategories.isEmpty) {
                      return const EmptyWidget();
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Dimensions.height20),
                          Text(
                            context.translate.categories,
                            style: Styles.textStyle30(context),
                          ),
                          SizedBox(height: Dimensions.height20),
                          CategorySellerListView(
                            list: _listOfCategories,
                            searchFoodController: _searchFoodController,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          CustomFloatButton(onClick: _handleAddCategory),
        ],
      ),
    );
  }
}
