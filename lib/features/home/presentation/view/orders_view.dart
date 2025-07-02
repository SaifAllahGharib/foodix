import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/AppStyles.dart';
import 'package:foodix/core/utils/extensionsentation/view/widgets/custom_item_order_list_view.dart';
import 'package:foodix/features/home/presentation/view/widgets/dates_orders_list_view.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/orders/orders_cubit.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/orders/orders_state.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  int _selectedIndex = 0;
  final List<String> listOfDates = [
    "20 December",
    "19 December",
    "18 December",
    "17 December",
    "16 December",
    "15 December",
  ];

  void _handelState(state) {
    if (state is OrdersUpdateSelectedDayState) {
      _selectedIndex = state.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) => _handelState(state),
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: context.responsive.height20 * 2,
            right: context.responsive.height20,
            left: context.responsive.height20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.responsive.height10.verticalSpace,
              Text(context.tr.yourOrders, style: context.textStyle.s18W600),
              context.responsive.height20.verticalSpace,
              DatesOrdersListView(
                list: listOfDates,
                selectedIndex: _selectedIndex,
              ),
              SizedBox(height: Dimensions.height30),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return const CustomItemOrderListView();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
