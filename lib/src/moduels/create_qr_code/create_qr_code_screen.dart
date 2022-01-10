import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_qr_code/src/commen/alerts.dart';
import 'package:queen_qr_code/src/moduels/create_qr_code/cubit/create_qr_code_cubit.dart';
import 'package:queen_qr_code/src/moduels/create_qr_code/views/defualt_from_field.dart';
import 'package:screenshot/screenshot.dart';

class CreateQrCodeScreen extends StatefulWidget {
  const CreateQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<CreateQrCodeScreen> createState() => _CreateQrCodeScreenState();
}

class _CreateQrCodeScreenState extends State<CreateQrCodeScreen> {
  final controller = TextEditingController();
  final screenShotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Screenshot(
      controller: screenShotController,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Qr Code'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  color: Colors.white,
                  data: controller.text,
                  width: size.width * .8,
                  height: size.height * 0.8,
                ),
                SizedBox(height: size.height * .1),
                DefaultFormField(
                  onTap: () async {
                    final image = await screenShotController.captureFromWidget(
                      BarcodeWidget(
                        barcode: Barcode.qrCode(),
                        color: Colors.white,
                        data: controller.text,
                        width: size.width * .8,
                        height: size.height * 0.8,
                      ),
                    );
                    await CreateQrCodeCubit.of(context)
                        .saveImageInGallery(image: image);
                  },
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
