abstract class DoctorProfileState {}

class DoctorProfileInitial extends DoctorProfileState {}

// This state holds the current follow status
class DoctorFollowStatusChanged extends DoctorProfileState {
  final bool isFollowed;
  DoctorFollowStatusChanged(this.isFollowed);
}