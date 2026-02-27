import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';

class ConnectWerableDevice extends StatelessWidget {
  const ConnectWerableDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        // Subtle shadow to elevate the card from the background
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Information Section
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Connect to\nApple Health',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A34), 
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sync all health data in one Place. Apple Watch and Powerbeats Pro 2 supported',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.teal.shade300,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              // Wearable Device Image Section
              Expanded(
                flex: 1,
                child: Image.network(
                  'https://ouch-cdn2.icons8.com/mO_p9-8y9E-kYq1Xz1Xz1Xz1Xz1Xz1Xz1Xz1Xz1Xz1Xz.png', 
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Action Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                // Future: Integration with health fitness APIs
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Connect',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}