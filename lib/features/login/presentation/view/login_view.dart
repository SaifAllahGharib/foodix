import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/di/dependency_injection.dart';
import 'package:foodix/features/login/data/repos/login_repo_imp.dart';
import 'package:foodix/features/login/presentation/view/widgets/login_view_body.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/login/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<LoginRepositoryImp>()),
      child: const Scaffold(body: LoginViewBody()),
    );
  }
}
