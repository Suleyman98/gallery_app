import 'package:flutter/material.dart';
import 'package:gallery_app_task/app/injector/locator.dart';
import 'package:gallery_app_task/data/service/local/local_service.dart';
import 'package:gallery_app_task/presentation/pages/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await locator<LocalService>().initStorage();
  runApp(const MyApp());
}
