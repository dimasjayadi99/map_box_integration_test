import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:map_box_app/app/core/common/constants/app_path.dart';
import 'package:map_box_app/app/features/introduction/presentations/pages/splash_screen_page.dart';
import 'package:map_box_app/app/features/map_box/presentations/bloc/map_box_bloc.dart';
import 'package:map_box_app/app/features/map_box/presentations/pages/map_box_page.dart';

import '../core/dependency/service_locator.dart';

class MyRouterConfig {
  static final _routeNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _goRouter = GoRouter(
      navigatorKey: _routeNavigatorKey,
      initialLocation: AppPath.splashScreen,
      debugLogDiagnostics: true,
      routerNeglect: true,
      routes: [
        GoRoute(
            path: AppPath.splashScreen,
            name: AppPath.splashScreen,
            builder: (context, state) => const SplashScreenPage()),
        GoRoute(
            path: AppPath.mapBoxPage,
            name: AppPath.mapBoxPage,
            builder: (context, state) => BlocProvider<MapBoxBloc>(
                create: (_) => sl<MapBoxBloc>(), child: const MapBoxPage())),
      ]);

  static GoRouter get router => _goRouter;
  static GlobalKey<NavigatorState> get navigatorState => _routeNavigatorKey;
}
