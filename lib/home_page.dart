import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "Y",
    "Z"
  ];

  late List<Color> colors;

  Color _colorGen() {
    int r = Random().nextInt(256);
    int g = Random().nextInt(256);
    int b = Random().nextInt(256);
    return Color.fromRGBO(r, g, b, 1);
  }

  bool tapViewAll = false;

  final ScrollController _scrollController = ScrollController();

  void _controlGridSize() {
    setState(() {
      tapViewAll = !tapViewAll;
      if (!tapViewAll) {
        // scroll to top when grid list is shrinked.
        _scrollController.animateTo(0.0,
          duration: const Duration(seconds: 1), curve: Curves.easeInBack);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    colors = List.generate(letters.length, (index) => _colorGen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Demonstrating Click to View all",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildGridItems(),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                    onPressed: _controlGridSize,
                    child: Text(
                      tapViewAll ? "Close all" : "View all",
                      style: const TextStyle(fontSize: 20),
                    ),
                  )
                ]),
                _buildListItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String letter, int index, bool inVList) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: colors[index]),
        child: Center(
            child: Text(letter,
                style: TextStyle(
                    fontSize: inVList ? 20 : 50, color: Colors.white))),
      ),
    );
  }

  Widget _buildGridItems() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return _buildItem(letters[index], index, false);
        },
        itemCount: tapViewAll ? letters.length : letters.length ~/ 4,  // show only 6 items in shrinked list
      ),
    );
  }

  Widget _buildListItems() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return ListTile(
          leading: _buildItem(letters[index], index, true),
          title: Text(letters[index]),
          subtitle: const Text("subtitle"),
        );
      }),
      itemCount: letters.length,
    );
  }
}
