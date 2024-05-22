import 'package:flutter/material.dart';

import '../../model/component.dart';
import '../../rest_api/rest_api.dart';
import 'details_screen.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  List<Photos> photos = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      photos = (await GetPhotos().getPhotos())!;
      if (photos.isNotEmpty) {
        print('Fetched ${photos.length} photos');
      }
    } catch (e) {
      print('Error fetching photos: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : photos.isEmpty
              ? const Center(child: Text('No photos available'))
              : ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(details: photos[index]),
                        ),
                      ),
                      child: ListTile(
                        leading: Image.network(
                          photos[index].url,
                        ),
                        title: Text(photos[index].title),
                      ),
                    );
                  },
                ),
    );
  }
}
