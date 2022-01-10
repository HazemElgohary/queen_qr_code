import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_qr_code/src/commen/alerts.dart';
import 'package:queen_qr_code/src/moduels/create_qr_code/cubit/create_qr_code_cubit.dart';
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
                buildTextField(
                  context1: context,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required BuildContext context1,
    required VoidCallback onTap,
  }) =>
      Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context1).size.width * .7,
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: 'Enter the data',
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context1).primaryColor,
                  ),
                ),
              ),
              onChanged: (value) => setState(() {}),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context1).size.width * .02,
          ),
          BlocConsumer<CreateQrCodeCubit, CreateQrCodeState>(
            listener: (context1, state) {
              if (state is CreateQrCodeSuccess) {
                Alert.success('Image Saved Success');
              }
              if (state is CreateQrCodeError) {
                Alert.error(state.msg);
              }
            },
            builder: (context1, state) {
              if (state is CreateQrCodeLoading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              return CircleAvatar(
                radius: 25,
                child: IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.save),
                ),
              );
            },
          ),
        ],
      );
}
