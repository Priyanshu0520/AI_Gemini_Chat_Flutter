import 'dart:io';
import 'package:flutter/material.dart';

class BuildDisplayImage extends StatelessWidget {
  const BuildDisplayImage({
    super.key,
    required this.file,
    required this.userImage,
    required this.onPressed,
  });

  final File? file;
  final String userImage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Container(
  decoration: BoxDecoration(
    shape: BoxShape.circle,  // Ensures the shadow follows the circular shape
    boxShadow: [
      BoxShadow(
        color: Colors.black38, // Shadow color
        spreadRadius: 5, // How much the shadow spreads
        blurRadius: 7,   // Softness of the shadow
        offset:const  Offset(0, 3), // Changes the position of the shadow (x, y)
      ),
    ],
  ),
  child: CircleAvatar(
    radius: 60.0,
    backgroundColor: Colors.grey[200],
    backgroundImage: getImageToShow(),
  ),
)
,
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: InkWell(
            onTap: onPressed,
            child: const CircleAvatar(
              backgroundColor: Colors.black,
              radius: 20.0,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  getImageToShow() {
    if (file != null) {
      return FileImage(File(file!.path)) as ImageProvider<Object>;
    } else if (userImage.isNotEmpty) {
      return FileImage(File(userImage)) as ImageProvider<Object>;
    } else {
      return const AssetImage('assets/images/profile_pic.jpeg');
    }
  }
}
