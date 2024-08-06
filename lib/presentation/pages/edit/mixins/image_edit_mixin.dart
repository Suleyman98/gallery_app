import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:gallery_app_task/app/injector/locator.dart';
import 'package:gallery_app_task/data/service/local/local_service.dart';
import 'package:gallery_app_task/presentation/pages/edit/ui/img_edit.dart';
import 'package:gallery_app_task/presentation/router/go.dart';
import 'package:gallery_app_task/presentation/router/routes.dart';
import 'package:image_cropper/image_cropper.dart';

mixin ImageEditMixin on State<ImageEditPage> {
  cropImage(context) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: widget.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    Gal.putImage(croppedFile!.path);
    addToPaths(croppedFile.path);
    GO.toRemove(Routes.home);
  }

  addToPaths(String path) {
    List<String> imagePaths = [];
    String? encoded = locator<LocalService>().read('images');
    if (encoded != null) {
      imagePaths = (jsonDecode(encoded) as List<dynamic>)
          .map((e) => e.toString())
          .toList();
    }
    imagePaths.add(path);
    locator<LocalService>().remove('images');
    locator<LocalService>().write('images', jsonEncode(imagePaths));
  }
}
