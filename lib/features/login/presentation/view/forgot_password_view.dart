import 'package:flutter/material.dart';  
import 'package:flutter_bloc/flutter_bloc.dart';  
import 'package:foodix/features/login/presentation/view/widgets/forget_password_view_body.dart';  
import 'package:foodix/features/login/presentation/viewmodel/cubits/forget_password/forget_password_cubit.dart';  

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: const Scaffold(body: ForgotPasswordViewBody()),
    );
  }
}
