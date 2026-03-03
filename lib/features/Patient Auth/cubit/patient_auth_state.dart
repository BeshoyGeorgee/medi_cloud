part of 'patient_auth_cubit.dart';

@immutable
sealed class PatientAuthState {}

final class PatientAuthInitial extends PatientAuthState {}

final class PatientAuthLoading extends PatientAuthState {}

final class PatientAuthSuccess extends PatientAuthState {}

final class PatientAuthFailure extends PatientAuthState {
  final String errorMessage;
  PatientAuthFailure(this.errorMessage);
}
