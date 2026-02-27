import 'package:flutter/material.dart';

class HeartRateCard extends StatelessWidget {
  const HeartRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        // Apply linear gradient from dark teal to a lighter shade
        gradient: const LinearGradient(
          colors: [Color(0xFF1E3A34), Color(0xFF3DA991)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          // Background decoration: Faint heart rate icon positioned at the bottom right
          Positioned(
            right: 20,
            bottom: 20,
            child: Icon(
              Icons.show_chart, 
              size: 120,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top section: Last update info and 'More details' button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Last update', style: TextStyle(color: Colors.white70, fontSize: 12)),
                        Text('41 min ago', style: TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Text('More details', style: TextStyle(color: Colors.white)),
                      label: const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                    ),
                  ],
                ),
                const Spacer(),
                // Bottom section: Heart rate value (BPM) and status
                const Text('Heart Rate', style: TextStyle(color: Colors.white70, fontSize: 16)),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '65',
                      style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'bpm',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Spacer(),
                    Text(
                      'Normal',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}