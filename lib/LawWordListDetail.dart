import 'package:flutter/material.dart';
import 'bottomBar.dart';
import 'list_data.dart';
import 'item.dart';

class Itempage extends StatefulWidget {
  final String stringItems;
  final String stringTjfauds;
  final List<String> sortedItems;
  final List<String> sortedTjfauds;

  const Itempage({
    Key? key,
    required this.stringItems,
    required this.stringTjfauds,
    required this.sortedItems,
    required this.sortedTjfauds,
  }) : super(key: key);

  @override
  _ItempageState createState() => _ItempageState();
}

class _ItempageState extends State<Itempage> {
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    int tjfaud = items.indexOf(widget.stringItems);
    String searchText = '';
    int detailIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          //widget.currentItems,
          "법률 용어 리스트",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(int.parse("0xFFFFD65A")),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                labelText: '검색',
                hintText: '검색어를 입력하세요',
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(int.parse("0xFFFFD65A")),
                ),
                labelStyle: const TextStyle(color: Colors.black),
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(int.parse("0xFFFFD65A"))),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(int.parse("0xFFFFD65A"))),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (detailIndex > 0) {
                      setState(() {
                        detailIndex--;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  widget.sortedItems[detailIndex],
                ),
                IconButton(
                  onPressed: () {
                    if (detailIndex < widget.sortedItems.length - 1) {
                      setState(() {
                        detailIndex++;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          Text(
            itemTjfauds[tjfaud],
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(onTabSelected: (index) {
        setState(
          () {
            //_currentIndex = index;
          },
        );
      }),
    );
  }
}
