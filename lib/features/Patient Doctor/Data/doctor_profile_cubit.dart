import 'package:flutter_bloc/flutter_bloc.dart';
import 'doctor_profile_state.dart';

class DoctorProfileCubit extends Cubit<DoctorProfileState> {
  // You can pass the initial status when navigating to the screen
  bool isFollowed;

  DoctorProfileCubit({this.isFollowed = false}) : super(DoctorProfileInitial()) {
    // Emit the initial state once the cubit is created
    emit(DoctorFollowStatusChanged(isFollowed));
  }

  // Function to request a follow up
  void followDoctor() {
    isFollowed = true;
    emit(DoctorFollowStatusChanged(isFollowed));
  }

  // Function to cancel the follow up
  void unfollowDoctor() {
    isFollowed = false;
    emit(DoctorFollowStatusChanged(isFollowed));
  }
}