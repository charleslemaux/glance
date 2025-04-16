import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import screens
import 'package:glance/screens/splash_screen.dart';
import 'package:glance/screens/home_screen.dart';
import 'package:glance/screens/login_screen.dart';

// Import services
import 'package:glance/services/auth_service.dart';

// Import utils
import 'package:glance/utils/appwrite_config.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider(account: account)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glance',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          if (authProvider.isLoading) {
            return const SplashScreen();
          }
          return authProvider.isAuthenticated ? const HomeScreen() : const LoginScreen();
        },
      ),
    );
  }
}


