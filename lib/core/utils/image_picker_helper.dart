import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  final ImagePicker picker;

  ImagePickerHelper({required this.picker});

  Future<String?> pickFromCamera() async {
    return await _safePick(() async {
      final picked = await picker.pickImage(source: ImageSource.camera);
      return picked?.path;
    });
  }

  Future<String?> pickFromGallery() async {
    return await _safePick(() async {
      final picked = await picker.pickImage(source: ImageSource.gallery);
      return picked?.path;
    });
  }

  Future<String?> _safePick(Future<String?> Function() action) async {
    try {
      return await action();
    } catch (_) {
      return null;
    }
  }
}
