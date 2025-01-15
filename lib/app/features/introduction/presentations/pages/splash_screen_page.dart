import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/constants/app_path.dart';
import '../widgets/logo_tagline_widget.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    directPage();
  }

  Future<void> directPage() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) context.pushReplacementNamed(AppPath.mapBoxPage);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LogoTaglineWidget(),
      ),
    );
  }
}
