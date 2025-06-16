import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/features/signup/data/models/signup_model.dart';

abstract class SignupRepository {
  Future<Either<Failure, String>> signup(
      SignupModel user, BuildContext context);
}
