import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/food_model.dart';
import 'package:food_delivery_app/screens/details/detils_screen.dart';
import 'package:food_delivery_app/screens/order/cancel_order.dart';
import 'package:food_delivery_app/screens/order/order_screen.dart';
import 'package:food_delivery_app/widget/bottom_navbar.dart';
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
        path: '/navbar',
        name: 'navbr',
        builder: (context, state) => const CustomBottomNavBar(),
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
      GoRoute(
        path: '/order',
        name: 'order',
        builder: (context, state) => const MyOrdersScreen(),
      ),
      GoRoute(
        path: '/order_cancel',
        name: 'order_cancel',
        builder: (context, state) => const CancelOrderScreen(),
      ),
      GoRoute(
  path: '/detail',
  name: 'detail',
  builder: (context, state) {
    final foodItem = state.extra as FoodModel; // 👈 cast back to FoodModel
    return DetailScreen(foodItem: foodItem);
  },
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
