import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_system/logic/cubits/user_actions_cubit/user_actions_cubit.dart';
import 'package:login_system/presentation/styles/colors.dart';
import 'package:login_system/presentation/widgets/circular_progress_indicator.dart';
import 'package:login_system/presentation/widgets/sizedboxes.dart';
import 'package:login_system/presentation/widgets/snackbar.dart';
import 'package:login_system/presentation/widgets/submit_button.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserActionsCubit, UserActionsState>(
      listener: (context, state) {
        if (state is UserActionsDeleteUserSuccessState) {
          successSnackBar(
            context,
            content: state.content,
          );
        } else if (state is UserActionsCheckUserVerificationNotVerifiedState) {
          infoSnackBar(
            context,
            content: state.content,
          );
        } else if (state
            is UserActionsCheckUserVerificationVerifiedSuccessfullyState) {
          Navigator.of(context).pushReplacementNamed('/home');
          successSnackBar(
            context,
            content: state.content,
          );
        } else if (state is UserActionsCheckUserVerificationFailureState) {
          failureSnackBar(
            context,
            content: state.content,
          );
        } else if (state
            is UserActionsCheckUserVerificationUserNotFoundFailureState) {
          failureSnackBar(
            context,
            content: state.content,
          );
          Navigator.of(context).pushReplacementNamed('/login');
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage('assets/images/verify_email_screen_bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Foreground content
            Column(
              children: [
                height(MediaQuery.of(context).size.height / 1.9),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 56),
                  child: Text(
                    'We\'ve sent a link to your email inbox, follow it to verify your email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                height(60),
                BlocBuilder<UserActionsCubit, UserActionsState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        state is UserActionsCheckUserVerificationLoadingState
                            ? submitButtonCircularProgressIndicator(
                                width:
                                    MediaQuery.of(context).size.width * 0.436,
                              )
                            : submitButton(
                                context,
                                width:
                                    MediaQuery.of(context).size.width * 0.436,
                                label: 'Check Verification',
                                labelStyle: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                onTap: () {
                                  context
                                      .read<UserActionsCubit>()
                                      .checkEmailVerification(context);
                                },
                              ),
                        width(16),
                        state is UserActionsDeleteUserLoadingState
                            ? submitButtonCircularProgressIndicator(
                                width:
                                    MediaQuery.of(context).size.width * 0.436,
                              )
                            : submitButton(
                                context,
                                width:
                                    MediaQuery.of(context).size.width * 0.436,
                                label: 'Delete Account',
                                labelStyle: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                onTap: () async {
                                  await context
                                      .read<UserActionsCubit>()
                                      .deleteUser(context);
                                },
                              ),
                      ],
                    );
                  },
                ),
                // TextButton(
                //   onPressed: () async {
                //     context.read<UserActionsCubit>().deleteUser(context);
                //   },
                //   child: const Text('Delete account'),
                // ),
                // TextButton(
                //   onPressed: () {
                //     context
                //         .read<UserActionsCubit>()
                //         .checkEmailVerification(context);
                //   },
                //   child: const Text('Check verification'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
