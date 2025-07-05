import 'package:flutter/cupertino.dart';  
import 'package:flutter_bloc/flutter_bloc.dart';  
import 'package:foodix/core/utils/image_picker_helper.dart';  
import 'package:foodix/features/home/data/repos/profile/profile_repo.dart';  
import 'package:foodix/features/home/presentation/viewmodel/cubits/profile/profile_state.dart';  

class ProfileCubit extends Cubit<ProfileState> {
  final ImagePickerHelper _imagePickerHelper;
  final ProfileRepository _profileRepository;
  bool _isEnabled = false;

  ProfileCubit(this._imagePickerHelper, this._profileRepository)
    : super(ProfileInitState());

  Future<void> pickImageFromCamera() async {
    String? selectedImage = await _imagePickerHelper.pickFromCamera();
    emit(ProfilePickImageState(selectedImage));
  }

  Future<void> pickImageFromGallery() async {
    String? selectedImage = await _imagePickerHelper.pickFromGallery();
    emit(ProfilePickImageState(selectedImage));
  }

  Future<void> signOut() async {
    emit(ProfileLoadingState());
    final result = await _profileRepository.signOut();
    result.when(
      failure: (e) => emit(ProfileFailureState(e.message!)),
      success: (r) => emit(ProfileSignOutState()),
    );
  }

  Future<void> updateName(String name) async {
    emit(ProfileLoadingState());
    final result = await _profileRepository.updateName(name);
    result.when(
      failure: (e) => emit(ProfileFailureState(e.message!)),
      success: (r) => emit(ProfileUpdateNameState(name)),
    );
  }

  void enableButton(TextEditingController controller) {
    _isEnabled = controller.text.isNotEmpty;
    emit(ProfileEnableButtonState());
  }

  bool get isEnabled => _isEnabled;
}
