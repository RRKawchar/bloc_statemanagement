import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_practice/bloc/image_picker/image_picker_states.dart';
import 'package:bloc_practice/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates>{
 final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils):super(const ImagePickerStates()){
    on<CameraCapture>(_cameraCapture);
    on<ImageFromGallery>(_imageFromGallery);

  }

  void _cameraCapture(CameraCapture event,Emitter<ImagePickerStates> emit)async{

    final XFile? file=await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
 void _imageFromGallery(ImageFromGallery event,Emitter<ImagePickerStates> emit)async{

   final XFile? file=await imagePickerUtils.imageFromGallery();
   emit(state.copyWith(file: file));
 }
}