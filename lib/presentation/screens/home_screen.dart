import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_system/presentation/widgets/snackbar.dart';
import '../../logic/cubits/user_actions_cubit/user_actions_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserActionsCubit, UserActionsState>(
      listener: (context, state) {
        if (state is UserActionsDeleteUserSuccessState) {
          successSnackBar(context, content: state.content);
          Navigator.of(context).pushReplacementNamed('/login');
        } else if (state is UserActionsDeleteUserFailureState) {
          failureSnackBar(context, content: state.content);
        } else if (state is UserActionsSignOutSuccessState) {
          successSnackBar(context, content: state.content);
          Navigator.of(context).pushReplacementNamed('/login');
        } else if (state is UserActionsSignOutFailureState) {
          failureSnackBar(context, content: state.content);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () async {
                context.read<UserActionsCubit>().deleteUser(context);
              },
              child: const Text('Delete account'),
            ),
            TextButton(
              onPressed: () async {
                context.read<UserActionsCubit>().signOut(context);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
