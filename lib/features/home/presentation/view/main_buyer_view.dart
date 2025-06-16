import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/functions/snack_bar.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/home/data/models/restorant_model.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_app_bar_main_buyer_view.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_sliver_list_view_main_buyer_view.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/main_buyer/main_buyer/main_buyer_cubit.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/main_buyer/main_buyer/main_buyer_state.dart';

class MainBuyerView extends StatefulWidget {
  const MainBuyerView({super.key});

  @override
  State<MainBuyerView> createState() => _MainBuyerViewState();
}

class _MainBuyerViewState extends State<MainBuyerView> {
  late final List<RestaurantModel> restaurants;

  @override
  void initState() {
    context.read<MainBuyerCubit>().getRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBuyerCubit, MainBuyerState>(
      listener: (context, state) {
        if (state is MainBuyerFailure) {
          snackBar(context: context, text: state.message);
        } else if (state is MainBuyerSuccess) {
          restaurants = state.data;
        }
      },
      builder: (context, state) {
        if (state is MainBuyerLoading) return Loading();

        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomAppBarMainBuyerView()),
            SliverPadding(
              padding: EdgeInsets.all(Dimensions.height20),
              sliver: CustomSliverListViewMainBuyerView(list: restaurants),
            ),
          ],
        );
      },
    );
  }
}
