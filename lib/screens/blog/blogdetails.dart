import 'package:flutter/material.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key, required this.blog});
  final blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog['title']),
        titleSpacing: 0,
      ),
      body: ListView(
        children: [
          Image.network(blog['image']),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  blog['title'] + '\n',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(blog['desc']),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
