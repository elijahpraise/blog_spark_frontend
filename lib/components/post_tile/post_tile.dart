import 'package:blog_spark/components/blog_spark_sized_box.dart';
import 'package:blog_spark/utils/blog_spark_images/image_names.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(ImageGetter.getImage(BlogSparkImages.slide1)),
              )),
        ),
        BlogSparkSizedBox(height: 16),
        Text(
          "Category",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontFamily: "Lato"),
        ),
        BlogSparkSizedBox(height: 4),
        Text("Title"),
        BlogSparkSizedBox(height: 16),
        Text(
          "Author",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        BlogSparkSizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Date"),
                SizedBox(
                  width: 8,
                ),
                Text("Reading time"),
              ],
            ),
            Row(
              children: [
                TileAction(
                  iconData: Icons.favorite_outline,
                  onTap: () {},
                  info: "32",
                ),
                SizedBox(
                  width: 16,
                ),
                TileAction(
                  iconData: Icons.mode_comment_outlined,
                  onTap: () {},
                  info: "24",
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class TileAction extends StatelessWidget {
  const TileAction(
      {super.key, this.onTap, required this.iconData, required this.info});
  final Function()? onTap;
  final IconData iconData;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Icon(
            iconData,
            color: Color(0xFF4B53BC),
            size: 20,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          info,
          style: TextStyle(
            fontFamily: "Mv Boli",
          ),
        ),
      ],
    );
  }
}
