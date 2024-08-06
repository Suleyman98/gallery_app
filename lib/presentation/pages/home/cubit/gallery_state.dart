import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:gallery_app_task/data/exceptions/custom_exception.dart';

abstract class GalleryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Initial extends GalleryState {}

class Loading extends GalleryState {}

class Success extends GalleryState {
  final List<File> files;

  Success({required this.files});
}

class Failure extends GalleryState {
  final CustomGalleryException error;

  Failure(this.error);
}
