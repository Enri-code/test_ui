import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:test_ui/features/reload/presentation/screens/enter_otp.dart';
import 'package:test_ui/global/presentation/theme/text_styles.dart';

class QRScreen extends StatefulWidget {
  static const route = '/qr_screen';
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: const Color(0xff1D1D1D),
        padding: const EdgeInsets.all(56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(image: AssetImage('assets/images/fin_pro.png')),
            const SizedBox(height: 8),
            Text(
              'Fin Pro',
              style: TextStyles.body2.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 58),
            Text(
              'Scan QR code to pay. Position your card in the frame',
              style: TextStyles.body2.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) {
                    this.controller = controller;
                    controller.scannedDataStream.listen((scanData) {
                      Navigator.of(context).popAndPushNamed(OtpScreen.route);
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Scanning...',
              style: TextStyles.body2.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
