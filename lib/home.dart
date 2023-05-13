import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'auth.dart';

/// ultimate mymoim App
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("appName".i18n())),
      body: const Center(
        child: PhoneAuthScreen(),
      ),
    );
  }
}
