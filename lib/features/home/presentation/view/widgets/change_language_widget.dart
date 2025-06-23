import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_divider.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_button_language.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/viewmodel/cubits/local_cubit.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  void _changeLanguage(BuildContext context, String lang) async {
    await context.read<LocalCubit>().changeLanguage(lang);
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height15),
      child: SizedBox(
        height: Dimensions.height130 * 1.6,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDivider(),
            SizedBox(height: Dimensions.height10),
            Row(
              children: [
                const CustomBackButton(),
                SizedBox(width: Dimensions.width30),
                Text(
                  context.translate.language,
                  style: Styles.textStyle18(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height20),
            CustomButtonLanguage(
              text: "العربيه",
              onClick: () => _changeLanguage(context, "ar"),
            ),
            SizedBox(height: Dimensions.height20),
            CustomButtonLanguage(
              text: "English",
              onClick: () => _changeLanguage(context, "en"),
            ),
          ],
        ),
      ),
    );
  }
}
