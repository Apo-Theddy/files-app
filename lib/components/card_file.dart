import 'package:files_app/models/file_model.dart';
import 'package:files_app/pages/file_content_page.dart';
import 'package:flutter/material.dart';
import "package:flutter_slidable/flutter_slidable.dart";
import "package:files_app/utils/util_types.dart";
import 'package:get/get.dart';

class CardFile extends StatelessWidget {
  const CardFile({super.key, required this.file});
  final FileModel file;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.to(() => FileContentPage(file: file),
          transition: Transition.cupertino),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            GestureDetector(
              onTap: () {
                print("deleted file");
              },
              child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  // width: size.width * 0.15,
                  child: const Icon(Icons.delete_outline, size: 30)),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 1)
              ]),
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(children: [
            Row(children: [
              Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: validTypeFile(file.typeExtension, file.path)),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.35,
                    child: Text(file.originalName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 5),
                  Text("${file.size.toString().substring(0, 5)} MB",
                      style: const TextStyle(color: Colors.grey))
                ],
              ),
              Expanded(child: Container()),
              const Icon(
                Icons.more_vert,
                color: Colors.grey,
              )
            ])
          ]),
        ),
      ),
    );
  }
}
