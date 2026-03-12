import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'featured_article_card.dart'; // Import
import 'article_list_item.dart';    // Import

class ArticlesTabView extends StatelessWidget {
  const ArticlesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      children: [
        Text(
          "New Articles",
          style: Styles.textStyle22Bold.copyWith(color: kShadePrimaryColor),
        ),
        const SizedBox(height: 10),
        const FeaturedArticleCard(title: "Articles Title", subtitle: "Subtitle"),
        const SizedBox(height: 18),
        Text(
          "All Articles",
          style: Styles.textStyle22Bold.copyWith(color: kShadePrimaryColor),
        ),
        const SizedBox(height: 15),
        const ArticleListItem(
          title: "List item",
          subTitle: "Supporting line text lorem ipsum dolor sit amet, consectetur.",
        ),
        const Divider(height: 30),
        const ArticleListItem(
          title: "List item",
          subTitle: "Supporting line text lorem ipsum dolor sit amet, consectetur.",
        ),
      ],
    );
  }
}