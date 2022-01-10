import 'dart:math';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'create_qr_code_state.dart';

class CreateQrCodeCubit extends Cubit<CreateQrCodeState> {
  CreateQrCodeCubit() : super(CreateQrCodeInitial());

  static CreateQrCodeCubit of(context){
    return BlocProvider.of(context);
  }


  Future<void> saveImageInGallery({
    required Uint8List image,
  }) async{
    await [Permission.storage].request();
    emit(CreateQrCodeLoading());
    try{
      int count = Random().nextInt(100);
      final name = 'QRCodeImage$count';
      ImageGallerySaver.saveImage(image,name: name,);
      emit(CreateQrCodeSuccess());
    }
    catch(e){
      emit(CreateQrCodeError(e.toString()));
    }

  }
}
