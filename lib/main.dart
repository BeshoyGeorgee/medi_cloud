import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/theme/theme_app.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/features/Auth/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/data/repo/patient_auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJicWd2b3h2cm9qaGN5a2JydmNuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg4NDQ4OTEsImV4cCI6MjA4NDQyMDg5MX0.SV4Ki7OU3Z-7jyqOQ51cAGxBLQU77u43vovrALqcASU',
    url: 'https://bbqgvoxvrojhcykbrvcn.supabase.co',
  );
  runApp(const MediCloudApp());
}

class MediCloudApp extends StatelessWidget {
  const MediCloudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => PatientAuthCubit(PatientAuthRepo())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.Router,

        //Set the theme to the light and unify the background color to the one defined in the constants file
        theme: AppTheme.lightTheme,
        //Start with the Splash Screen
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
