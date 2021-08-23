import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

/* 
Widget stateless tidak dapat diubah, artinya 
propertinya tidak dapat diubah—semua nilai bersifat final.
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // hapus wordPair karena telah dibuat kelas StatefulWidget
    // final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        // body: const Center(
        //   child: Text('Hello World'),
        // ),
        body: Center(
          // hapus wordPair karena telah dibuat kelas StatefulWidget
          // child: Text(wordPair.asSnakeCase),
          child: RandomWords(),
        ),
      ),
    );
  }
}

/*
Widget stateful mempertahankan status yang mungkin 
berubah selama masa pakai widget. keyword membuat stful
*/
class RandomWords extends StatefulWidget {
  //const RandomWords({ Key? key }) : super(key: key);
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
