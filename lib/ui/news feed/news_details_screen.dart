import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String content;
  final bool fromFav;

  const NewsDetailsScreen({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.content,
    required this.fromFav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Back",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      height: 201,
                      child: Image.network(
                        fit: BoxFit.fill,
                        imageUrl,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(Icons.broken_image,
                                size: 100, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                  fromFav
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 28,
                          ))
                      : SizedBox()
                ],
              ),
              SizedBox(height: 16),

              /// Title
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              /// Date
              Row(
                children: [
                  Icon(Icons.calendar_month, color: Colors.grey),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${date}",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16),

              /// Content
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
