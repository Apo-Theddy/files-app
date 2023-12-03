import 'package:files_app/constants/constants_vars.dart';
import 'package:files_app/models/file_model.dart';
import 'package:files_app/utils/util_types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class FileContentPage extends StatelessWidget {
  const FileContentPage({super.key, required this.file});
  final FileModel file;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(file.originalName)),
      body: filePage(size),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _floatingButton(Icons.favorite_border, addFavoriteImage),
            // _floatingButton(Icons.share_outlined, shareImage),
            _floatingButton(Icons.delete_outline, deleteImage),
            _floatingButton(Icons.info_outline, () => infoFile(context)),
          ],
        ),
      ),
    );
  }

  Widget infoPage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        infoCardWidget(
            "Fecha de creacion", Icons.calendar_month_outlined, "28/09/2023"),
        infoCardWidget("Carpeta base", Icons.folder_open,
            file.dir != null ? file.dir!.dirName : "uploads"),
        infoCardWidget(
            "Extension", Icons.extension_outlined, file.typeExtension),
        if (file.width != null && file.height != null)
          infoCardWidget("Dimensiones", Icons.extension_outlined,
              "${file.width} x ${file.height}"),
        infoCardWidget("Tamanio", Icons.extension_outlined, "${file.size}"),
      ],
    );
  }

  Widget infoCardWidget(String title, IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 10),
              Text(info, style: TextStyle(color: Colors.white, fontSize: 18))
            ],
          ),
        ],
      ),
    );
  }

  Widget filePage(Size size) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: validTypeFile(file.typeExtension, file.path),
          ),
        ],
      ),
    );
  }

  Widget _floatingButton(IconData icon, VoidCallback action) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        margin: const EdgeInsets.all(5),
        child: Icon(icon, size: 30),
      ),
    );
  }

  void infoFile(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        backgroundColor: Colors.black12,
        context: context,
        builder: (context) {
          return infoPage();
        });
  }
}

void addFavoriteImage() {
  print("add to favorite");
}

void deleteImage() {
  print("deleted image");
}

// void shareImage() {
//   print("shared image");
// }
