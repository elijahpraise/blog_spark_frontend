import 'package:blog_spark/components/blog_spark_sized_box.dart';
import 'package:blog_spark/utils/blog_spark_images/image_names.dart';
import 'package:blog_spark/utils/blog_spark_routes/route_names.dart';
import 'package:blog_spark/utils/responsive_values/responsive_values.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveValue value = ResponsiveValue(context: context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Spark'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlogSparkSizedBox(height: 120),
          CarouselSlider(
            options: CarouselOptions(
              height: value.height(550.0),
              aspectRatio: 16 / 5,
              autoPlay: true,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              pageSnapping: false,
            ),
            items: [
              {
                "text": 'Welcome to Blog Spark',
                "image": BlogSparkImages.slide1
              },
              {
                "text": 'Find your inspiration',
                "image": BlogSparkImages.slide2
              },
              {
                "text": 'Create and share your own content',
                "image": BlogSparkImages.slide3
              }
            ].map((item) {
              String text = item["text"]!;
              String image = item["image"]!;
              String imagePath = "assets/pictures/$image.png";
              print(imagePath);
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlogSparkSizedBox(
                        height: 450,
                        width: 450,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(imagePath)))),
                      ),
                      BlogSparkSizedBox(height: 16),
                      Text(
                        text,
                        style: TextStyle(fontSize: value.fontSize(30.0)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: BlogSparkSizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(BlogSparkRoutes.signUp),
                child: Text('Get started'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
