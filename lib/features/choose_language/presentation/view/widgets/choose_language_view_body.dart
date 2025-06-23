import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/viewmodel/cubits/local_cubit.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../login/presentation/view/login_view.dart';
import 'lang_widget.dart';

class ChooseLanguageViewBody extends StatefulWidget {
  const ChooseLanguageViewBody({super.key});

  @override
  State<ChooseLanguageViewBody> createState() => _ChooseLanguageViewBodyState();
}

class _ChooseLanguageViewBodyState extends State<ChooseLanguageViewBody> {
  final Map<String, String> _languages = {'العربية': 'ar', 'English': 'en'};
  final List<String> _countryFlags = [Assets.flagEgypt, Assets.flagUSA];
  int _selectedIndex = 0;

  String get _selectedLanguage => _languages.values.elementAt(_selectedIndex);

  void _storeLanguage(String lang) async {
    await context.read<LocalCubit>().changeLanguage(lang);
  }

  void _onLanguageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _storeLanguage(_selectedLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height20),
          Container(
            width: Dimensions.height45 * 0.9,
            height: Dimensions.height45 * 0.9,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.disabledColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Icon(
              Icons.language_outlined,
              color: Colors.white,
              size: Dimensions.iconSize24,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          Text(
            context.translate.selectLang,
            style: Styles.textStyle18(context),
          ),
          SizedBox(height: Dimensions.height10),
          Text(
            context.translate.chooseYourPreferredLanguage,
            style: Styles.textStyle18(context),
          ),
          SizedBox(height: Dimensions.height20),
          Expanded(
            child: ListView.builder(
              itemCount: _languages.length,
              itemBuilder: (context, index) {
                return LangWidget(
                  onTap: () => _onLanguageSelected(index),
                  selected: _selectedIndex == index,
                  lang: _languages.keys.elementAt(index),
                  flag: _countryFlags[index],
                );
              },
            ),
          ),
          CustomButton(
            isEnabled: true,
            text: context.translate.continueText,
            onClick: () => context.go(LoginView.id),
          ),
        ],
      ),
    );
  }
}
