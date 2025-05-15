import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../widgets/glassmorphic_card.dart';
import '../widgets/app_text_styles.dart';
import '../widgets/app_background.dart';
import '../widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login(AuthProvider authProvider) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthProvider>().login(
            _emailController.text,
            _passwordController.text,
          );
    }
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Login', style: AppTextStyles.appBarTitle),
      ),
      body: AppBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0), 
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const SizedBox(height: 80), 
              const Icon( 
                Icons.remove_red_eye_outlined,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 20), 
              Text(
                'Glance',
                style: AppTextStyles.heading,
              ),
              const SizedBox(height: 60), 
              GlassmorphicCard(
                width: size.width,
                height: size.height * 0.45,
                child: Padding(
                  padding: const EdgeInsets.all(20.0), 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white), 
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.white70), 
                          prefixIcon: const Icon(Icons.email_outlined, color: Colors.white70), 
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white.withAlpha(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.white), 
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.redAccent), 
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.redAccent), 
                          ),
                          errorStyle: const TextStyle(color: Colors.redAccent), 
                          filled: true,
                          fillColor: Colors.white.withAlpha(10),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                             return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20), 
                      TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(color: Colors.white), 
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white70), 
                          prefixIcon: const Icon(Icons.lock_outline, color: Colors.white70), 
                           enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white.withAlpha(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.white), 
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.redAccent), 
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.redAccent), 
                          ),
                          errorStyle: const TextStyle(color: Colors.redAccent), 
                          filled: true,
                          fillColor: Colors.white.withAlpha(10),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      Consumer<AuthProvider>(
                        builder: (context, authProvider, child) {
                          return Column(
                            children: [
                              if (authProvider.error != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 16), 
                                  child: Text(
                                    authProvider.error!,
                                    style: const TextStyle(color: Colors.redAccent), 
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              const SizedBox(height: 30), 
                              AppButton(
                                text: 'LOGIN',
                                isLoading: authProvider.isLoading,
                                onPressed: () => _login(authProvider), 
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), 
            ],
          ),
        ),
      ),
      )
      )
      );
      }
}
