import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'user_actions_state.dart';

class UserActionsCubit extends Cubit<UserActionsState> {
  UserActionsCubit()
      : super(const UserActionsInitialState(
          isLoading: false,
          content: '',
        ));

  // Sign out the user
  Future<void> signOut(BuildContext context) async {
    emit(const UserActionsSignOutLoadingState(
      isLoading: true,
      content: '',
    ));
    try {
      await FirebaseAuth.instance.signOut();
      emit(const UserActionsSignOutSuccessState(
        isLoading: false,
        content: 'Signed out successfully!',
      ));
      // Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      emit(const UserActionsSignOutFailureState(
        isLoading: false,
        content: 'Failed to sign out, try again later.',
      ));
    }
  }

  // Delete the user account
  Future<void> deleteUser(BuildContext context) async {
    emit(const UserActionsDeleteUserLoadingState(
      isLoading: true,
      content: 'Deleted account successfully',
    ));
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      emit(const UserActionsDeleteUserSuccessState(
        isLoading: false,
        content: 'Deleted account successfully!',
      ));
    } catch (e) {
      emit(const UserActionsDeleteUserFailureState(
        isLoading: false,
        content: 'Failed to delete your account, try again later.',
      ));
    }
  }

  // Check email verification status
  Future<void> checkEmailVerification(BuildContext context) async {
    emit(const UserActionsCheckUserVerificationLoadingState(
      isLoading: true,
      content: '',
    ));
    try {
      await FirebaseAuth.instance.currentUser!.reload();
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          emit(const UserActionsCheckUserVerificationUserNotFoundFailureState(
            isLoading: false,
            content: 'User has been deleted deleted, navigating to login.',
          ));
        } else if (!user.emailVerified) {
          emit(const UserActionsCheckUserVerificationNotVerifiedState(
            isLoading: false,
            content: 'Not verified yet, check your inbox again.',
          ));
        } else {
          emit(const UserActionsCheckUserVerificationVerifiedSuccessfullyState(
            isLoading: false,
            content: 'Verified! Enjoy using the app!',
          ));
        }
      });
    } catch (e) {
      emit(const UserActionsCheckUserVerificationFailureState(
        isLoading: false,
        content: 'Failed to verify, try again later.',
      ));
    }
  }
}
