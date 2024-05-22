import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/component.dart';

class GetPhotos {
  Future<List<Photos>?> getPhotos() async {
    try {
      final http.Response response = await
      http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      if (response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body);
        return photosFromJson(json);
      } else {
        throw Exception('Failed to fetch photos');
      }
    } catch (e) {
      debugPrint(e.toString);
      return null;
    }
  }
}





