import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/onboarding_provider.dart';
import '../../screens/splash/splash_screen.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/signup_screen.dart';
import '../../screens/home/home_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) =>  LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) =>  SignupScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    redirect: (context, state) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final onboardingProvider = Provider.of<OnboardingProvider>(context, listen: false);
      
      // If user is authenticated, go to home
      if (authProvider.isAuthenticated && state.matchedLocation != '/home') {
        return '/home';
      }
      
      // If onboarding is not completed and not on splash/onboarding, redirect to onboarding
      if (!onboardingProvider.isCompleted && 
          state.matchedLocation != '/splash' && 
          state.matchedLocation != '/onboarding') {
        return '/onboarding';
      }
      
      return null;
    },
  );
}
