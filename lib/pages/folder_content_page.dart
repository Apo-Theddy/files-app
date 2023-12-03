import 'package:files_app/blocs/folder/folder_bloc.dart';
import 'package:files_app/blocs/folder/folder_events.dart';
import 'package:files_app/blocs/folder/folder_states.dart';
import 'package:files_app/models/dir_model.dart';
import 'package:files_app/models/file_model.dart';
import 'package:files_app/pages/cards/card_file_folder_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FolderContentPage extends StatefulWidget {
  const FolderContentPage({Key? key, required this.dir}) : super(key: key);
  final Dir dir;

  @override
  State<FolderContentPage> createState() => _FolderContentPageState();
}

class _FolderContentPageState extends State<FolderContentPage> {
  @override
  void initState() {
    context.read<FolderBloc>().add(ReadFilesByFolderEvent(widget.dir.dirID, 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.dir.dirName,
              style: const TextStyle(color: Colors.black)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: BlocBuilder<FolderBloc, FolderState>(builder: (context, state) {
          if (state is FolderLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FolderLoadedState) {
            List<FileModel> files = state.files;
            return ListView.builder(
                itemCount: files.length,
                itemBuilder: (_, i) {
                  return CardFileFolderContent(file: files[i]);
                });
          }
          if (state is FolderErrorState) {
            String err = state.error;
            return Center(child: Text(err));
          }

          return Container();
        }));
  }
}
