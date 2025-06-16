import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/viewmodel/cubits/local_cubit.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/custom_text.dart';
import 'package:foodix/features/login/presentation/view/login_view.dart';

class ChooseLanguageViewBody extends StatelessWidget {
  const ChooseLanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height45 * 3),
          const CustomText(
            text: "اختار اللغه",
            fontFamily: "cairo",
          ),
          SizedBox(height: Dimensions.height45 * 7),
          CustomButton(
            text: "عربي",
            isEnabled: true,
            fontFamily: "cairo",
            onClick: () {
              _storeLanguageAndNavigate(context, "ar");
            },
          ),
          SizedBox(height: Dimensions.height20),
          CustomButton(
            text: "English",
            isEnabled: true,
            fontFamily: "poppins",
            onClick: () {
              _storeLanguageAndNavigate(context, "en");
            },
          ),
        ],
      ),
    );
  }

  void _storeLanguageAndNavigate(BuildContext context, String lang) async {
    await context.read<LocalCubit>().changeLanguage(lang);
    GoRouter.of(context).go(LoginView.id);
  }
}
