import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/user_actions_cubit/user_actions_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
  // TODO: Add tests.
}
