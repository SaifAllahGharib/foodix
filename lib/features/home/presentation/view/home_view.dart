import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/di/dependency_injection.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/home/data/repos/main_buyer/main_buyer_repo_imp.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:foodix/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/home/home_cubit.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/home/home_state.dart';

import '../../../../core/services/shared_preferences_service.dart';
import '../../../../core/shared/functions/snack_bar.dart';
import '../../../../core/shared/models/user_model.dart';
import '../viewmodel/cubits/main_buyer/main_buyer/main_buyer_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  late UserModel _user;

  @override
  void initState() {
    _user = UserModel();
    _getUser(context);
    super.initState();
  }

  void _getUser(BuildContext context) {
    final storage = getIt.get<SharedPreferencesService>();
    if (storage.getIdUser() == null ||
        storage.getNameUser() == null ||
        storage.getEmailUser() == null ||
        storage.getRoleUser() == null ||
        storage.getPhoneUser() == null) {
      context.read<HomeCubit>().getUser();
    }
  }

  void _handleState(HomeState state) async {
    if (state is HomeChangeViewState) {
      _selectedIndex = state.selectedIndex;
    } else if (state is HomeSuccessState) {
      _user = state.user;
      await getIt.get<SharedPreferencesService>().storeUser(_user.toJson());
    } else if (state is HomeFailureState) {
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
            body: HomeViewBody(selectedIndex: _selectedIndex, user: _user),
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
