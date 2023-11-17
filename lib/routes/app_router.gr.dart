// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddRoute.name: (routeData) {
      final args =
          routeData.argsAs<AddRouteArgs>(orElse: () => const AddRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddPage(key: args.key),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
  };
}

/// generated route for
/// [AddPage]
class AddRoute extends PageRouteInfo<AddRouteArgs> {
  AddRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddRoute.name,
          args: AddRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddRoute';

  static const PageInfo<AddRouteArgs> page = PageInfo<AddRouteArgs>(name);
}

class AddRouteArgs {
  const AddRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
