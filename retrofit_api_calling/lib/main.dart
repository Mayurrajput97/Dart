import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_api_calling/features/posts/presentation/blocs/post_bloc.dart';
import 'package:retrofit_api_calling/features/posts/presentation/pages/posts_page.dart';
import 'service_locator.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      home: BlocProvider(
        create: (context) => di.sl<PostBloc>()..add(FetchPosts()),
        child: PostsPage(),
      ),
    );
  }
}
