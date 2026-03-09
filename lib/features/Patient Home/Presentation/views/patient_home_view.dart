import 'package:flutter/material.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custome_drawer.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/patient_home_view_body.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: PatientHomeViewBody(),
    );
  }
}
