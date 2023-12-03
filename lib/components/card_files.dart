import 'package:files_app/blocs/index/index_bloc.dart';
import 'package:files_app/blocs/index/index_states.dart';
import 'package:files_app/models/file_model.dart';
import 'package:files_app/models/index_model.dart';
import 'package:flutter/material.dart';

import 'package:files_app/components/card_file.dart';
import 'package:files_app/constants/constants_vars.dart';
import "package:anim_search_bar/anim_search_bar.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CardFiles extends StatefulHookWidget {
  const CardFiles({super.key, required this.files});
  final List<FileModel> files;

  @override
  State<CardFiles> createState() => _CardFilesState();
}

class _CardFilesState extends State<CardFiles> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("Files", style: titleCardStyle),
              SizedBox(
                height: 40,
                child: AnimSearchBar(
                    boxShadow: false,
                    color: Colors.transparent,
                    autoFocus: true,
                    width: size.width - 100,
                    textController: _searchController,
                    onSuffixTap: () {},
                    onSubmitted: (value) {}),
              ),
            ]),
            Column(
                children:
                    widget.files.map((file) => CardFile(file: file)).toList())
          ],
        ),
      ),
    );
  }
}
