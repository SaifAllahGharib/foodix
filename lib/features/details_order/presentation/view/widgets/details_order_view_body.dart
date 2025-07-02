import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/features/details_order/presentation/view/widgets/bottom_section_details_order_view_body.dart';
import 'package:foodix/features/details_order/presentation/view/widgets/middle_section_details_order_view_body.dart';
import 'package:foodix/features/details_order/presentation/view/widgets/top_section_details_order_view_body.dart';

class DetailsOrderViewBody extends StatelessWidget {
  const DetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive.height20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.responsive.height20.verticalSpace,
          const CustomBackButton(),
          SizedBox(height: context.responsive.height15),
          const TopSectionDetailsOrderViewBody(),
          context.responsive.height20.verticalSpace,
          const Divider(color: AppColors.gray, height: 1),
          context.responsive.height20.verticalSpace,
          const MiddleSectionDetailsOrderViewBody(),
          context.responsive.height20.verticalSpace,
          const Divider(color: AppColors.gray, height: 1),
          context.responsive.height20.verticalSpace,
          CustomText(
            text: context.tr.yourOrder,
            textSize: Dimensions.fontSize20 * 1.1,
            alignment: currentLocaleIsArabic
                ? Alignment.topRight
                : Alignment.topLeft,
          ),
          context.responsive.height10.verticalSpace,
          const BottomSectionDetailsOrderViewBody(),
        ],
      ),
    );
  }
}
