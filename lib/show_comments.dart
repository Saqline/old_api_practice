import 'package:api_practice/helper/comments_helper.dart';
import 'package:api_practice/model/comments.dart';
import 'package:flutter/material.dart';

class ShowComments extends StatefulWidget {
  @override
  State<ShowComments> createState() => _ShowCommentsState();
}

class _ShowCommentsState extends State<ShowComments> {
  bool isLoaded = false;

  List<Welcome>? comments;

  getComments() async {
    comments = await CommentHelper().getComment();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: comments!.length,
          itemBuilder: ( _,index) {
          return Card(
            elevation: 5,
            child: ListTile(
              title: Text(comments![index].email),
            ),
          );
        }),
      ),
    );
  }
}
