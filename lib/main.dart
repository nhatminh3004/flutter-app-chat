// import thu vien
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/ui/onboarding/onboarding_page_view.dart';
import 'package:myflutter/ui/splash/splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:responsive_builder/responsive_builder.dart';

//runapp de khoi dong app
void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: OnboardingPageView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
