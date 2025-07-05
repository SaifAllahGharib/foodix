import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';

import '../../../../../core/shared/viewmodel/cubits/locale_cubit.dart';
import '../../../../../core/utils/app_assets.dart';
import 'lang_widget.dart';

class ChooseLanguageViewBody extends StatefulWidget {
  const ChooseLanguageViewBody({super.key});

  @override
  State<ChooseLanguageViewBody> createState() => _ChooseLanguageViewBodyState();
}

class _ChooseLanguageViewBodyState extends State<ChooseLanguageViewBody> {
  final Map<String, String> _languages = {'العربية': 'ar', 'English': 'en'};
  final List<String> _countryFlags = [AppAssets.flagEgypt, AppAssets.flagUSA];
  int _selectedIndex = 0;

  String get _selectedLanguage => _languages.values.elementAt(_selectedIndex);

  void _setLocale(String lang) {
    context.read<LocaleCubit>().setLocale(lang);
  }

  void _onLanguageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _setLocale(_selectedLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive.padding20),
      child: Column(
        children: [
          context.responsive.height20.verticalSpace,
          Container(
            width: context.responsive.height40,
            height: context.responsive.height40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Icon(
              Icons.language_outlined,
              color: Colors.white,
              size: context.responsive.iconSize24,
            ),
          ),
          context.responsive.height20.verticalSpace,
          Text(context.tr.selectLang, style: context.textStyle.s18W600),
          context.responsive.height10.verticalSpace,
          Text(
            context.tr.chooseYourPreferredLanguage,
            style: context.textStyle.s18W600,
          ),
          context.responsive.height20.verticalSpace,
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
          AppButton(
            isEnabled: true,
            text: context.tr.continueText,
            onClick: () => context.navigator.pushNamedAndRemoveUntil(
              AppRouteName.login,
              (route) => false,
            ),
          ),
        ],
      ),
    );
  }
}
