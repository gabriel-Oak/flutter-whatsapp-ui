import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    _takePick();    

    return Center(
      child: Text('Camera', style: TextStyle(fontSize: 20)),
    );
  }

  _takePick() async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
  }
}