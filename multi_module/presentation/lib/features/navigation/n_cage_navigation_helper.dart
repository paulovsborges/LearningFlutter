import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NCageNavigationHelper on BuildContext{

  void myRouterPop(){
    GoRouter.of(this).pop();
  }

  void myRouterNavigate(String route){
    GoRouter.of(this).push(route);
  }

  void myRouterReplace(String route){
    GoRouter.of(this).go(route);
  }
}
