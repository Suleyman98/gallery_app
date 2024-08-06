import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_app_task/presentation/pages/edit/mixins/image_edit_mixin.dart';

class ImageEditPage extends StatefulWidget {
  final String path;
  const ImageEditPage({super.key, required this.path});

  @override
  State<ImageEditPage> createState() => _ImageEditPageState();
}

class _ImageEditPageState extends State<ImageEditPage> with ImageEditMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Image'), actions: [
        IconButton(
          onPressed: () async {
            cropImage(context);
          },
          icon: const Icon(Icons.crop_rotate),
          color: Colors.black,
        ),
      ]),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Hero(
              tag: widget.path,
              child: Material(
                child: Image.file(
                  File(widget.path),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
