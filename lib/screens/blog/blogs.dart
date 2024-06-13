import 'package:flutter/material.dart';

import 'blogdetails.dart';
import 'data.dart';

class AllBlogs extends StatefulWidget {
  const AllBlogs({super.key});

  @override
  State<AllBlogs> createState() => _AllBlogsState();
}

class _AllBlogsState extends State<AllBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Blogs'),
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (_, i) {
          Map<String, dynamic> blog = blogs[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => BlogDetails(blog: blog)));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(blog['image']),
                    Text(
                      blog['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
