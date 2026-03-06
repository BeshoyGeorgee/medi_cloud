import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/features/Doctor%20Auth/presentation/view%20models/views/doctor_login_view.dart';
import 'package:medi_cloud_app/features/Hospital%20Auth/presentation/view%20models/views/hospital_login_view.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/patient_SignUp_view.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/patient_login_view.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/success_registration_view.dart';
import 'package:medi_cloud_app/features/Patient%20Dashboard/Presentation/view/patient_dashboard_view.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Presentation/view/doctor_details_view.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Presentation/view/explore_doctors_view.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Presentation/view/success_view.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/patient_home_view.dart';
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
  static final Router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, GoRouterState state) {
          return const Splashview();
        },
      ),
      GoRoute(
        path: kRoleSelectionView,
        builder: (context, GoRouterState state) {
          return const RoleSelectionView();
        },
      ),
      GoRoute(
        path: kPatientLoginView,
        builder: (context, GoRouterState state) {
          return const PatientLoginView();
        },
      ),
      GoRoute(
        path: kPatientSignUpView,
        builder: (context, GoRouterState state) {
          return const PatientSignupView();
        },
      ),
      GoRoute(
        path: kPatientHomeView,
        builder: (context, GoRouterState state) {
          return PatientHomeView();
        },
      ),
      GoRoute(
        path: kPatientDashboardView,
        builder: (context, GoRouterState state) {
          return const PatientDashboardView();
        },
      ),
      GoRoute(
        path: kDoctorAuthView,
        builder: (context, GoRouterState state) {
          return const DoctorLoginView();
        },
      ),
      GoRoute(
        path: kHospitalAuthView,
        builder: (context, GoRouterState state) {
          return const HospitalLoginView();
        },
      ),
      GoRoute(
        path: kSuccessRegistrationView,
        builder: (context, GoRouterState state) {
          return const SuccessRegistrationView();
        },
      ),
       GoRoute(
        path: kExploreDoctorsView,
        builder: (context, GoRouterState state) {
          return const ExploreDoctorsView();
        },
      ),
        GoRoute(
        path: kDoctorDetailsView,
        builder: (context, GoRouterState state) {
          return const DoctorDetailsView();
        },
      ),
       GoRoute(
        path: kSuccessDocComfView,
        builder: (context, GoRouterState state) {
          return const SuccessDocComfView();
        },
      ),
    ],
  );
}
