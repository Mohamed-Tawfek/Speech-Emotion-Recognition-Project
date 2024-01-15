import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(SettingsInitial());
  static AccountCubit get(context) => BlocProvider.of(context);
  final ImagePicker _picker = ImagePicker();
  File? photo;
  Future<void> takePhoto() async {
    final XFile? result = await _picker.pickImage(source: ImageSource.camera);
    if (result != null) {
      photo = File(result.path);
      emit(TakenPhotoState());
    }
  }

  Future<void> uploadPhoto() async {
    final XFile? result = await _picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      photo = File(result.path);
      emit(TakenPhotoState());
    }
  }
}
