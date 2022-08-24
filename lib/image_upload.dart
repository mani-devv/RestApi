import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;
  String error = '';

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {
        error = 'Ready to Upload';
      });
    } else {
      setState(() {
        error ="No Image Selected";
      });
    }
  }

  Future<void> uploadImage() async {
    if (image != null) {
      setState(() {
        showSpinner = true;
      });
      var stream = http.ByteStream(image!.openRead());
      stream.cast();

      var length = await image!.length();

      var uri = Uri.parse('https://fakestoreapi.com/products');

      var request = http.MultipartRequest('POST', uri);

      request.fields['title'] = "Static title";

      var multiport = http.MultipartFile('image', stream, length);

      request.files.add(multiport);

      var response = await request.send();

      if (response.statusCode == 200) {
        setState(() {
          showSpinner = false;
          error = 'Image Uploaded';
        });
        
      } else {
        setState(() {
          showSpinner = false;
          error = 'Failed to Upload';
        });
        
      }
    } else {
      setState(() {
        error = 'Please Select Image';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Upload Image"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => getImage(),
              child: Container(
                child: image == null
                    ? const Center(
                        child:  Text('Pick Image'),
                      )
                    : Center(
                      child: Image.file(
                        File(image!.path).absolute,
                        height: 200,
                        width: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(110, 45)),
              ),
              onPressed: () => uploadImage(),
              child: const Text('Upload'),
            ),
            const SizedBox(
              height: 70,
            ),
            Text(error != null ?  error : 'No Image Slected'),
          ],
        ),
      ),
    );
  }
}
