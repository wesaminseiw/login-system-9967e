import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_system/presentation/styles/colors.dart';
import 'package:login_system/presentation/widgets/circular_progress_indicator.dart';
import 'package:login_system/presentation/widgets/or_seperator.dart';
import 'package:login_system/presentation/widgets/sizedboxes.dart';
import '../../logic/blocs/login_bloc/login_bloc.dart';
import '../widgets/snackbar.dart';
import '../widgets/submit_button.dart';
import '../widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: thirdColor,
        body: BlocListener<LoginUserBloc, LoginUserState>(
          listener: (context, state) {
            if (state is LoginUserWithEmailAndPasswordLoadingState) {
            } else if (state
                is LoginUserWithEmailAndPasswordSuccessVerifiedState) {
              successSnackBar(
                context,
                content: state.content,
              );
              Navigator.pushReplacementNamed(
                context,
                '/home',
              );
            } else if (state
                is LoginUserWithEmailAndPasswordSuccessUnverifiedState) {
              infoSnackBar(
                context,
                content: state.content,
              );
              Navigator.pushReplacementNamed(
                context,
                '/verify',
              );
            } else if (state is LoginUserWithEmailAndPasswordFailureState) {
              failureSnackBar(
                context,
                content: state.content,
              );
            } else if (state
                is LoginUserWithEmailAndPasswordFailureInvalidEmailState) {
              failureSnackBar(
                context,
                content: state.content,
              );
            } else if (state
                is LoginUserWithEmailAndPasswordFailureWrongCredentialsState) {
              failureSnackBar(
                context,
                content: state.content,
              );
            } else if (state
                is LoginUserWithEmailAndPasswordFailureEmptyFields) {
              failureSnackBar(
                context,
                content: state.content,
              );
            } else if (state is LoginUserWithGoogleSuccessState) {
              successSnackBar(
                context,
                content: state.content,
              );
              Navigator.of(context).pushReplacementNamed('/home');
            } else if (state is LoginUserWithGoogleFailureState) {
              failureSnackBar(
                context,
                content: state.content,
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                height(MediaQuery.of(context).padding.top),
                Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                                  0.1810344827586207 /
                                  2 -
                              MediaQuery.of(context).padding.top * 0.5,
                        ),
                        child: SizedBox(
                          height: 56,
                          child: Row(
                            children: [
                              width(16),
                              Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                  color: fourthColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        height(
                          MediaQuery.of(context).size.height *
                                  (1 - 0.8189655172413793) +
                              MediaQuery.of(context).padding.top,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height *
                                  (0.8004926108374384) -
                              (MediaQuery.of(context).padding.top * 2),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        height(
                          MediaQuery.of(context).size.height *
                                  (1 - 0.8004926108374384) +
                              MediaQuery.of(context).padding.top,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height *
                                  (0.8004926108374384) -
                              (MediaQuery.of(context).padding.top * 2),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              height(64),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      bottom: 8,
                                    ),
                                    child: Text(
                                      'Your Email',
                                      style: TextStyle(
                                        color: thirdColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              textField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Image.asset(
                                  'assets/images/email.png',
                                  scale: 4,
                                ),
                              ),
                              height(32),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      bottom: 8,
                                    ),
                                    child: Text(
                                      'Your Password',
                                      style: TextStyle(
                                        color: thirdColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              textField(
                                controller: _passwordController,
                                isObscure: true,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: Image.asset(
                                  'assets/images/password.png',
                                  scale: 4,
                                ),
                              ),
                              height(48),
                              BlocBuilder<LoginUserBloc, LoginUserState>(
                                builder: (context, state) {
                                  return state
                                          is LoginUserWithEmailAndPasswordLoadingState
                                      ? submitButtonCircularProgressIndicator(
                                          width:
                                              MediaQuery.of(context).size.width,
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          child: submitButton(
                                            context,
                                            label: 'Login',
                                            onTap: () {
                                              context.read<LoginUserBloc>().add(
                                                    LoggedInUserWithEmailAndPasswordEvent(
                                                      email:
                                                          _emailController.text,
                                                      password:
                                                          _passwordController
                                                              .text,
                                                      context: context,
                                                    ),
                                                  );
                                            },
                                          ),
                                        );
                                },
                              ),
                              height(32),
                              orSeperator(),
                              height(32),
                              Column(
                                children: [
                                  BlocBuilder<LoginUserBloc, LoginUserState>(
                                    builder: (context, state) {
                                      return state
                                              is LoginUserWithGoogleLoadingState
                                          ? submitButtonCircularProgressIndicator(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16,
                                              ),
                                              child: googleSubmitButton(
                                                context,
                                                onTap: () {
                                                  context
                                                      .read<LoginUserBloc>()
                                                      .add(
                                                        LoggedInUserWithGoogleEvent(),
                                                      );
                                                },
                                                isLogin: true,
                                              ),
                                            );
                                    },
                                  ),
                                  height(32),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Don\'t have an account? ',
                                        style: TextStyle(
                                          color: thirdColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            '/register',
                                          );
                                        },
                                        child: Text(
                                          'Register now.',
                                          style: TextStyle(
                                            color: thirdColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
