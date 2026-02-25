part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//State to indicate that the user has selected a role and the role is stored in the state
 class RoleSelected extends AuthState{
  //initialize the role variable to be used in the state
  //from enum folder in utils file
  final UserRole role;
  RoleSelected({required this.role});
 }
