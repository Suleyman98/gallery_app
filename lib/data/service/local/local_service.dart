import 'package:get_storage/get_storage.dart';

final class LocalService {
  final box = GetStorage('gallery');

  initStorage() async {
    await GetStorage.init('gallery');
  }

  write(String key, dynamic value) async {
    await box.write(key, value);
  }

  dynamic read(String key) {
    var value = box.read(key);
    if (value != null) {
      return value;
    }
    return null;
  }

  void remove(String key) async {
    await box.remove(key);
  }

  erease() async {
    await box.erase();
  }
}