import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginUserBloc extends Bloc<LoginUserEvent, LoginUserState> {
  LoginUserBloc()
      : super(LoginUserWithEmailAndPasswordInitialState(
          isLoading: false,
          content: '',
        )) {
    on<LoggedInUserWithEmailAndPasswordEvent>((event, emit) async {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        emit(LoginUserWithEmailAndPasswordLoadingState(
          isLoading: true,
          content: '',
        ));
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            log('========= NAVIGATING TO HOME =========');
            emit(LoginUserWithEmailAndPasswordSuccessVerifiedState(
              isLoading: false,
              content: 'Logged in successfully!',
            ));
          } else {
            log('========= NAVIGATING TO VERIFY =========');
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();
            emit(LoginUserWithEmailAndPasswordSuccessUnverifiedState(
              isLoading: false,
              content:
                  'Logged in successfully but you need to verify your email to continue!',
            ));
          }
          log('========= SUCCESS =========');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            emit(
              LoginUserWithEmailAndPasswordFailureInvalidEmailState(
                content: 'Invalid email format!',
                isLoading: false,
              ),
            );
            log('========= INVALID EMAIL =========');
          } else if (e.code == 'wrong-credentials' ||
              e.code == 'user-not-found' ||
              e.code == 'wrong-password') {
            emit(
              LoginUserWithEmailAndPasswordFailureWrongCredentialsState(
                content: 'Wrong credentials!',
                isLoading: false,
              ),
            );
            log('========= WRONG CREDENTIALS =========');
          }
        }
      } else {
        emit(
          LoginUserWithEmailAndPasswordFailureEmptyFields(
            content: 'Email or password cannot be empty!',
            isLoading: false,
          ),
        );
        log('========= EMPTY FIELDS =========');
      }
    });
    on<LoggedInUserWithGoogleEvent>((event, emit) async {
      emit(LoginUserWithGoogleLoadingState(isLoading: true, content: ''));
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        emit(LoginUserWithGoogleSuccessState(
          isLoading: false,
          content: 'Logged in successfully!',
        ));
      } catch (e) {
        emit(LoginUserWithGoogleFailureState(
          isLoading: false,
          content: e.toString(),
        ));
      }
    });
    //   on<LoggedInUserWithPhoneNumberEvent>((event, emit) async {
    //     final _auth = FirebaseAuth.instance;
    //     emit(LoginUserWithPhoneNumberLoadingState(isLoading: true));

    //     if (event.phoneNumber.text.isNotEmpty) {
    //       try {
    //         await _auth.verifyPhoneNumber(
    //           phoneNumber: event.phoneNumber.text,
    //           verificationCompleted: (PhoneAuthCredential credential) async {
    //             try {
    //               await _auth.signInWithCredential(credential);
    //               emit(LoginUserWithPhoneNumberSuccessState(isLoading: false));
    //             } catch (e) {
    //               emit(LoginUserWithPhoneNumberFailureState(isLoading: false));
    //             }
    //           },
    //           verificationFailed: (FirebaseAuthException e) async {
    //             // emit(LoginUserWithPhoneNumberFailureState(isLoading: false));
    //           },
    //           codeSent: (String verificationId, int? resendToken) async {
    //             emit(LoginUserWithPhoneNumberCodeSentState(
    //               verificationId: verificationId,
    //               isLoading: false,
    //             ));
    //           },
    //           codeAutoRetrievalTimeout: (String verificationId) async {
    //             // Optionally handle timeout here
    //           },
    //         );
    //       } catch (e) {
    //         emit(LoginUserWithPhoneNumberFailureState(isLoading: false));
    //       }
    //     } else {
    //       emit(LoginUserWithPhoneNumberFailureEmptyFieldsState(isLoading: false));
    //     }
    //   });
    //   on<VerifyPhoneNumberEvent>((event, emit) async {
    //     emit(LoginUserWithPhoneNumberLoadingState(isLoading: true));
    //     if (event.smsCode.isNotEmpty) {
    //       try {
    //         final PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //           verificationId: event.verificationId,
    //           smsCode: event.smsCode,
    //         );
    //         await FirebaseAuth.instance.signInWithCredential(credential);
    //         emit(LoginUserWithPhoneNumberSuccessState(isLoading: false));
    //       } catch (e) {
    //         emit(LoginUserWithPhoneNumberFailureState(isLoading: false));
    //       }
    //     } else {
    //       emit(LoginUserWithPhoneNumberFailureEmptyFieldsState(isLoading: false));
    //     }
    //   });
  }
}
