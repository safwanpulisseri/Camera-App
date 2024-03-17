import 'dart:io';

import 'package:flutter/material.dart';

class ScreenDetails extends StatelessWidget {
  final String imagePath;

  ScreenDetails({required this.imagePath, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Image'),
        backgroundColor: Colors.red.shade700,
      ),
      body: SafeArea(
        child: Center(
          child: Image.file(
            File(imagePath),
            fit: BoxFit.contain,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _showAlertDialog(context),
      //   child: Icon(Icons.delete),
      // ),
    );
  }

  // void _showAlertDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Delete Photo'),
  //         content: Text('Are you sure you want to delete this photo?'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('No'),
  //           ),
  //           TextButton(
  //             onPressed: () async {
  //               // Delete the photo file
  //               await File(imagePath).delete();

  //               // Pop the AlertDialog
  //               Navigator.pop(context);

  //               // Pop the ScreenDetails page
  //               Navigator.pop(context);
  //             },
  //             child: Text('Yes'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
