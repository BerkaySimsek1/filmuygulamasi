import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_next_page.dart';
import 'package:movie_app/firebase_methods/auth_methods.dart';
import 'package:movie_app/screens/bottom_nav_bar.dart';
import 'package:movie_app/screens/logInOutScreens/login_screen.dart';
import 'package:movie_app/screens/mainpage/main_page.dart';
import 'package:movie_app/screens/onboardingScreen.dart';
import 'package:movie_app/screens/profilepage/commentScreen.dart';
import 'package:movie_app/screens/splashScreen.dart';
import 'package:movie_app/screens/watclistAndWatchedPages/wacthlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => pageControllerCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Sinefy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color.fromARGB(255, 16, 17, 47),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffc21858),
              side: const BorderSide(color: Colors.black),
              textStyle: const TextStyle(fontWeight: FontWeight.w700),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.blue,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                elevation: 0),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent, elevation: 0)),
        routes: {
          '/profile': (context) => const MainPage(),
          '/comments': (context) => const ProfileCommentPage(),
          '/settings': (context) => const WatchList(),
          '/login': (context) => const LoginScreen(),
        },
        home: const SplashScreenWrapper(),
      ),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  late Future<bool> _initFuture;

  @override
  void initState() {
    super.initState();
    _initFuture = _initializeApp();
  }

  Future<bool> _initializeApp() async {
    // Minimum 2 saniye splash screen'i göster
    await Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      _checkFirstTime(),
    ]);

    return _checkFirstTime();
  }

  Future<bool> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        final bool isFirstTime = snapshot.data ?? true;

        if (isFirstTime) {
          return OnboardingScreen();
        }

        return StreamBuilder(
          stream: Auth().authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const BottomNavBar();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return const LoginScreen();
          },
        );
      },
    );
  }
}
