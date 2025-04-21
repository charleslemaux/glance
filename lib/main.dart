import 'dart:async';

import 'package:shadcn_flutter/shadcn_flutter.dart' hide Consumer;
import 'package:provider/provider.dart';

// Import screens
import 'package:glance/screens/splash_screen.dart';
import 'package:glance/screens/home_screen.dart';
import 'package:glance/screens/login_screen.dart';

// Import services
import 'package:glance/services/auth_service.dart';

// Import utils
import 'package:glance/utils/appwrite_config.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:glance/screens/no_connection_screen.dart';

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
    return ShadcnApp(
      title: 'Glance',
      theme: ThemeData(
        colorScheme: ColorSchemes.darkViolet(),
        radius: 0.5,
        ),
      home: ConnectivityWrapper(),
    );
  }
}

class ConnectivityWrapper extends StatefulWidget {
  const ConnectivityWrapper({super.key});

  @override
  State<ConnectivityWrapper> createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  bool _hasConnection = true;
  bool _checking = false;
  late final InternetConnection internetChecker;
  late final Stream<InternetStatus> _connectionStream;
  late final StreamSubscription<InternetStatus> _subscription;

  @override
  void initState() {
    super.initState();
    internetChecker = InternetConnection.createInstance();
    _connectionStream = internetChecker.onStatusChange;
    _subscription = _connectionStream.listen((status) {
      setState(() {
        _hasConnection = status == InternetStatus.connected;
      });
    });
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    setState(() { _checking = true; });
    final connected = await internetChecker.hasInternetAccess;
    setState(() {
      _hasConnection = connected;
      _checking = false;
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasConnection) {
      return NoConnectionScreen(onRetry: _checkConnection, isLoading: _checking);
    }
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        if (authProvider.isLoading) {
          return const SplashScreen();
        }
        return authProvider.isAuthenticated ? const HomeScreen() : const LoginScreen();
      },
    );
  }
}


