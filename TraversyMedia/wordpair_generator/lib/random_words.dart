import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPairs>[];
  final _savedWordPairs = Set<WordPairs>[];
  
  Widget _buildList() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      }
    );
  }

  Widget _buildRow(WordPair wPair) {
    final _alreadySaved = _savedWordPairs.contains(wPair);
    return ListTile(
      title: Text(
        wPair.asPascalCase,
        style: TextStyle(
          fontSize: 18.0
        )
      ),
      trailing: Icon(
        _alreadySaved ? Icons.favorite : Icons.favorite_border, 
        color: _alreadySaved ? Colors.red : null
      ),
      onTap: () {
        setState(() {
          if (_alreadySaved){
            _savedWordPairs.remove(wPair);
          } else {
            _savedWordPairs.add(wPair);
          }
        });
      }
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _savedWordPairs.map(
            (WordPair wPair) {
              return ListTile(
                title: Text(
                  wPair.asPascalCase, 
                  style: TextStyle(fontSize: 16.0)
                )
              );
            }
          );

          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved WordPairs'),
              body: ListView(
                children: divided
              )
            )
          )
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator'),
        actions: <Widgets>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ]
      ),
      child: _buildList(),
    );
  }
}
