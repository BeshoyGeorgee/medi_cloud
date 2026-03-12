import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class ArticleDetailView extends StatelessWidget {
  const ArticleDetailView({super.key});

  // ممكن تحط ده في ملف منفصل أو جوه كلاس الصفحة
  final String articleContent = """
It isn’t every day that I hop on a Skype call with a startup founder who is so blunt.
“We don’t sell online forms. We make organizations more productive,” he subtly corrects me. “It’s a deceptively small difference. After all, who cares about boring surveys? I started JotForm 13 years ago, and even I’m not passionate about forms.”

I had never heard of JotForm. Yet another website you can use to build surveys, was my first impression.
An arrogant assumption, yes — I probably could have benefited from doing some research before our call — but I knew Google Forms at least. And I knew TypeForm, which was announcing one investment round after another; they were the cool kids within startup circles.
What I didn’t know, however, was how meeting JotForm’s founder Aytekin was about to change everything I knew about doing business.

What’s beyond your otherwise boring business?

The charts Aytekin shares on his screen make me notice an interesting insight: the numbers of both paid and free users of his company, whose name I had never even heard before, were high. Indeed, they were way higher than those of their competitors who showed off their public figures on the frontage of TechCrunch.
Aytekin grew JotForm to over 5 million users without a single dime in outside funding.

VC money. Silicon Valley. Being a cool kid within startup circles or spending a fortune on PR agencies to announce investment rounds. None of these things interested him.

It was selling “organizational productivity,” not “boring forms,” that he was obsessed with — a mentality that focused on making customers more productive (and, eventually, more successful).
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // الـ Header اللي فيه الصورة والاروع
          SliverAppBar(
            expandedHeight: 360.0,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xff363853)),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // الصورة الخلفية مع الـ Gradient
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffE1D7E2), Color(0xff9E9E9E)],
                      ),
                    ),
                  ),
                  // النصوص اللي فوق الصورة
                  Positioned(
                    bottom: 40,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sell Something Bigger Than Your Otherwise Boring Business",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(
                              0xff28504B,
                            ), // اللون الازرق الغامق بتاعك
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Patrick Stanzel | 15 min read",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // محتوى المقال (النص)
          // جوه الـ build بتاع الـ ArticleDetailView
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sell Something Bigger Than Your Otherwise Boring ",
                    style: Styles.textStyle24Bold,
                  ),

                  const SizedBox(height: 20),

                  // الفقرة الأولى
                  _buildParagraph(
                    "It isn’t every day that I hop on a Skype call with a startup founder who is so blunt. "
                    "“We don’t sell online forms. We make organizations more productive,” he subtly corrects me.",
                  ),

                  const SizedBox(height: 20),

                  // جزء الاقتباس (Blockquote) بشكل مميز
                  _buildParagraph(
                    "“After all, who cares about boring surveys? I started JotForm 13 years ago, and even I’m not passionate about forms.”",
                  ),

                  const SizedBox(height: 20),

                  // الفقرات التالية
                  _buildParagraph(
                    "I had never heard of JotForm. Yet another website you can use to build surveys, was my first impression. "
                    "An arrogant assumption, yes — I probably could have benefited from doing some research before our call.",
                  ),

                  const SizedBox(height: 20),

                  _buildParagraph(
                    "What’s beyond your otherwise boring business?",
                  ),

                  const SizedBox(height: 15),

                  _buildParagraph(
                    "The charts Aytekin shares on his screen make me notice an interesting insight: "
                    "the numbers of both paid and free users of his company were high. "
                    "Aytekin grew JotForm to over 5 million users without a single dime in outside funding.",
                  ),

                  const SizedBox(height: 100), // مسافة في الآخر عشان السكرول
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ميثود للفقرة العادية
  Widget _buildParagraph(String text) {
    return Text(text, style: TextStyle(fontSize: 16, color: Colors.black));
  }
}
