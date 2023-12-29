import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class FormPage extends StatelessWidget {
  final Function addCourse;
  final Function(Map<String, dynamic>) onCourseAdded;

  FormPage({Key? key, required this.addCourse, required this.onCourseAdded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController imageUrlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Course')),
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
                addCourse(
                  titleController.text,
                  double.tryParse(priceController.text) ?? 0.0,
                  imageUrlController.text,
                );

                Map<String, dynamic> newCourse = {
                  'title': titleController.text,
                  'price': double.tryParse(priceController.text) ?? 0.0,
                  'imageUrl': imageUrlController.text,
                };

                onCourseAdded(newCourse);
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
