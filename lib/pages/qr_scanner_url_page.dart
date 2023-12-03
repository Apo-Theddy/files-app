import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:qr_code_scanner/qr_code_scanner.dart";

class QRScannerUrlPage extends StatefulWidget {
  const QRScannerUrlPage({super.key});

  @override
  State<QRScannerUrlPage> createState() => _QRScannerUrlPageState();
}

class _QRScannerUrlPageState extends State<QRScannerUrlPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 5,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQrViewCreated,
          ),
        ),
        Expanded(
            child: Center(
                child: (result != null)
                    ? Text(
                        "Barcode type: ${describeEnum(result!.format)} Data: ${result!.code}")
                    : Text("Scan a code")))
      ]),
    );
  }

  void _onQrViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        print(scanData);
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
