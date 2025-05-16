import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../widgets/app_background.dart';
import '../widgets/glassmorphic_card.dart';
import '../widgets/app_text_styles.dart';
import '../widgets/app_button.dart';
import 'consent_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Glance', style: AppTextStyles.appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => authProvider.logout(),
          ),
        ],
      ),
      body: AppBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Icon(
                  Icons.remove_red_eye_outlined,
                  size: 80,
                  color: Color(0xFF8D7B68),
                ),
                const SizedBox(height: 20),
                Text(
                  'Glance',
                  style: AppTextStyles.heading,
                ),
                const SizedBox(height: 40),
                GlassmorphicCard(
                  width: size.width,
                  height: size.height * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to Glance!',
                          style: AppTextStyles.subHeading,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'User Email: ${authProvider.userEmail}',
                          style: AppTextStyles.body,
                        ),
                        const SizedBox(height: 30),
                        AppButton(
                          text: 'View Consent Screen',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ConsentScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    ));
  }
}