import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:queen_qr_code/src/bloc_observer.dart';
import 'package:queen_qr_code/src/moduels/create_qr_code/cubit/create_qr_code_cubit.dart';
import 'package:queen_qr_code/src/moduels/scan_barcode_screen/cubit/scan_barcode_cubit.dart';
import 'package:queen_qr_code/src/moduels/scan_qr_code/cubit/scan_qr_code_cubit.dart';

import 'src/moduels/home_screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {
          runApp(const MyApp());
          },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ScanQrCodeCubit(),),
        BlocProvider(create: (context) => ScanBarcodeCubit()),
        BlocProvider(create: (context) => CreateQrCodeCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primaryColor: Colors.deepOrange,
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}


