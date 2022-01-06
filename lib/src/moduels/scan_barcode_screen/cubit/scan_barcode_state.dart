part of 'scan_barcode_cubit.dart';

@immutable
abstract class ScanBarcodeState {}

class ScanBarcodeInitial extends ScanBarcodeState {}
class ScanBarcodeLoading extends ScanBarcodeState {}
class ScanBarcodeSuccess extends ScanBarcodeState {
  final String code;

  ScanBarcodeSuccess(this.code);
}
class ScanBarcodeError extends ScanBarcodeState {
  final String msg;

  ScanBarcodeError(this.msg);
}
