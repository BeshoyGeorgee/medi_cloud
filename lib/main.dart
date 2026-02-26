import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/theme/theme_app.dart';
import 'package:medi_cloud_app/features/Auth/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/features/SplashScreen/presentation/views/SplashView.dart';

void main() {
  runApp(const MediCloudApp());
}

class MediCloudApp extends StatelessWidget {
  const MediCloudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child:  MaterialApp(
        //Set the theme to the light and unify the background color to the one defined in the constants file
        theme: AppTheme.lightTheme,
        //Start with the Splash Screen
        home: Splashview(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
