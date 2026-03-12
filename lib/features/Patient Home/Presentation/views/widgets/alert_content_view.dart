import 'package:flutter/material.dart';

import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/article_list_item.dart';

class AlertContentView extends StatelessWidget {
  const AlertContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      children: [
        const ArticleListItem(
          title: "List item",
          subTitle:
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
        ),
      ],
    );
  }
}
