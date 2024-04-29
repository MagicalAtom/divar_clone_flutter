import 'package:image_picker/image_picker.dart';
Future<List<XFile>> selectImages() async {
  List<XFile> images = [];
  ImagePicker imagePicker = ImagePicker();
  List<XFile> imagesPick = await imagePicker.pickMultiImage(
    maxWidth: 1000,
    maxHeight: 1000,
  );
  if(imagesPick != null && imagesPick.length <= 5){
    return imagesPick;
  }else{
    return [];
  }
}