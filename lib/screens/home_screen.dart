import 'package:flutter/material.dart';
import '../widgets/posts_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpClienteDemo"),
      ),
      body: PostsWidget(),
    );
  }
}
