import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_app_task/presentation/router/go.dart';
import 'package:gallery_app_task/presentation/router/routes.dart';

class ImageRect extends StatelessWidget {
  final String path;
  const ImageRect({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GO.to(Routes.cropper, arguments: path);
      },
      child: Hero(
        tag: path,
        child: Container(
          decoration: BoxDecoration(
                border: Border.all(color: Colors.teal, width: 2),
                borderRadius: BorderRadius.circular(25)),
          height: 200,
          width: 200,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                child: Image.file(
                  File(path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ),
      ),
    );
  }
}
