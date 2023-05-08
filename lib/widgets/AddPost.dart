import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/Post.dart';

class AddPost extends StatefulWidget {
  AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _AddPostState extends State<AddPost> {
  final myControllerTitle = TextEditingController(),
      myControllerPost = TextEditingController();

  @override
  void dispose() {
    myControllerTitle.dispose();
    myControllerPost.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text('Dodaj Post'),
        ),
        body: Column(children: [
          Column(
            children: <Widget>[
              TextField(
                controller: myControllerTitle,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: Center(
                      child: Text("Tytuł Posta"),
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: myControllerPost,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  label: Center(
                    child: Text("Treść Posta"),
                  ),
                ),
                minLines: 10,
                maxLines: 25,
              ),
              const SizedBox(
                height: 16,
              ),
              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  Post.createPost(
                      myControllerTitle.text, myControllerPost.text);
                  Fluttertoast.showToast(
                      msg: "Dodano Post",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                child: const Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            ],
          )
        ]));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
