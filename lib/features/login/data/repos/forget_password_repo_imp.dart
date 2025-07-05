class ForgetPasswordRepositoryImp {
  ForgetPasswordRepositoryImp();

  // @override
  // Future<Result<AppFailure, ResponseModel>> forgetPassword(String email) async {
  //   try {
  //     var response = await _api.post(
  //       endPoint: "auth/forget_password.php",
  //       data: {"email": email},
  //     );
  //
  //     return right(ResponseModel.fromJson(response));
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     }
  //
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
}
