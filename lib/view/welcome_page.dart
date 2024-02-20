

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:infocom/view/webview_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive.dart';
import 'dart:io';

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            downloadGame(context);
          },
          child: Text('Download Game'),
        ),
      ),
    );
  }

  downloadGame(BuildContext context) async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      final extractedFilePath = '${dir.path}/extracted_files';

      var url = 'https://gametesting.in/flutter_test/Machine_test_build.zip';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Save the downloaded file
        var savePath = '${dir.path}/Machine_test_build.zip';
        await File(savePath).writeAsBytes(response.bodyBytes);

        // Extract the downloaded zip file
        await _extractZip(savePath, extractedFilePath);
        print('Extraction complete.');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebViewScreen()));
      } else {
        print('Error downloading file: ${response.statusCode}');
      }
    } catch (error) {
      print('Error downloading or extracting: $error');
      // Handle errors gracefully, show messages to the user
    }
  }

  Future<void> _extractZip(String zipFilePath, String destinationPath) async {
    try {
      // Read the bytes from the zip file
      List<int> bytes = await File(zipFilePath).readAsBytes();

      // Decode the zip file
      var archive = ZipDecoder().decodeBytes(bytes);
      for (var entry in archive) {
        var filePath = '$destinationPath/${entry.name}';
        if (entry.isFile) {
         final a= await File(filePath).create(recursive: true);
         
        } else {
          await Directory(filePath).create(recursive: true);
        }
      }
    } catch (error) {
      print('Error extracting zip file: $error');
    }
  }
}

