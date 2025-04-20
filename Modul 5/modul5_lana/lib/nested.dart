import 'package:flutter/material.dart';

class NestedExample extends StatelessWidget {
  const NestedExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Style umum untuk text deskripsi
    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    // Judul dan Subjudul
    const titleText = Text(
      'Strawberry Pavlova',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
        fontSize: 30,
      ),
    );

    const subTitle = Padding(
      padding: EdgeInsets.only(top: 8),
      child: Text(
        'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. '
        'Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
        style: TextStyle(fontFamily: 'Georgia', fontSize: 16),
      ),
    );

    // Row bintang
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        const Icon(Icons.star, color: Colors.black),
        const Icon(Icons.star, color: Colors.black),
      ],
    );

    // Ratings
    final ratings = Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );

    // Icon-info (PREP, COOK, FEEDS)
    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                const Text('PREP:'),
                const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                const Text('COOK:'),
                const Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                const Text('FEEDS:'),
                const Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    // Kolom kiri
    final leftColumn = Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titleText, subTitle, ratings, iconList],
      ),
    );

    // Placeholder untuk gambar utama
    final mainImage = Container(
      color: Colors.grey[300],
      child: const Center(
        child: Text(
          "Pavlova Image",
          style: TextStyle(fontSize: 24, color: Colors.black54),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Resep Makanan')),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 440, child: leftColumn),
                Expanded(child: mainImage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
