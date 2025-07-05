import 'package:flutter/material.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';

import '../../../../../core/widgets/custom_details_order_name_image.dart';

class BottomSectionCustomItemOrderListView extends StatelessWidget {
  const BottomSectionCustomItemOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.responsive.padding20,
        right: context.responsive.padding15,
        bottom: context.responsive.padding20,
        left: context.responsive.height15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomDetailsOrderNameImage(),
          SizedBox(height: context.responsive.height15),
          const CustomRowCost(egp: 280),
          SizedBox(height: context.responsive.height3),
          InkWell(
            onTap: () => context.navigator.pushNamed(AppRouteName.detailsOrder),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            enableFeedback: false,
            child: Text(
              context.tr.orderDetails,
              style: context.textStyle.s15W400.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
