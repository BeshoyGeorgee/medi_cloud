import 'package:bloc/bloc.dart';
import 'package:medi_cloud_app/Core/utils/user_roles.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

//Function to select the role and emit the RoleSelected state with the selected role
  void selectRole(UserRole role) {
    emit(RoleSelected(role: role));
  }
}
