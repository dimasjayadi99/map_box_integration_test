import 'package:flutter/material.dart';
import '../../../../core/common/constants/app_path.dart';
import '../../../../core/common/constants/app_string.dart';

class LogoTaglineWidget extends StatelessWidget {
  const LogoTaglineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppPath.logoPath,
              width: 32,
              height: 32,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              AppString.appName,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          AppString.tagline,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
