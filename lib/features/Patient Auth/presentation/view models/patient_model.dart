class PatientModel {
  final String? id;
  final String fullName;
  final String phoneNumber;
  final String gender;
  final String birthDate;
  final double height;
  final double weight;
  final String bloodType;
  final Map<String, bool>
  healthConditions; // لتمثيل الـ 3 اختيارات اللي عملناهم
  // الإضافات الجديدة:
  final String? nationalId;
  final String? motherName;
  final String? emergencyContactInfo;

  PatientModel({
    this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.gender,
    required this.birthDate,
    required this.height,
    required this.weight,
    required this.bloodType,
    required this.healthConditions,
    this.nationalId,
    this.motherName,
    this.emergencyContactInfo,
  });

  // تحويل من Map لـ Object (للقراءة من سوبا بيز)
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      fullName: json['full_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      gender: json['gender'] ?? '',
      birthDate: json['birth_date'] ?? '',
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      bloodType: json['blood_type'] ?? '',
      healthConditions: Map<String, bool>.from(json['health_conditions'] ?? {}),
      nationalId: json['national_id'],
      motherName: json['mother_name'],
      emergencyContactInfo: json['emergency_contact_info'],
    );
  }

  // تحويل لـ Map (للكتابة في سوبا بيز)
  Map<String, dynamic> toJson() {
    // بنقسم الاسم لجزئين لو فيه مسافة، لو مفيش بنكرر الاسم في الخانتين عشان نتخطى القيد
    List<String> nameParts = fullName.trim().split(' ');
    String firstName = nameParts.first;
    String lastName =
        nameParts.length > 1 ? nameParts.sublist(1).join(' ') : firstName;
    return {
      if (id != null) 'id': id,
      'first_name': firstName, // بياخد الاسم الأول
      'last_name': lastName, // بياخد باقي الاسم (عشان يحل مشكلة الـ Not-Null)
      'birth_date': birthDate,
      'blood_type': bloodType,
      'height': height,
      'weight': weight,
      'has_diabetes': healthConditions['Diabetes'] ?? false,
      'has_hypertension': healthConditions['Hypertension'] ?? false,
      'is_smoker': healthConditions['Smoker'] ?? false,
      // الأعمدة الجديدة اللي لسه ضايفها حالا بالـ SQL
      'phone_number': phoneNumber,
      'gender': gender,
      'national_id': nationalId,
      'mother_name': motherName,
      'emergency_contact_info': emergencyContactInfo,
    };
  }
}
