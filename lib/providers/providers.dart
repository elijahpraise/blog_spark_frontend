import 'package:blog_spark/providers/comment_provider.dart';
import 'package:blog_spark/providers/post_provider.dart';
import 'package:blog_spark/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => UserProvider()),
  ChangeNotifierProvider(create: (_) => PostProvider()),
  ChangeNotifierProvider(create: (_) => CommentProvider()),
];
