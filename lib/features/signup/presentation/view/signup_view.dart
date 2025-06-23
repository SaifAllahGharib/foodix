import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/di.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/signup/data/repos/signup_repo_imp.dart';
import 'package:foodix/features/signup/presentation/view/widgets/signup_view_body.dart';
import 'package:foodix/features/signup/presentation/viewmodel/cubits/signup/signup_cubit.dart';

class SignupView extends StatelessWidget {
  static const id = "/signup_view";

  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<SignupRepositoryImp>()),
      child: Scaffold(
        body: SignupViewBody(role: context.goRouterState.extra as String),
      ),
    );
  }
}
