import 'package:flutter/material.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/pdf_print_bottom_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// استدعي الـ Bottom Bar اللي لسه عاملينه

class TestResultPdfView extends StatelessWidget {
  final String pdfAssetPath; 

  const TestResultPdfView({
    super.key, 
    required this.pdfAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // --- 1. PDF Viewer Section ---
          Expanded(
            child: SfPdfViewer.asset(
              pdfAssetPath,
              canShowScrollHead: false,
              canShowScrollStatus: false,
            ),
          ),
          
          // --- 2. Print Button Section (Separated Widget) ---
          PdfPrintBottomBar(pdfAssetPath: pdfAssetPath),
        ],
      ),
    );
  }
}