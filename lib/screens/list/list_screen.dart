import 'package:flutter/material.dart';
import 'package:dictionary_app/model/word_response.dart';

import '../detail/detail_screen.dart';

class ListScreen extends StatelessWidget {
  final List<WordResponse> words;

  ListScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text(
                  "${index + 1}. ${words[index].word}",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(words[index]),
                    ),
                  );
                },
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.white,
              ),
          itemCount: words.length),
    );
  }
}
