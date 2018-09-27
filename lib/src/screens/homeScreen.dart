import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home Screen'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      body: new Container(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final _something = [];

  final _recentSearch = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    //ações para a appbar
    return [
      IconButton(
        icon: new Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icone na esquerda da appbar
    return IconButton(
      icon: new AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // //mostrar algum resultado baseado na seleção
    return Center(
      child: new Container(
        height: 100.0,
        width: 100.0,
        child: new Card(
          color: Colors.red,
          child: new Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //mostrar quando alguém procura por alguma coisa
    final suggestionList = query.isEmpty
        ? _something
        : _recentSearch.where((p) => p.starsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => new ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.location_city),
            title: new RichText(
              text: new TextSpan(
                  text: suggestionList[index].substring(
                      0, query.length), //Pegando a primeira letra da String
                  style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold, //E deixando ela em negrito
                  ),
                  children: [
                    new TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: new TextStyle(color: Colors.grey),
                    )
                  ]),
            ),
          ),
      itemCount: _something.length,
    );
  }
}
