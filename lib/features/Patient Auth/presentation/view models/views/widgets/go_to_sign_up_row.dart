import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/signout_or_signin_row_text.dart';

class GoToSignUpRow extends StatelessWidget {
  const GoToSignUpRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpOrSignInRowText(
      text: "Don't have an account?",
      actionText: "Sign Up",
      onTap: () => GoRouter.of(context).push(AppRouter.kRoleSelectionView),
    );
  }
}
