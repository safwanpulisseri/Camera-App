// home.dart
import 'package:flutter/material.dart';
import 'package:week_6_camera/screens/image.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CAMERA APP'),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.red.shade700,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 200,
                height: 100,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 30,
                                ),
                              ),
                              Text('Choose an option'),
                            ],
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () => _openCamera(context),
                                icon: Icon(
                                  Icons.camera_alt,
                                ),
                                color: Colors.red,
                              ),
                              IconButton(
                                onPressed: () => _openGallery(context),
                                icon: Icon(
                                  Icons.photo_library,
                                ),
                                color: Colors.red,
                              ),
                            ],
                          ),
                          // actions: [
                          //   IconButton(
                          //     onPressed: () {
                          //       Navigator.of(context).pop();
                          //     },
                          //     icon: Icon(Icons.arrow_back),
                          //   ),
                          // ],
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Take Photo ',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.zero),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenImage(
                            imagePaths: imagePaths,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.folder,
                      size: 100,
                      color: Colors.yellow.shade700,
                    ),
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        imagePaths.add(pickedFile.path);
      });
    }
  }

  Future<void> _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePaths.add(pickedFile.path);
      });
    }
  }
}
