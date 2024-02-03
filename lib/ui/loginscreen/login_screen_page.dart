import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginScreenPage extends StatelessWidget {
  const LoginScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Container(color: Colors.blue),
      tablet: Container(color: Colors.yellow),
      desktop: Container(color: Colors.red),
      watch: Container(color: Colors.purple),
    );
  }
}
