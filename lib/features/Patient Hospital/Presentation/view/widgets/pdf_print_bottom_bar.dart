import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Data/hospital_details_cubit.dart';


class PdfPrintBottomBar extends StatelessWidget {
  final String pdfAssetPath;

  const PdfPrintBottomBar({
    super.key,
    required this.pdfAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [AppDecorations.bottomBarShadow], 
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            context.read<HospitalDetailsCubit>().printPdf(pdfAssetPath);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Print as a PDF',
            style: TextStyle(
              color: Colors.white, 
              fontSize: 16, 
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}