import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreateQrCodeScreen extends StatefulWidget {
  const CreateQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<CreateQrCodeScreen> createState() => _CreateQrCodeScreenState();
}

class _CreateQrCodeScreenState extends State<CreateQrCodeScreen> {

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
              buildTextField(context),
            ],
          ),
        ),
      ),
    );
  }



  Widget buildTextField(BuildContext context) => TextField(
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
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
    onChanged: (value)=>setState(() {}),
  );
}
