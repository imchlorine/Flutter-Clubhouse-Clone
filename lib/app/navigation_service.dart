import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;
  pop() {
     _navigationKey.currentState.pop();
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateReplace(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAndPushNamed(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}
