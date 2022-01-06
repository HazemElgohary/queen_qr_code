part of 'scan_qr_code_cubit.dart';

@immutable
abstract class ScanQrCodeState {}

class ScanQrCodeInitial extends ScanQrCodeState {}
class ScanQrCodeLoading extends ScanQrCodeState {}
class ScanQrCodeSuccess extends ScanQrCodeState {
  final String code;

  ScanQrCodeSuccess(this.code);
}
class ScanQrCodeError extends ScanQrCodeState {
  final String msg;

  ScanQrCodeError(this.msg);
}
