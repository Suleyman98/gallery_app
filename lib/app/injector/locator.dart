import 'package:gallery_app_task/data/service/local/local_service.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton(ImagePicker());
  locator.registerSingleton(LocalService());
}