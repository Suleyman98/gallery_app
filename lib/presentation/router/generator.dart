import 'package:flutter/cupertino.dart';
import 'package:gallery_app_task/presentation/pages/edit/ui/img_edit.dart';
import 'package:gallery_app_task/presentation/pages/home/ui/home.dart';
import 'package:gallery_app_task/presentation/router/routes.dart';
export 'go.dart';
export 'routes.dart';

class RouteGenerator {
  RouteGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, CupertinoPageRoute Function(dynamic)> routes = {
      Routes.home: (_) => route(const HomeScreen()),
      Routes.cropper: (_) =>
          route(ImageEditPage(path: settings.arguments as String))
    };

    final CupertinoPageRoute Function(dynamic)? pageBuilder =
        routes[settings.name];
    if (pageBuilder != null) {
      return pageBuilder(settings.arguments);
    } else {
      return CupertinoPageRoute(builder: (context) {
        return const CupertinoPageScaffold(
          child: Center(
            child: Text("404 Not Found"),
          ),
        );
      });
    }
  }

  static CupertinoPageRoute route(Widget widget, {dynamic args}) {
    return CupertinoPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(
        arguments: args,
      ),
    );
  }
}
