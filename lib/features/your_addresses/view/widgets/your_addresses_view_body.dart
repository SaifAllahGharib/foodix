import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/features/your_addresses/view/widgets/list_view_addresses.dart';
import 'package:foodix/generated/l10n.dart';

class YourAddressesViewBody extends StatelessWidget {
  const YourAddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  SizedBox(width: Dimensions.width30),
                  Text(
                    S.of(context).addresses,
                    style: Styles.textStyle18(context)
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {},
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Text(
                  S.of(context).add,
                  style: Styles.textStyle15(context).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
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
