import 'dart:io';

import 'package:files_app/blocs/folder/folder_bloc.dart';
import 'package:files_app/blocs/index/index_bloc.dart';
import 'package:files_app/pages/home_page.dart';
import 'package:files_app/pages/qr_scanner_url_page.dart';
import 'package:files_app/repos/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:get/get.dart";

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  final _repository = IndexRepository();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<IndexBloc>(create: (context) => IndexBloc(_repository)),
    BlocProvider<FolderBloc>(create: (context) => FolderBloc(_repository))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        enableLog: false,
        debugShowCheckedModeBanner: false,
        home: RepositoryProvider(
            create: (context) => IndexRepository(),
            child: const QRScannerUrlPage()));
  }
}
