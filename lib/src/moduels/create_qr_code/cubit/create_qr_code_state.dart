part of 'create_qr_code_cubit.dart';

@immutable
abstract class CreateQrCodeState {}

class CreateQrCodeInitial extends CreateQrCodeState {}
class CreateQrCodeLoading extends CreateQrCodeState {}
class CreateQrCodeSuccess extends CreateQrCodeState {}
class CreateQrCodeError extends CreateQrCodeState {
  final String msg;

  CreateQrCodeError(this.msg);
}
