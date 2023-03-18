import 'package:blog_spark/components/blog_spark_sized_box.dart';
import 'package:blog_spark/utils/blog_spark_routes/route_names.dart';
import 'package:blog_spark/utils/constants/constants.dart';
import 'package:blog_spark/utils/responsive_values/responsive_values.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ResponsiveValue value = ResponsiveValue(context: context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Spark'),
      ),
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: size.height,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              pageSnapping: false,
            ),
            items: BlogSparkConstants.slides.map((item) {
              String text = item["text"]!;
              String image = item["image"]!;
              String imagePath = "assets/pictures/$image.png";
              return Builder(
                builder: (BuildContext context) {
                  return BlogSparkSizedBox(
                    height: size.height,
                    width: size.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill, image: AssetImage(imagePath))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: value.fontSize(30.0),
                                  color: Colors.white),
                            ),
                          ),
                          BlogSparkSizedBox(height: 115),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: BlogSparkSizedBox(
                height: 52,
                width: size.width,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(BlogSparkRoutes.signUp),
                  child: Text('Get started'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
