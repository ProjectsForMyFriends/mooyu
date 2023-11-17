import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mooyu/pages/add_screen.dart';
import 'package:mooyu/pages/main_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: AddRoute.page, path: '/add')
      ];
}
