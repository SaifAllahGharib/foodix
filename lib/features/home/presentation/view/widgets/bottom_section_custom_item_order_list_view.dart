import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_details_order_name_image.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';
import 'package:foodix/features/details_order/presentation/view/details_order_view.dart';
import 'package:foodix/generated/l10n.dart';

class BottomSectionCustomItemOrderListView extends StatelessWidget {
  const BottomSectionCustomItemOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.height20,
        right: Dimensions.height15,
        bottom: Dimensions.height20,
        left: Dimensions.height15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomDetailsOrderNameImage(),
          SizedBox(height: Dimensions.height15),
          const CustomRowCost(egp: 280),
          SizedBox(height: Dimensions.height10 * 0.3),
          InkWell(
            onTap: () => GoRouter.of(context).push(DetailsOrderView.id),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            enableFeedback: false,
            child: Text(
              S.of(context).orderDetails,
              style: Styles.textStyle15(context).copyWith(
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
