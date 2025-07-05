import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/custom_app_bar_restaurant_view.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/custom_category_tab_bar.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/custom_restaurant_product_list.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/top_section_restaurant_view.dart';
import 'package:foodix/features/restaurant/viewmodel/cubits/restaurant/restaurant_cubit.dart';
import 'package:foodix/features/restaurant/viewmodel/cubits/restaurant/restaurant_state.dart';

import '../../../../../core/shared/models/category_model.dart';

class RestaurantViewBody extends StatefulWidget {
  const RestaurantViewBody({super.key});

  @override
  State<RestaurantViewBody> createState() => _RestaurantViewBodyState();
}

class _RestaurantViewBodyState extends State<RestaurantViewBody>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final TabController _tabController;
  late final List<GlobalKey> keys;
  double _opacity = 0.0;
  double _appBarHeight = 0.0;
  final List<CategoryModel> listOfFoodCategories = [];

  @override
  void initState() {
    super.initState();
    initControllers();
    _generateGlobalKeys();
    _scrollControllerListener();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void initControllers() {
    _scrollController = ScrollController();
    _tabController = TabController(
      length: listOfFoodCategories.length,
      vsync: this,
    );
  }

  void _scrollControllerListener() {
    _scrollController.addListener(() {
      animateToTab();
      _showCategoryTabBar();
      _updateOpacity();
    });
  }

  void _showCategoryTabBar() {
    context.read<RestaurantCubit>().showCategoryTabBar(
      _scrollController.offset,
    );
  }

  void _updateOpacity() {
    context.read<RestaurantCubit>().updateOpacity(
      (_scrollController.offset / 200).clamp(0, 1),
    );
  }

  void _generateGlobalKeys() {
    keys = List.generate(listOfFoodCategories.length, (index) => GlobalKey());
  }

  void _onClickCategory(int index) {
    _scrollController.removeListener(() => animateToTab());

    _scrollToCategory(index);
  }

  void _scrollToCategory(int index) {
    final context = keys[index].currentContext;

    Scrollable.ensureVisible(
      context!,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      alignment: context.responsive.height10 * 0.04,
    );
  }

  void animateToTab() {
    late RenderBox box;
    for (int i = 0; i < keys.length; i++) {
      box = keys[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (_scrollController.offset >= position.dy) {
        _tabController.animateTo(
          i,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _handleStates(state) {
    if (state is RestaurantShowCategoryListViewState) {
      _appBarHeight = state.appBarHeight;
    }

    if (state is RestaurantUpdateOpacityState) {
      _opacity = state.opacity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantState>(
      listener: (context, state) => _handleStates(state),
      builder: (context, state) {
        return SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  const SliverToBoxAdapter(child: TopSectionRestaurantView()),
                  SliverToBoxAdapter(
                    child: CustomCategoryTabBar(
                      tabController: _tabController,
                      list: listOfFoodCategories,
                      onClickCategory: (index) => _onClickCategory(index),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomRestaurantProductList(
                      keys: keys,
                      listOfFoodCategories: listOfFoodCategories,
                    ),
                  ),
                ],
              ),
              CustomAppBarRestaurantView(
                tabController: _tabController,
                opacity: _opacity,
                list: listOfFoodCategories,
                appBarHeight: _appBarHeight,
                onClickCategory: (index) => _onClickCategory(index),
              ),
            ],
          ),
        );
      },
    );
  }
}
