import 'package:flutter/material.dart';
import 'package:sample/LawWordListDetail.dart';
import 'list_data.dart';

class SearchListWidget extends StatefulWidget {
  const SearchListWidget({super.key});

  @override
  _SearchListWidgetState createState() => _SearchListWidgetState();
}

enum SortOrder {
  listup,
  listdown,
}

class _SearchListWidgetState extends State<SearchListWidget> {
  List<String> sortedItems = [];
  List<String> sortedTjfauds = [];

  String searchText = '';
  SortOrder sortOrder = SortOrder.listup;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (sortOrder == SortOrder.listup) {
                      sortOrder = SortOrder.listdown;
                    } else {
                      sortOrder = SortOrder.listup;
                    }
                    _sortList();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    int.parse("0xFFFFD65A"),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      sortOrder == SortOrder.listup
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                    ),
                    Text(
                      sortOrder == SortOrder.listup ? '오름차순' : '내림차순',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              if (searchText.isEmpty ||
                  sortedItems[index]
                      .toLowerCase()
                      .contains(searchText.toLowerCase())) {
                return GestureDetector(
                  onTap: () {
                    _showItemDescription(
                        context,
                        sortedItems[index],
                        sortedTjfauds[index],
                        index,
                        sortedItems,
                        sortedTjfauds);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(int.parse("0xFFFFD65A")),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(
                              0, 4), // changes the position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      sortedItems[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _sortList();
  }

  void _sortList() {
    sortedItems = List.from(items);
    sortedTjfauds = List.from(itemTjfauds);

    if (sortOrder == SortOrder.listup) {
      sortedItems.sort();
    } else {
      sortedItems.sort((a, b) => b.compareTo(a));
    }
  }
}

void _showItemDescription(
  BuildContext context,
  String stringItems,
  String stringTjfauds,
  int index,
  List<String> sortedItems,
  List<String> sortedTjfauds,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Itempage(
        stringItems: stringItems,
        stringTjfauds: stringTjfauds,
        sortedItems: sortedItems,
        sortedTjfauds: sortedTjfauds,
      ),
    ),
  );
}
