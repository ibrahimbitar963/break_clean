import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> buildImageDownloader(String url, BuildContext context) async {
  try {
    var imageId = await ImageDownloader.downloadImage(url);

    if (imageId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No URL'.tr().toString())));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image downloaded'.tr().toString())));
    }
  } on PlatformException catch (error) {
    print(error.message);
  }
}
