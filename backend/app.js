const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

app.use(bodyParser.json());
app.use(cors());

// Sample data (to be replaced with database)
let courses = [
  { id: 1, title: 'Angular/springBoot', price: 100, imageUrl: 'course1.jpg' },
  { id: 2, title: 'Reactjs/node js', price: 150, imageUrl: 'course2.jpg' },
  { id: 1, title: 'flutter/firebase', price: 350, imageUrl: 'course1.jpg' },
  { id: 2, title: 'Reactjs/node js', price: 150, imageUrl: 'course2.jpg' },
  { id: 1, title: 'flutter/firebase', price: 350, imageUrl: 'course1.jpg' },
  { id: 2, title: 'business intelligence', price: 350, imageUrl: 'course2.jpg' },
  { id: 1, title: 'Angular/springBoot', price: 100, imageUrl: 'course1.jpg' },
  { id: 2, title: 'business intelligence', price: 150, imageUrl: 'course2.jpg' },
];

// Get all courses
app.get('/courses', (req, res) => {
  res.json(courses);
});

// Get a specific course
app.get('/courses/:id', (req, res) => {
  const courseId = Number(req.params.id);
  const course = courses.find(course => course.id === courseId);
  if (!course) {
    return res.status(404).json({ message: 'Course not found' });
  }
  res.json(course);
});

// Create a new course
app.post('/courses', (req, res) => {
  const newCourse = req.body;
  courses.push(newCourse);
  res.status(201).json({ message: 'Course created successfully' });
});

// Update a course
app.put('/courses/:id', (req, res) => {
  const courseId = Number(req.params.id);
  const updatedCourse = req.body;
  courses = courses.map(course =>
    course.id === courseId ? { ...course, ...updatedCourse } : course
  );
  res.json({ message: 'Course updated successfully' });
});

// Delete a course
app.delete('/courses/:id', (req, res) => {
  const courseId = Number(req.params.id);
  courses = courses.filter(course => course.id !== courseId);
  res.json({ message: 'Course deleted successfully' });
});

const PORT = 4000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
  console.log(courses);
});
