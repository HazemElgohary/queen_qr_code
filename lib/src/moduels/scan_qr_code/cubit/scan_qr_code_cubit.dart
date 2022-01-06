import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'scan_qr_code_state.dart';

class ScanQrCodeCubit extends Cubit<ScanQrCodeState> {
  ScanQrCodeCubit() : super(ScanQrCodeInitial());

  static ScanQrCodeCubit of(context){
    return BlocProvider.of(context);
  }


  Future<void> scanQRCode() async {
    emit(ScanQrCodeLoading());
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

     emit(ScanQrCodeSuccess(qrCode));
    } catch(e) {
      emit(ScanQrCodeError(e.toString()));
    }
  }
}
