import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/features/your_addresses/view/widgets/list_view_addresses.dart';

class YourAddressesViewBody extends StatelessWidget {
  const YourAddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive.height20),
      child: Column(
        children: [
          context.responsive.height10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  context.responsive.width30.horizontalSpace,
                  Text(
                    context.tr.addresses,
                    style: AppStyles.textStyle18(
                      context,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {},
                color: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    context.responsive.radius20,
                  ),
                ),
                child: Text(
                  context.tr.add,
                  style: AppStyles.textStyle15(
                    context,
                  ).copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const ListViewAddresses(),
        ],
      ),
    );
  }
}
