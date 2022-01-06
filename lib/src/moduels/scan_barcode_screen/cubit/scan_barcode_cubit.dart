import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'scan_barcode_state.dart';

class ScanBarcodeCubit extends Cubit<ScanBarcodeState> {
  ScanBarcodeCubit() : super(ScanBarcodeInitial());

  static ScanBarcodeCubit of(context){
    return BlocProvider.of(context);
  }


  Future<void> scanBarCode() async {
    emit(ScanBarcodeLoading());
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      emit(ScanBarcodeSuccess(qrCode));
    } catch(e) {
      emit(ScanBarcodeError(e.toString()));
    }
  }
}
