import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app_task/app/injector/locator.dart';
import 'package:gallery_app_task/data/exceptions/custom_exception.dart';
import 'package:gallery_app_task/data/service/local/local_service.dart';
import 'package:gallery_app_task/presentation/pages/home/cubit/gallery_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class GalleryCubitBloc extends Cubit<GalleryState> {
  GalleryCubitBloc(Initial initialState) : super(initialState);

  List<File> selectedImages = [];
  List<String> paths = [];
  ImagePicker picker = locator<ImagePicker>();
  LocalService localService = locator<LocalService>();

  Future<void> requestPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<void> getImages() async {
    await requestPermissions();
    final pickedFiles = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    emit(Loading());

    if (pickedFiles.isNotEmpty) {
      for (var pickedFile in pickedFiles) {
        File file = File(pickedFile.path);
        final directory = await getApplicationDocumentsDirectory();
        final fileName = file.path.split('/').last;
        final newPath = '${directory.path}/$fileName';
        await file.copy(newPath);
        selectedImages.add(File(newPath));
        paths.add(newPath);
      }

      localService.write('images', jsonEncode(paths));
      emit(Success(files: selectedImages));
    } else {
      emit(Failure(CustomGalleryException(message: 'Cannot find')));
    }
  }

  fetchImages() async {
    emit(Loading());
    final pathsString = localService.read('images');
    if (pathsString != null) {
      List<String> loadedPaths =
          (jsonDecode(pathsString) as List).map((e) => e.toString()).toList();
      List<File> loadedFiles = [];
      for (String path in loadedPaths) {
        File file = File(path);
        if (await file.exists()) {
          loadedFiles.add(file);
          selectedImages.add(file);
          paths.add(file.path);
        } else {
          emit(Failure(
              CustomGalleryException(message: 'File not found: $path')));
          return;
        }
      }

      emit(Success(files: loadedFiles));
    } else {
      emit(Failure(CustomGalleryException(message: 'No saved images')));
    }
  }
}
