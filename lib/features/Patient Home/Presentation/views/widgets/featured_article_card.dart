import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';

class FeaturedArticleCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const FeaturedArticleCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kArticleDetailsView);
      },
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffE1D7E2), Color(0xff9E9E9E)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.textStyle24Bold.copyWith(color: Colors.white),
                  ),
                  Text(subtitle, style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
