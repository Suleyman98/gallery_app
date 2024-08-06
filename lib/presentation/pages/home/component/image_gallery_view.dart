import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_app_task/presentation/pages/home/component/image_picker_button.dart';
import 'package:gallery_app_task/presentation/pages/home/component/image_rect.dart';

class ImageGalleryView extends StatelessWidget {
  const ImageGalleryView({
    super.key,
    required this.selectedImages,
  });

  final List<File> selectedImages;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemCount: selectedImages.length,
            itemBuilder: (context, index) {
              return ImageRect(path: selectedImages[index].path);
            },
          ),
        ),
        const ImagePickerButton()
      ],
    );
  }
}
