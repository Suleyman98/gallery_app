
import 'package:flutter/material.dart';


class GO {
  static final key = GlobalKey<NavigatorState>();
  static BuildContext context = key.currentContext!;
  static args(BuildContext context) => ModalRoute.of(context)?.settings.arguments;

  static to(String routeName, {dynamic arguments}) {
    return key.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static toRemove(String routeName, {dynamic arguments}) {
    return key.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static back() {
    return key.currentState?.pop();
  }
}
