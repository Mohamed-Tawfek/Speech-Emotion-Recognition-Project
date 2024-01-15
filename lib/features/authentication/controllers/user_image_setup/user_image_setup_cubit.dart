import 'dart:io';

 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'user_image_setup_state.dart';

class UserImageSetupCubit extends Cubit<UserImageSetupState> {
  UserImageSetupCubit() : super(UserImageSetupInitial());
  static UserImageSetupCubit get(context)=>BlocProvider.of(context);
  final ImagePicker _picker = ImagePicker();
  File? photo;
 Future<void> takePhoto() async {
    final XFile? result = await _picker.pickImage(source: ImageSource.camera);
    if (result != null) {
      photo = File(result.path);
      emit(TakenPhotoState());
    }
  }

  Future<void>  uploadPhoto() async {
    final XFile? result = await _picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      photo = File(result.path);
      emit(TakenPhotoState());
    }
  }
}
