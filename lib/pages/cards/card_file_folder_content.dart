import 'package:files_app/models/file_model.dart';
import 'package:files_app/pages/file_content_page.dart';
import 'package:files_app/utils/util_types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:flutter_svg/flutter_svg.dart";

class CardFileFolderContent extends StatelessWidget {
  const CardFileFolderContent({Key? key, required this.file}) : super(key: key);
  final FileModel file;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Get.to(() => FileContentPage(file: file),
            transition: Transition.cupertino);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 220, 223, 227),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  validTypeIcon(file.typeExtension),
                  SizedBox(
                    width: size.width - 100,
                    child: Text(
                      file.originalName,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                validTypeFile(file.typeExtension, file.path),
                Container(height: 200, width: 200, color: Colors.transparent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Función para obtener el icono según la extensión del archivo
  Widget validTypeIcon(String typeExtension) {
    final extensions = {
      ".jpg": SvgPicture.asset("assets/icons/image-icon.svg"),
      ".png": SvgPicture.asset("assets/icons/image-icon.svg"),
      ".pdf": SvgPicture.asset("assets/icons/pdf-icon.svg"),
      ".xlsx": SvgPicture.asset("assets/icons/excel-icon.svg"),
    };
    return Container(
      height: 30,
      width: 30,
      child: extensions[typeExtension] ??
          Container(), // Devuelve el icono correspondiente o un contenedor vacío
    );
  }
}
