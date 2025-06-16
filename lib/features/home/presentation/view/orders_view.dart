import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_item_order_list_view.dart';
import 'package:foodix/features/home/presentation/view/widgets/dates_orders_list_view.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/orders/orders_cubit.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/orders/orders_state.dart';
import 'package:foodix/generated/l10n.dart';

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
            top: Dimensions.height20 * 2,
            right: Dimensions.height20,
            left: Dimensions.height20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Dimensions.height10),
              Text(
                S.of(context).yourOrders,
                style: Styles.textStyle18(context),
              ),
              SizedBox(height: Dimensions.height20),
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
