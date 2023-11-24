import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:property_hub/features/home/home_screen.dart';
import 'package:property_hub/features/property_listing/pages/property_listing_screen.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'property',
          builder: (BuildContext context, GoRouterState state) {
            return const PropertyListingScreen();
          },
        ),
      ],
    ),
  ],
);
