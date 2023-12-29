import 'package:backend/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'formpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Management',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: CourseList(),
    );
  }
}

class CourseList extends StatefulWidget {
  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  List<dynamic> courses = [];

  Future<void> fetchCourses() async {
    final response = await http.get(Uri.parse('http://localhost:4000/courses'));
    if (response.statusCode == 200) {
      setState(() {
        courses = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load courses');
    }
  }

/****************************************post courses********************************************************/
  void addCourse(int id, String title, double price, String urlimg) async {
    final response = await http.post(
      Uri.parse('http://localhost:4000/courses'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'imageUrl': urlimg,
        'title': title,
        'price': price,

        // Add other properties here as needed
      }),
    );
    /**********************delete function********************* */
    void deleteCourse(int courseId) async {}

    if (response.statusCode == 201) {
      // Course added successfully, perform any necessary actions
      // For instance, update the UI or show a success message
      // You might want to refresh the course list after adding a new course
      fetchCourses();
    } else {
      // Handle errors, show an error message, etc.
      throw Exception('Failed to add course');
    }
  }

  /************************************update methode *****************************************/
  Future<void> updateCourse(
      int index, String title, double price, String urlImg) async {
    final response = await http.put(
      Uri.parse(
          'http://localhost:4000/courses/$index'), // Assuming the endpoint follows a RESTful convention
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'imageUrl': urlImg,
        'title': title,
        'price': price,
        // Add other properties here as needed for updating
      }),
    );

    if (response.statusCode == 200) {
      // Course updated successfully
      // You can add additional logic here if needed
    } else {
      // Course update failed
      throw Exception('Failed to update course');
    }
  }

  @override
  void initState() {
    fetchCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course List'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Implement update or delete functionality here
              // For example, you can show a dialog or navigate to an update/delete screen
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Course Options'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Example options: Update and Delete
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('Update Course'),
                          onTap: () {
                            // Navigate to the UpdatePage and handle the course update there
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdatePage(
                                  // Pass the course data to the UpdatePage

                                  course: courses[index],
                                  onUpdate: (updatedCourse) {
                                    // Update the course in the list
                                    setState(() {
                                      courses[index] = updatedCourse;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),

                        ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Delete Course'),
                            onTap: () {
                              // Implement delete functionality here
                              // This could involve a confirmation dialog and deletion logic
                              try {
                                final response = http.delete(
                                  Uri.parse('http://localhost:4000/courses/0'),
                                  headers: <String, String>{
                                    'Content-Type':
                                        'application/json; charset=UTF-8',
                                  },
                                );
                              } catch (error) {
                                // Handle exceptions or connection errors
                                print('Error deleting course: $error');
                              }
                            }),
                      ],
                    ),
                  );
                },
              );
            },
            child: ListTile(
              leading: Text(courses[index]['imageUrl']),
              title: Text(courses[index]['title']),
              subtitle: Text('Price: \$${courses[index]['price']}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(
                addCourse: addCourse,
                onCourseAdded: (newCourse) {
                  // Update the course list in the home page
                  setState(() {
                    courses.add(newCourse);
                  });
                },
              ),
            ),
          );
        },
        tooltip: 'Add Course',
        child: Icon(Icons.add),
      ),
    );
  }
}
