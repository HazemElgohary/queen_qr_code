import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_qr_code/src/commen/alerts.dart';
import 'package:queen_qr_code/src/moduels/create_qr_code/cubit/create_qr_code_cubit.dart';

class DefaultFormField extends StatefulWidget {
  final VoidCallback onTap;
  final TextEditingController controller;

  const DefaultFormField(
      {Key? key, required this.onTap, required this.controller,})
      : super(key: key);

  @override
  State<DefaultFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: TextField(
            controller: widget.controller,
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
            onChanged: (value) => setState(() {}),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .02,
        ),
        BlocConsumer<CreateQrCodeCubit, CreateQrCodeState>(
          listener: (context, state) {
            if (state is CreateQrCodeSuccess) {
              Alert.success('Image Saved Success');
            }
            if (state is CreateQrCodeError) {
              Alert.error(state.msg);
            }
          },
          builder: (context, state) {
            if (state is CreateQrCodeLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return CircleAvatar(
              radius: 25,
              child: IconButton(
                onPressed: widget.onTap,
                icon: const Icon(Icons.save),
              ),
            );
          },
        ),
      ],
    );
  }
}
