import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

Future<void> buildImageDownloader(String url,BuildContext context) async {

  try{

    var imageId =   await ImageDownloader.downloadImage(url).whenComplete(() =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image downloaded successfully'))));
  if (imageId == null) {
    print('image id null');
  }

  } on PlatformException catch (error) {
    print(error.message);

  }
}