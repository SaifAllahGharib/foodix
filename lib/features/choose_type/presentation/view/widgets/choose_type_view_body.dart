import 'package:flutter/material.dart';
import 'package:foodix/core/utils/assets.dart';
import 'package:foodix/core/utils/di.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/roles.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/custom_image.dart';
import 'package:foodix/core/widgets/custom_text.dart';
import 'package:foodix/features/signup/presentation/view/signup_view.dart';
import 'package:go_router/go_router.dart';

class ChooseTypeViewBody extends StatelessWidget {
  const ChooseTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height20),
          const CustomBackButton(),
          SizedBox(height: Dimensions.height30),
          CustomImage(image: Assets.chooseRole, width: Dimensions.width380),
          const Spacer(),
          CustomText(
            text: context.translate.chooseType,
            textSize: Dimensions.fontSize30 * 0.8,
          ),
          SizedBox(height: Dimensions.height30),
          CustomButton(
            text: context.translate.vendor,
            isEnabled: true,
            onClick: () => _goToSignup(context, getIt<Seller>().toString()),
          ),
          SizedBox(height: Dimensions.height20),
          CustomButton(
            text: context.translate.buyer,
            isEnabled: true,
            onClick: () => _goToSignup(context, getIt<Buyer>().toString()),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _goToSignup(BuildContext context, String type) {
    GoRouter.of(context).pushReplacement(SignupView.id, extra: type);
  }
}
