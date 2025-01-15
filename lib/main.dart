import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/config/router_config.dart';
import 'app/core/common/constants/app_style.dart';
import 'app/core/dependency/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  setupLocator();
  await sl.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: AppStyle.myTextTheme,
          scaffoldBackgroundColor: AppStyle.primaryColor),
      routeInformationParser: MyRouterConfig.router.routeInformationParser,
      routeInformationProvider: MyRouterConfig.router.routeInformationProvider,
      routerDelegate: MyRouterConfig.router.routerDelegate,
    );
  }
}
