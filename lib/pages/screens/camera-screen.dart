import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatelessWidget {
  var picture = null;

  @override
  Widget build(BuildContext context) {

    _takePick();    

    return Center(
      child: Text('Camera'),
    );
  }

  _takePick() async {
    picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
  }
}