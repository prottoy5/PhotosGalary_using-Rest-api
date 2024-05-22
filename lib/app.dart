import 'package:flutter/material.dart';

import 'views/screen/photo_gallery.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rest Api',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.white),
        scaffoldBackgroundColor: Colors.white
      ),
      home: const PhotoGallery(),
    );
  }
}
