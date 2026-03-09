import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'hospital_details_state.dart';

class HospitalDetailsCubit extends Cubit<HospitalDetailsState> {
  HospitalDetailsCubit() : super(HospitalDetailsInitial());

  // Function to handle opening the map
  Future<void> openGoogleMaps(String mapUrl) async {
    try {
      final Uri url = Uri.parse(mapUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        // لو مفيش براوزر أو جوجل ماب على الجهاز
        emit(HospitalDetailsMapError('Could not open the map application.'));
      }
    } catch (e) {
      emit(HospitalDetailsMapError('An error occurred while opening the map.'));
    }
  }

  Future<void> printPdf(String path) async {
  try {
    // 1. Load the PDF file from the assets
    final ByteData pdfData = await rootBundle.load(path);

    // 2. Open the device's native print dialog
    await Printing.layoutPdf(
      onLayout: (format) async => pdfData.buffer.asUint8List(),
    );
  } catch (e) {
    debugPrint('Error printing PDF: $e');
    // ممكن هنا تعمل emit لـ State تطلع إيرور لليوزر لو حابب
  }
}

}


