import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_qr_code/src/moduels/scan_qr_code/cubit/scan_qr_code_cubit.dart';

class ScanQrCodeScreen extends StatelessWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Qr Code'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Scan Result',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            BlocConsumer<ScanQrCodeCubit, ScanQrCodeState>(
              listener: (context, state) {},
              builder: (context, state) {
                if(state is ScanQrCodeLoading){
                  return const Center(child: CircularProgressIndicator.adaptive());
                }
                if(state is ScanQrCodeSuccess){
                  return Text(
                    state.code,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }
                if(state is ScanQrCodeError){
                  return Text(
                    state.msg,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }
                return const Text(
                  'Un Known',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              },
            ),
            const SizedBox(height: 72),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: MaterialButton(
                  onPressed: () => ScanQrCodeCubit.of(context).scanQRCode(),
                  child: const Text('Scan Qr Code'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
