import 'package:flutter/material.dart';

Widget customeProfileImage() {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      const CircleAvatar(
        radius: 60,
        backgroundColor: Colors.orange,
        backgroundImage: NetworkImage(
          'https://randomuser.me/api/portraits/men/32.jpg',
        ),
      ),
      Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Icon(Icons.edit_outlined, size: 20),
      ),
    ],
  );
}
