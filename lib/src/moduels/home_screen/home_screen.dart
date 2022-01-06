import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queen_qr_code/src/moduels/create_qr_code/create_qr_code_screen.dart';
import 'package:queen_qr_code/src/moduels/scan_barcode_screen/scan_barcode_screen.dart';
import 'package:queen_qr_code/src/moduels/scan_qr_code/scan_qr_code_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Qr Code'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateQrCodeScreen(),
                  ),
                ),
                child: const Text('Create Qr Code'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScanQrCodeScreen(),
                  ),
                ),
                child: const Text('Scan Qr Code'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScanBarCodeScreen(),
                  ),
                ),
                child: const Text('Scan Barcode Code'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
