import 'package:flutter/material.dart';
import 'package:nano_health_suite/config/theme/app_theme.dart';
import 'package:nano_health_suite/presentation/pages/auth_page/login_page/login_page.dart';
import 'package:nano_health_suite/presentation/provider/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: MaterialApp(
        theme: AppTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}
