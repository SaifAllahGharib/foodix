import 'package:flutter/material.dart';  
import 'package:flutter_bloc/flutter_bloc.dart';  
import 'package:foodix/core/utils/extensions.dart';  
import 'package:foodix/core/widgets/custom_divider.dart';  
import 'package:foodix/features/home/presentation/view/widgets/custom_button_language.dart';  

import '../../../../../core/shared/viewmodel/cubits/locale_cubit.dart';  
import '../../../../../core/widgets/custom_back_button.dart';  

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  void _changeLanguage(BuildContext context, String lang) {
    context.read<LocaleCubit>().setLocale(lang);
    context.navigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive.height15),
      child: SizedBox(
        height: context.responsive.height130 * 1.6,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDivider(),
            context.responsive.height10.verticalSpace,
            Row(
              children: [
                const CustomBackButton(),
                context.responsive.width30.horizontalSpace,
                Text(context.tr.language, style: context.textStyle.s18W500),
              ],
            ),
            context.responsive.height20.verticalSpace,
            AppButtonLanguage(
              text: "العربيه",
              onClick: () => _changeLanguage(context, "ar"),
            ),
            context.responsive.height20.verticalSpace,
            AppButtonLanguage(
              text: "English",
              onClick: () => _changeLanguage(context, "en"),
            ),
          ],
        ),
      ),
    );
  }
}
