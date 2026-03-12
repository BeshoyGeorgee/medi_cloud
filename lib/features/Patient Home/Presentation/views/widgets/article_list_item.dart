import 'package:flutter/material.dart';

class ArticleListItem extends StatelessWidget {
  final String title;
  final String subTitle;

  const ArticleListItem({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xffE1D7E2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.article_outlined, color: Colors.grey),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Color(0xff49454F), fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}