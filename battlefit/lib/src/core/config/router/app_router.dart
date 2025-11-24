import 'package:battlefit/src/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:battlefit/src/features/auth/presentation/screens/login_screen.dart';
import 'package:battlefit/src/features/auth/presentation/screens/register_screen.dart';
import 'package:battlefit/src/features/auth/presentation/screens/splash_screen.dart';
import 'package/battlefit/src/features/challenges/presentation/screens/challenge_detail_screen.dart';
import 'package:battlefit/src/features/challenges/presentation/screens/challenges_screen.dart';
import 'package:battlefit/src/features/home/presentation/screens/activity_detail_screen.dart';
import 'package:battlefit/src/features/home/presentation/screens/home_screen.dart';
import 'package:battlefit/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:battlefit/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:battlefit/src/features/profile/presentation/screens/settings_screen.dart';
import 'package:battlefit/src/features/ranking/presentation/screens/ranking_screen.dart';
import 'package:battlefit/src/features/store/presentation/screens/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package/supabase_flutter/supabase_flutter.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'activity-detail',
            builder: (context, state) => const ActivityDetailScreen(),
          ),
          GoRoute(
            path: 'challenges',
            builder: (context, state) => const ChallengesScreen(),
            routes: [
              GoRoute(
                path: 'detail',
                builder: (context, state) => const ChallengeDetailScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'ranking',
            builder: (context, state) => const RankingScreen(),
          ),
          GoRoute(
            path: 'profile',
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                path: 'settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'store',
            builder: (context, state) => const StoreScreen(),
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final bool isAuthenticated =
          Supabase.instance.client.auth.currentSession != null;
      final bool isOnAuthRoute = state.matchedLocation.startsWith('/login') ||
          state.matchedLocation.startsWith('/register') ||
          state.matchedLocation.startsWith('/forgot-password');

      if (!isAuthenticated && !isOnAuthRoute && state.matchedLocation != '/splash') {
        return '/login';
      }

      if (isAuthenticated && isOnAuthRoute) {
        return '/home';
      }

      return null;
    },
  );
}
