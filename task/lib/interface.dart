import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bridge extends StatelessWidget {
  const Bridge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                'assets/images/the bridge.png',
                height: 100,
                width: 200,
              ),
            ),
            Stack(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9PA4guc2RG8kSaxseVgUn2km9h2ZJUOGJ5Q&usqp=CAU', // Remplacez par l'URL de votre image
                  height: 400,
                  width: double.infinity,
                  fit:
                      BoxFit.cover, // Ajuste la façon dont l'image est affichée
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80.0),
                    child: Container(
                      width: 400,
                      height: 180,
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white10.withOpacity(0.6),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text(
                              'Improve your skills on your own  ',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Center(
                            child: Text(
                              'To prepare for a better future ',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add button functionality
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the value to change the border radius
                              ), // Set the background color to purple
                            ),
                            child: const Text('REGISTER NOW'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Discover Our Courses",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add button functionality
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the value to change the border radius
                      ), // Set the background color to purple
                    ),
                    child: const Text('View More'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Image.network(
                        "data:image/png;base64,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",
                      ),
                    ),
                    const Text(
                      'SpringBoot / Angular',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '350dt/Month',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Image.network(
                        "data:image/jpeg;base64,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",
                      ),
                    ),
                    const Text(
                      'Node JS / React',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('350dt/Month',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink)),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMpq4cSPdNgPsq5m91gOvUD5FqUPxXHkAO-Q&usqp=CAU ",
                      ),
                    ),
                    const Text('Flutter / Firebase',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    const Text('350dt/Month',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink)),
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwkKNSeSraNUwBDoC4zfn0Hnzv9zCDEshtjg&usqp=CAU",
                        ),
                      ),
                      const Text(
                        'Business Intelligence',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '350dt/Month',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Image.network(
                          "data:image/jpeg;base64,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",
                        ),
                      ),
                      const Text(
                        'Artificial Intelligence',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '350dt/Month',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Image.network(
                          "data:image/png;base64,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",
                        ),
                      ),
                      const Text(
                        'Devops',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '350dt/Month',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 300, vertical: 40),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Color(0xFFF9A825),
                    // Set the background color to yellow
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Center(
                              child: Text(
                                'Contact Us',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'NAME',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'jiara Martins',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'EMAIL',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'hello@reallygreatsite.com',
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'MESSAGE',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextFormField(
                                maxLines: 4,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Write your message here',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add button functionality
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5), // Adjust the value to change the border radius
                          ), // Set the background color to purple
                        ),
                        child: const Text('send the message'),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
