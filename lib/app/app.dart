import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/blocs/login_bloc/login_bloc.dart';
import '../logic/blocs/register_bloc/register_bloc.dart';
import '../logic/cubits/user_actions_cubit/user_actions_cubit.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/verify_email_screen.dart';
import 'router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterUserBloc(),
        ),
        BlocProvider(
          create: (context) => LoginUserBloc(),
        ),
        BlocProvider(
          create: (context) => UserActionsCubit(),
        ),
      ],
      child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            FirebaseAuth.instance.currentUser?.reload();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: FirebaseAuth.instance.currentUser != null
                  ? FirebaseAuth.instance.currentUser!.emailVerified
                      ? const HomeScreen()
                      : const VerifyEmailScreen()
                  : const LoginScreen(),
              onGenerateRoute: _appRouter.onGenerateRoute,
            );
          }),
    );
  }
}
