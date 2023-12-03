import 'package:files_app/models/file_model.dart';
import 'package:files_app/pages/file_content_page.dart';
import "package:files_app/utils/util_types.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTypeFile extends StatelessWidget {
  const CardTypeFile({super.key, required this.file});
  final FileModel file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => FileContentPage(file: file),
          transition: Transition.cupertino),
      child: Container(
        margin: const EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    height: 200,
                    width: 200,
                    child: validTypeFile(file.typeExtension, file.path)),
                Container(
                  color: Colors.transparent,
                  width: 200,
                  height: 200,
                ),
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
                width: 150,
                child: Text(
                  file.originalName,
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
