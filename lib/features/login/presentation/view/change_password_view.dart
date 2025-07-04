import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/login/presentation/view/widgets/change_password_view_body.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/change_password/change_password_cubit.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = context.arguments as Map<String, dynamic>;

    return BlocProvider(
      create: (context) => ChangePasswordCubit(
        // getIt.get<ChangePasswordRepositoryImp>(),
      ),
      child: Scaffold(
        body: ChangePasswordViewBody(
          verifyCode: extra["code"],
          user: extra["user"],
        ),
      ),
    );
  }
}
