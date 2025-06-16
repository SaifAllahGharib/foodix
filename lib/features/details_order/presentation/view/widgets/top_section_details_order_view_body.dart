import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/widgets/custom_details_order_name_image.dart';
import 'package:foodix/features/details_order/presentation/view/widgets/custom_time_widget.dart';

class TopSectionDetailsOrderViewBody extends StatelessWidget {
  const TopSectionDetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDetailsOrderNameImage(customTextDetails: true),
        SizedBox(height: Dimensions.height10),
        const CustomTimeWidget(day: "Today", time: "12:30 PM"),
      ],
    );
  }
}
