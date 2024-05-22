import 'package:flutter/material.dart';
import '../../model/component.dart';

class DetailsScreen extends StatelessWidget {
  final Photos details;
  const DetailsScreen({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Image.network(
              details.thumbnailUrl,
              fit: BoxFit.cover,
            )),
            const SizedBox(height: 16),
            Text(
              "Title: ${details.title}",
            ),
            const SizedBox(height: 8),
            Text(
              'ID: ${details.id}',
            ),
          ],
        ),
      ),
    );
  }
}
