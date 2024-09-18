import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final ScrollController _scrollController = ScrollController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Function to scroll to the bottom after the keyboard appears
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listening for changes in keyboard appearance
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    // If the bottom inset changes (keyboard appears), scroll to the bottom
    if (bottomInset > 0) {
      _scrollToBottom();
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            controller: _scrollController,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_screen_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  height(MediaQuery.of(context).size.height / 2.1),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                  textField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    hintText: 'Email Address..',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Image.asset(
                      'assets/images/email.png',
                      scale: 11,
                    ),
                  ),
                  height(16),
                  textField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    hintText: 'Password..',
                    isObscure: true,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Image.asset(
                      'assets/images/password.png',
                      scale: 11,
                    ),
                  ),
                  height(16),
                  BlocBuilder<LoginUserBloc, LoginUserState>(
                    builder: (context, state) {
                      return state is LoginUserWithEmailAndPasswordLoadingState
                          ? submitButtonCircularProgressIndicator(
                              width: MediaQuery.of(context).size.width,
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
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          context: context,
                                        ),
                                      );
                                },
                              ),
                            );
                    },
                  ),
                  height(18),
                  orSeperator(),
                  height(18),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: submitButton(
                          context,
                          width: MediaQuery.of(context).size.width * 0.436,
                          label: 'Sign Up',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/register',
                            );
                          },
                        ),
                      ),
                      BlocBuilder<LoginUserBloc, LoginUserState>(
                        builder: (context, state) {
                          return state is LoginUserWithGoogleLoadingState
                              ? submitButtonCircularProgressIndicator(
                                  width:
                                      MediaQuery.of(context).size.width * 0.436,
                                )
                              : googleSubmitButton(
                                  context,
                                  onTap: () {
                                    context.read<LoginUserBloc>().add(
                                          LoggedInUserWithGoogleEvent(),
                                        );
                                  },
                                );
                        },
                      ),
                    ],
                  ),
                  height(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
