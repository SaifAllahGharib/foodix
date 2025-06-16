import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/service_locator.dart';
import 'package:foodix/features/verification/data/repos/verificatoin_repo_imp.dart';
import 'package:foodix/features/verification/presentation/view/widgets/verification_view_body.dart';
import 'package:foodix/features/verification/presentation/viewmodel/cubits/verification/verification_cubit.dart';

class VerificationView extends StatelessWidget {
  static const String id = "/verification_view";
  final String email;

  const VerificationView({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(
        getIt.get<VerificationRepositoryImp>(),
      ),
      child: Scaffold(
        body: VerificationViewBody(email: email),
      ),
    );
  }
}
