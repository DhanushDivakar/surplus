import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AadharImagePicker extends Cubit<String?> {
  AadharImagePicker() : super(null);

  void getAadharImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: source, imageQuality: 10);
    if (pickedFile == null) {
      return;
    }
    emit(pickedFile.path);
  }

  void resetImage() {
    emit(null);
  }
}
