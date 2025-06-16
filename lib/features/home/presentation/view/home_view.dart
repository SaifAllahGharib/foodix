import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/core/utils/functions/snack_bar.dart';
import 'package:foodix/core/utils/my_shared_preferences.dart';
import 'package:foodix/core/utils/service_locator.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/home/data/repos/main_buyer/main_buyer_repo_imp.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:foodix/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/home/home_cubit.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/home/home_state.dart';

import '../../../../core/shared/models/user_model.dart';
import '../viewmodel/cubits/main_buyer/main_buyer/main_buyer_cubit.dart';

class HomeView extends StatefulWidget {
  static const String id = "/home_view";

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  UserModel user = UserModel();

  @override
  void initState() {
    _getUser(context);
    super.initState();
  }

  void _getUser(BuildContext context) {
    final storage = getIt.get<MySharedPreferences>();
    if (storage.getIdUser() == null &&
        storage.getNameUser() == null &&
        storage.getEmailUser() == null &&
        storage.getRoleUser() == null &&
        storage.getPhoneUser() == null) {
      context.read<HomeCubit>().getUser();
    }
  }

  void _handleState(state) {
    if (state is HomeChangeViewState) {
      _selectedIndex = state.selectedIndex;
    } else if (state is HomeSuccessState) {
      user = state.user;
      getIt.get<MySharedPreferences>().storeUser(state.user.toJson());
    } else if (state is FirebaseDBFailure) {
      snackBar(context: context, text: state.errorMsg);
    } else if (state is FirebaseFailure) {
      snackBar(context: context, text: state.errorMsg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainBuyerCubit(getIt<MainBuyerRepoImp>()),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) => _handleState(state),
        builder: (context, state) {
          if (state is HomeLoadingState) return const Loading();

          return Scaffold(
            body: HomeViewBody(selectedIndex: _selectedIndex, user: user),
            bottomNavigationBar: CustomBottomNavigationBar(
              onIndexChanged: (index) {
                context.read<HomeCubit>().changeTab(index);
              },
            ),
          );
        },
      ),
    );
  }
}
