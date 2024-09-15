import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'user_actions_state.dart';

class UserActionsCubit extends Cubit<UserActionsState> {
  UserActionsCubit() : super(UserActionsInitialState());

  // Sign out the user
  Future<void> signOut(BuildContext context) async {
    emit(UserActionsSignOutInitialState());
    try {
      await FirebaseAuth.instance.signOut();
      emit(UserActionsSignOutSuccessState());
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      emit(UserActionsSignOutFailureState(e.toString()));
    }
  }

  // Delete the user account
  Future<void> deleteUser(BuildContext context) async {
    emit(UserActionsDeleteUserInitialState());
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      emit(UserActionsDeleteUserSuccessState());
      Navigator.pushReplacementNamed(context, '/register');
    } catch (e) {
      emit(UserActionsDeleteUserFailureState(e.toString()));
    }
  }

  // Check email verification status
  Future<void> checkEmailVerification(BuildContext context) async {
    try {
      await FirebaseAuth.instance.currentUser!.reload();
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.pushReplacementNamed(context, '/login');
        } else if (!user.emailVerified) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Not verified yet!')),
          );
        } else {
          Navigator.pushReplacementNamed(context, '/home');
        }
      });
    } catch (e) {
      // You can add error handling here if needed
    }
  }
}
