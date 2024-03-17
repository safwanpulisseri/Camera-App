import 'package:flutter/material.dart';
import 'dart:io';

import 'package:week_6_camera/screens/details.dart';
import 'package:week_6_camera/screens/details.dart'; // Import dart:io to use File

class ScreenImage extends StatelessWidget {
  final List<String> imagePaths;

  ScreenImage({required this.imagePaths, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Gallery '),
        backgroundColor: Colors.red.shade700,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 15),
          child: GridView.builder(
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenDetails(
                        imagePath: imagePaths[index],
                      ),
                    ),
                  );
                },
                child: GridTile(
                  child: Image.file(
                    File(imagePaths[index]),
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
        ),
      ),
    );
  }
}
