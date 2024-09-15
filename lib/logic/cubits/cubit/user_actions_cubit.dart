import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_actions_state.dart';

class UserActionsCubit extends Cubit<UserActionsState> {
  UserActionsCubit() : super(UserActionsInitial());
}
