import 'package:files_app/repos/repositories.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget validTypeFile(String extension, String path) {
  final validImageExtensions = {".png", ".jpg", ".jpeg", ".webp"};
  const validPdfExtension = ".pdf";

  if (validImageExtensions.contains(extension)) {
    return typeImage(path);
  } else if (extension == validPdfExtension) {
    return typePdf(path);
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/icons/none-icon.svg", height: 100),
        Text("No disponible"),
      ],
    );
  }
}

Widget typeImage(String path) {
  return CachedNetworkImage(
    imageUrl: "$endpoint/$path",
    placeholder: (_, url) => const CircularProgressIndicator(),
    errorWidget: (_, url, err) => Text(err.toString()),
  );
}

Widget typePdf(String path) {
  return const PDF(
    enableSwipe: true,
    fitEachPage: true,
  ).cachedFromUrl(
    '$endpoint/$path',
    placeholder: (progress) => Center(child: Text('$progress %')),
    errorWidget: (error) => Center(child: Text(error.toString())),
  );
}
