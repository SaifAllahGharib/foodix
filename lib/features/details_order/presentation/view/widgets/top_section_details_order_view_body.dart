import 'package:flutter/material.dart';
import 'package:foodix/core/widgets/custom_details_order_name_image.dart';
import 'package:foodix/features/details_order/presentation/view/widgets/custom_time_widget.dart';

class TopSectionDetailsOrderViewBody extends StatelessWidget {
  const TopSectionDetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDetailsOrderNameImage(customTextDetails: true),
        context.responsive.height10.verticalSpace,
        const CustomTimeWidget(day: "Today", time: "12:30 PM"),
      ],
    );
  }
}
