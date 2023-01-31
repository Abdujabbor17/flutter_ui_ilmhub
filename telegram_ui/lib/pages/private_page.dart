import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PrivatePage extends StatefulWidget {
  const PrivatePage({Key? key}) : super(key: key);

  @override
  State<PrivatePage> createState() => _PrivatePageState();
}

class _PrivatePageState extends State<PrivatePage> {

  final ImagePicker _picker = ImagePicker();

   File _image = File('');
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: _image.path == ''
                  ? Center(child: Text("No image selected"))
                  : Image.file(_image,fit: BoxFit.cover,),
            ),

            ElevatedButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text("Take a photo"),
                          onTap: () async {
                            await _pickImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.image),
                          title: Text("Pick from gallery"),
                          onTap: () async {
                            await _pickImage(ImageSource.gallery);
                            print('=====================================================================');
                            print(_image.path);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                child: Text('Get Image'))
          ],
        ),
      ),



    );
  }
}
