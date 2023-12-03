import 'dart:io';

import 'package:files_app/blocs/index/index_bloc.dart';
import 'package:files_app/blocs/index/index_events.dart';
import 'package:files_app/blocs/index/index_states.dart';
import 'package:files_app/components/card_files.dart';
import 'package:files_app/components/card_folders.dart';
import 'package:files_app/components/card_recent_files.dart';
import 'package:files_app/components/card_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart";
import "package:file_picker/file_picker.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<IndexBloc>().add(IndexGetEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("MY BOX",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<IndexBloc, IndexState>(builder: (context, state) {
        if (state is IndexLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is IndexLoadedState) {
          return SingleChildScrollView(
              child: Column(children: [
            const CardStorage(),
            CardRecentFiles(files: state.index.recentFiles),
            CardFolders(folders: state.index.dirs),
            CardFiles(files: state.index.files)
          ]));
        }

        if (state is IndexErrorState) {
          String error = state.error;
          return Center(child: Text("Error: $error"));
        }

        return Container();
      }),
      bottomNavigationBar: BottomBarWithSheet(
        sheetChild: SingleChildScrollView(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                              child: const Row(
                                children: [
                                  Text("Galeria"),
                                  SizedBox(width: 10),
                                  Icon(Icons.image),
                                ],
                              ),
                              onPressed: () => _openGallery(context)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                              child: Row(
                                children: [
                                  Text("Foto"),
                                  SizedBox(width: 10),
                                  Icon(Icons.camera_alt_outlined),
                                ],
                              ),
                              onPressed: () {}),
                        ],
                      )
                    ])
              ],
            ),
          ),
        ),
        bottomBarTheme: const BottomBarTheme(
          decoration: BoxDecoration(color: Colors.white),
          itemIconColor: Colors.grey,
          heightOpened: 180,
        ),
        items: const [
          BottomBarWithSheetItem(icon: Icons.people),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
      ),
    );
  }

  Future<void> _openGallery(BuildContext context) async {
    FilePicker.platform.pickFiles().then((result) {
      if (result != null) {
        File file = File(result.files.single.path!);
        context.read<IndexBloc>().add(AddFileEvent(file));
      } else {
        print("no se selecciono ninguna imagen");
      }
    });
  }
}
