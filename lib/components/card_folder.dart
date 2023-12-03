import 'package:files_app/models/dir_model.dart';
import 'package:files_app/pages/folder_content_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTypeFolder extends StatelessWidget {
  const CardTypeFolder({super.key, required this.folder});
  final Dir folder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => FolderContentPage(dir: folder),
          transition: Transition.cupertino),
      child: Container(
        margin: const EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: Column(
          children: [
            const Icon(Icons.folder, size: 50),
            const SizedBox(height: 10),
            Text(folder.dirName)
          ],
        ),
      ),
    );
  }
}
