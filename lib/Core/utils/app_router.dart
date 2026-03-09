import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/widgets/patient_main_screen.dart';
import 'package:medi_cloud_app/features/Doctor%20Auth/presentation/view%20models/views/doctor_login_view.dart';
import 'package:medi_cloud_app/features/Hospital%20Auth/presentation/view%20models/views/hospital_login_view.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/patient_SignUp_view.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/patient_login_view.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/success_registration_view.dart';
import 'package:medi_cloud_app/features/Patient%20Dashboard/Presentation/view/patient_dashboard_view.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Data/doctor_profile_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Presentation/view/doctor_details_view.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Presentation/view/explore_doctors_view.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Presentation/view/success_view.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/patient_home_view.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Data/hospital_details_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/explore_hospital_view.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/hospital_details_view.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/my_hospital_dashboard_view.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/request_report_view.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/success_hospital_join_view.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/test_result_pdf_view.dart';
import 'package:medi_cloud_app/features/Patient%20Live%20Vitals/Presentation/view/live_vitals_view.dart';
import 'package:medi_cloud_app/features/Role%20Selection/presentation/views/role_selection_view.dart';
import 'package:medi_cloud_app/features/SplashScreen/presentation/views/SplashView.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kRoleSelectionView = '/roleSelection';
  static const kPatientHomeView = '/patientHomeView';
  static const kPatientDashboardView = '/patientDashboardView';
  static const kDoctorAuthView = '/doctorAuthView';
  static const kHospitalAuthView = '/hospitalAuthView';
  static const kPatientLoginView = '/patientLoginView';
  static const kPatientSignUpView = '/patientSignUpView';
  static const kSuccessRegistrationView = '/successRegistrationView';
  static const kExploreDoctorsView = '/exploreDoctorsView';
  static const kDoctorDetailsView = '/doctorDetailsView';
  static const kSuccessDocComfView = '/successDocComfView';
  static const kPatientMainScreen = '/patientMainScreen';
  static const kSuccessHospitalJoinView = '/successHospitalJoinView';
  static const kExploreHospitalView = '/exploreHospitalView';
  static const kHospitalDetailsView = '/hospitalDetailsView';
  static const kMyHospitalDashboardView = '/myHospitalDashboardView';
  static const kRequestReportView = '/requestReportView';
  static const kTestResultPdfView = '/testResultPdfView';
  static const kLiveVitalsView = '/liveVitalsView';

  // التعديل هنا: خليناها router بحرف سمول
  static final router = GoRouter(
    routes: [
       GoRoute(
        path: kLiveVitalsView,
        builder: (context, state) => const LiveVitalsView(),
      ),
      GoRoute(
        path: kPatientMainScreen,
        builder: (context, state) => const PatientMainScreen(),
      ),
      GoRoute(
        path: kSuccessHospitalJoinView,
        builder: (context, state) => const SuccessHospitalJoinView(),
      ),
      GoRoute(
        path: kTestResultPdfView,
        builder: (context, state) {
          // هنا بنستقبل مسار الـ PDF اللي مبعوت من الشاشة اللي قبلها
          final pdfPath = state.extra as String;

          // بنغلف الشاشة بالكيوبت عشان الـ Bottom Bar يقدر يكلمه ويطبع
          return BlocProvider(
            create: (context) => HospitalDetailsCubit(),
            child: TestResultPdfView(pdfAssetPath: pdfPath),
          );
        },
      ),
      GoRoute(
        path: kRequestReportView,
        builder: (context, state) => const RequestReportView(),
      ),
      GoRoute(
        path: kMyHospitalDashboardView,
        builder: (context, state) => const MyHospitalDashboardView(),
      ),
      GoRoute(
        path: kHospitalDetailsView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => HospitalDetailsCubit(),
            child: const HospitalDetailsView(),
          );
        },
      ),
      GoRoute(
        path: kExploreHospitalView,
        builder: (context, state) => const ExploreHospitalView(),
      ),
      GoRoute(
        path: kSplashView,
        // التعديل هنا: SplashView بحرف V كابيتال
        builder: (context, state) => const Splashview(),
      ),
      GoRoute(
        path: kRoleSelectionView,
        builder: (context, state) => const RoleSelectionView(),
      ),
      GoRoute(
        path: kPatientLoginView,
        builder: (context, state) => const PatientLoginView(),
      ),
      GoRoute(
        path: kPatientSignUpView,
        // التعديل هنا: PatientSignUpView بحرف U كابيتال
        builder: (context, state) => const PatientSignupView(),
      ),
      GoRoute(
        path: kPatientHomeView,
        // ضفنا const هنا
        builder: (context, state) => const PatientHomeView(),
      ),
      GoRoute(
        path: kPatientDashboardView,
        builder: (context, state) => const PatientDashboardView(),
      ),
      GoRoute(
        path: kDoctorAuthView,
        builder: (context, state) => const DoctorLoginView(),
      ),
      GoRoute(
        path: kHospitalAuthView,
        builder: (context, state) => const HospitalLoginView(),
      ),
      GoRoute(
        path: kSuccessRegistrationView,
        builder: (context, state) => const SuccessRegistrationView(),
      ),
      GoRoute(
        path: kExploreDoctorsView,
        builder: (context, state) => const ExploreDoctorsView(),
      ),
      GoRoute(
        path: kDoctorDetailsView,
        builder: (context, state) {
          final bool isMyDoctor = state.extra as bool? ?? false;
          return BlocProvider(
            create: (context) => DoctorProfileCubit(isFollowed: isMyDoctor),
            child: const DoctorDetailsView(),
          );
        },
      ),
      GoRoute(
        path: kSuccessDocComfView,
        builder: (context, state) => const SuccessDocComfView(),
      ),
    ],
  );
}
