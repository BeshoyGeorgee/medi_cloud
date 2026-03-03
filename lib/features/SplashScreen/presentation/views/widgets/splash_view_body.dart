import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Role%20Selection/presentation/views/role_selection_view.dart';
import 'package:medi_cloud_app/features/SplashScreen/presentation/views/widgets/sliding_text.dart';

//Splash view body is the main widget of the splash view and
// it contains all the widgets that are displayed on the splash screen

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  //variables for the animation controller and the sliding animation
  late AnimationController animationController;
  late Animation<Offset> SlidingAnimation;

  @override
  void initState() {
    super.initState();
    //Sliding animation function (below the build method)
    initSlidingAnimation();
    //Navigate Function to th auth view
    NavigateToAuthView();
  }

  @override
  void dispose() {
    //Dispose the animation controller to free up resources
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Display the app logo
          Image.asset(Assets.imagesMediCloudLogo, height: 200),
          //Display the sliding text
          Slidingtext(SlidingAnimation: SlidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    //Initialize the animation controller and the sliding animation
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    //Start the animation
    SlidingAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.decelerate),
    );

    //listen to the animation and rebuild the widget when the animation changes
    animationController.forward();
  }

  void NavigateToAuthView() {
    //Navigate to the Auth view after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).go(AppRouter.kRoleSelectionView);
    });
  }
}
