import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/di.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/functions/snack_bar.dart';
import 'package:foodix/core/utils/my_shared_preferences.dart';
import 'package:foodix/core/utils/roles.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/home/presentation/view/widgets/change_language_widget.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_image_profile_view.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_item_profile_view.dart';
import 'package:foodix/features/home/presentation/view/widgets/name_and_email.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/home/home_cubit.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/profile/profile_cubit.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/profile/profile_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/models/user_model.dart';

class ProfileView extends StatefulWidget {
  final UserModel user;

  const ProfileView({super.key, required this.user});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _storage = getIt.get<MySharedPreferences>();
  String? _imagePath;
  late final UserRole? _userRole;

  @override
  void initState() {
    _userRole = getIt<MySharedPreferences>().getRoleUser();
    super.initState();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: const Color(0x77909090),
      backgroundColor: Colors.white,
      sheetAnimationStyle: const AnimationStyle(
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeInBack,
      ),
      builder: (context) {
        return const ChangeLanguageWidget();
      },
    );
  }

  void _pickImageFromCamera(BuildContext context) {
    context.read<ProfileCubit>().pickImageFromCamera();
  }

  void _pickImageFromGallery(BuildContext context) {
    context.read<ProfileCubit>().pickImageFromGallery();
  }

  void _signOut(BuildContext context) {
    context.read<ProfileCubit>().signOut();
    context.read<HomeCubit>().resetState();
  }

  void _signOutSuccess() {
    getIt.get<MySharedPreferences>().clearAllData();
    snackBar(
      context: context,
      text: context.translate.success,
      color: AppColors.primaryColor,
    );
    GoRouter.of(context).go("/");
  }

  void _updateNameSuccess(state) {
    snackBar(
      context: context,
      text: context.translate.success,
      color: AppColors.primaryColor,
    );
    getIt.get<MySharedPreferences>().storeString("name", state.newName);
  }

  void _handelStates(state) {
    if (state is ProfilePickImageState) {
      _imagePath = state.image;
    } else if (state is ProfileSignOutState) {
      _signOutSuccess();
    } else if (state is ProfileUpdateNameState) {
      _updateNameSuccess(state);
    } else if (state is ProfileFailureState) {
      snackBar(context: context, text: state.errorMsg);
    }
  }

  void _handleRoleNavigation(BuildContext context) {
    switch (_userRole) {
      case Seller():
        _userRole.navigate(context);
        break;
      case Buyer():
        _userRole.navigate(context);
      case null:
        snackBar(context: context, text: "User Role is NULL");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) => _handelStates(state),
      builder: (context, state) {
        if (state is ProfileLoadingState) return const Loading();

        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dimensions.height30),
              CustomImageProfileView(
                imageURL: _imagePath,
                pickImageFromCamera: () => _pickImageFromCamera(context),
                pickImageFromGallery: () => _pickImageFromGallery(context),
              ),
              SizedBox(height: Dimensions.height15),
              NameAndEmail(
                name: _storage.getNameUser() == null
                    ? widget.user.name ?? ""
                    : _storage.getNameUser()!,
                email: _storage.getEmailUser() == null
                    ? widget.user.name ?? ""
                    : _storage.getEmailUser()!,
              ),
              SizedBox(height: Dimensions.height20),
              Divider(
                color: AppColors.whiteGray,
                height: 1,
                thickness: Dimensions.height10,
              ),
              SizedBox(height: Dimensions.height45),
              CustomItemProfileView(
                title: _userRole == getIt<Seller>()
                    ? context.translate.myRestaurant
                    : context.translate.addresses,
                onClick: () => _handleRoleNavigation(context),
              ),
              SizedBox(height: Dimensions.height30),
              CustomItemProfileView(
                title: context.translate.language,
                onClick: () => _showBottomSheet(context),
              ),
              SizedBox(height: Dimensions.height30),
              CustomItemProfileView(
                title: context.translate.logout,
                dividerIsShowing: false,
                onClick: () => _signOut(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
