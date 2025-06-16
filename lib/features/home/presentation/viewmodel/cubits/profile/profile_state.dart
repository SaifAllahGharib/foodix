

sealed class ProfileState {}

class ProfileInitState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {}

class ProfileFailureState extends ProfileState {
  final String errorMsg;

  ProfileFailureState(this.errorMsg);
}

class ProfileSignOutState extends ProfileState {}

class ProfileUpdateNameState extends ProfileState {
  final String newName;

  ProfileUpdateNameState(this.newName);
}

class ProfilePickImageState extends ProfileState {
  final String? image;

  ProfilePickImageState(this.image);
}

class ProfileEnableButtonState extends ProfileState {}
