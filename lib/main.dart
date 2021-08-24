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
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      title: 'Startup Name Generator',
      home: RandomWords(),
      debugShowCheckedModeBanner: false,
      // title: 'Welcome to Flutter',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Welcome to Flutter'),
      //   ),
      //   // body: const Center(
      //   //   child: Text('Hello World'),
      //   // ),
      //   body: Center(
      //     // hapus wordPair karena telah dibuat kelas StatefulWidget
      //     // child: Text(wordPair.asSnakeCase),
      //     child: RandomWords(),
      //   ),
      // ),
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
  // membuat variable untuk membuat list wordPair Random
  final suggestions = <WordPair>[]; // list
  final biggerFont = const TextStyle(fontSize: 18.0);
  final saved = <WordPair>{}; // set, anti duplikat

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(18.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= suggestions.length) {
            suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return buildRow(suggestions[index]);
        });
  }

  Widget buildRow(WordPair pair) {
    final alreadySaved = saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            saved.remove(pair);
          } else {
            saved.add(pair);
          }
        });
      },
    );
  }
}
