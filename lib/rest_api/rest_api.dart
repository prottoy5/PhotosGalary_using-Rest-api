import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/component.dart';

class GetPhotos {
  Future<List<Photos>?> getPhotos() async {
    List<Photos> photos = <Photos>[];
    try {
      final http.Response response = await
      http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        for(Map<String,dynamic> json in jsonData){
          photos.add(Photos.fromJson(json));
        }
        return photos;
      } else {
        throw Exception('Failed to fetch photos');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
      return null;
    }
  }
}

