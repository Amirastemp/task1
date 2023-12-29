import 'package:flutter/material.dart';

class Course {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  Course({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
}

class UpdatePage extends StatelessWidget {
  final Map<String, dynamic> course;
  final Function(Map<String, dynamic>) onUpdate;

  UpdatePage({Key? key, required this.course, required this.onUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: course['title'].toString());
    TextEditingController priceController =
        TextEditingController(text: course['price'].toString());
    TextEditingController imageUrlController =
        TextEditingController(text: course['imageUrl'].toString());

    return Scaffold(
      appBar: AppBar(title: const Text('Update Course')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(
                labelText: 'Image URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Map<String, dynamic> updatedCourse = {
                  'id': course['id'], // Ensure the ID is preserved
                  'title': titleController.text,
                  'price': double.tryParse(priceController.text) ?? 0.0,
                  'imageUrl': imageUrlController.text,
                  // Add other updated fields here
                };

                // Pass the updated course back to the home page
                onUpdate(updatedCourse);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
