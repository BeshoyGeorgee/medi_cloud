import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomeSignupStepper extends StatelessWidget {
  final int currentStep; // بتبدأ من 1 لحد 4
  final int totalSteps = 4;

  const CustomeSignupStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // بياخد عرض الشاشة كله
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(totalSteps, (index) {
          int stepNumber = index + 1;
          bool isCompleted = stepNumber < currentStep;
          bool isActive = stepNumber == currentStep;

          return Expanded(
            // لو دي مش آخر خطوة، حط الخط والدائرة في Expanded
            // لو دي آخر خطوة، حط الدائرة بس
            flex: index == totalSteps - 1 ? 0 : 1,
            child: Row(
              children: [
                // الدائرة
                _buildStepCircle(stepNumber, isCompleted, isActive),
                
                // الخط الواصل
                if (stepNumber < totalSteps)
                  Expanded(
                    child: Container(
                      height: 2,
                      color: kPrimaryColor,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStepCircle(int number, bool isCompleted, bool isActive) {
    return Container(
      width: 34,
      height: 34, // خليتها 40 عشان تكون دائرة مظبوطة
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCompleted ? kPrimaryColor : Colors.white,
        border: Border.all(
          color: kPrimaryColor, 
          width: 2,
        ),
      ),
      child: Center(
        child: isCompleted
            ? const Icon(Icons.check, size: 18, color: Colors.white)
            : Text(
                number.toString().padLeft(2, '0'),
                style: const TextStyle(
                  color: Color(0xff242E39),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}