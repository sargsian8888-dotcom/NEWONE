import 'package:flutter/material.dart';

import 'app_state.dart';
import 'hastiq_scope.dart';
import '../features/onboarding/splash_screen.dart';

class HastiqApp extends StatefulWidget {
  const HastiqApp({super.key});

  @override
  State<HastiqApp> createState() => _HastiqAppState();
}

class _HastiqAppState extends State<HastiqApp> {
  final HastiqState _state = HastiqState();

  @override
  Widget build(BuildContext context) {
    return HastiqScope(
      state: _state,
      child: MaterialApp(
        title: 'Hastiq',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5F3DC4)),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
