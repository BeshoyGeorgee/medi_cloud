abstract class HospitalDetailsState {}

class HospitalDetailsInitial extends HospitalDetailsState {}

// ستيت في حالة إن اللينك مرداش يفتح عشان نقدر نعرض رسالة لليوزر
class HospitalDetailsMapError extends HospitalDetailsState {
  final String errorMessage;
  HospitalDetailsMapError(this.errorMessage);
}