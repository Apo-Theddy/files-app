import 'package:files_app/blocs/index/index_bloc.dart';
import 'package:files_app/blocs/index/index_states.dart';
import 'package:files_app/components/card_folder.dart';
import 'package:files_app/constants/constants_vars.dart';
import 'package:files_app/models/dir_model.dart';
import 'package:files_app/models/index_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CardFolders extends HookWidget {
  const CardFolders({super.key, required this.folders});
  final List<Dir> folders;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My folders", style: titleCardStyle),
              Icon(Icons.arrow_forward_rounded),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: folders
                    .map((folder) => CardTypeFolder(folder: folder))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
