import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';


import 'core/constants/app_colors.dart';
import 'core/router/app_router.dart';
import 'providers/auth_provider.dart';
import 'providers/onboarding_provider.dart';
import 'providers/food_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => FoodProvider()),
      ],
      child: MaterialApp.router(
        title: 'Food Delivery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: AppColors.primary,
          textTheme: GoogleFonts.poppinsTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerConfig: AppRouter.router,
      // home: SplashScreen(),
      ),
    );
  }
}
