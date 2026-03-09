import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Chatbot/Presentation/view/widgets/chat_bubble.dart';
import 'package:medi_cloud_app/features/Chatbot/Presentation/view/widgets/option_panel.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      body: Column(
        children: [
          // 1. Custom Header
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: kPrimaryColor,
                  child: Image(
                    image: AssetImage(Assets.imagesMedicloudChatBotLogo),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "MediCloud chatbot",
                  style: Styles.textStyle24Bold.copyWith(color: kPrimaryColor),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // 2. Chat Messages Area
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                ChatBubble(
                  message:
                      "Hello! I'm your Heart Health Assistant. How can I help you today",
                  isBot: true,
                  time: "7:20",
                ),
                ChatBubble(
                  message: "I have symptoms I want to discuss",
                  isBot: false,
                  time: "7:20",
                ),
                ChatBubble(
                  message: "What symptoms are you experiencing right now?",
                  isBot: true,
                  time: "7:20",
                ),
              ],
            ),
          ),

          // 3. Options Panel (The White Bottom Card)
          OptionsPanel(),
        ],
      ),
    );
  }
}
