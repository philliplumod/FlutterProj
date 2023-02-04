import 'package:flutter/material.dart';

class QuoteApp extends StatefulWidget {
  const QuoteApp({super.key});

  @override
  State<QuoteApp> createState() => _QuoteAppState();
}

class _QuoteAppState extends State<QuoteApp> {
  int _index = 0;
  List quotes = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
    "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
    "Hodor. Hodor hodor, hodor. Hodor hodor hodor hodor hodor. Hodor. Hodor! Hodor hodor, hodor; hodor hodor hodor.",
    "Hodor. Hodor hodor; hodor hodor - hodor, hodor, hodor hodor. Hodor, hodor. Hodor. Hodor, hodor hodor hodor; hodor hodor; hodor hodor hodor! Hodor hodor HODOR! Hodor hodor... Hodor hodor hodor...",
    "Lorem Ipsum is the single greatest threat. We are not - we are not keeping up with other websites.",
    "Lorem Ipsum best not make any more threats to your website. It will be met with fire and fury like the world has never seen.",
    "Does everybody know that pig named Lorem Ipsum? An ‘extremely credible source’ has called my office and told me that Barack Obama’s placeholder text is a fraud.",
    "Lorem ipsum dolor amet mustache knausgaard +1, blue bottle waistcoat tbh semiotics artisan synth stumptown gastropub cornhole celiac swag.",
    "Brunch raclette vexillologist post-ironic glossier ennui XOXO mlkshk godard pour-over blog tumblr humblebrag. Blue bottle put a bird on it twee prism biodiesel brooklyn. Blue bottle ennui tbh succulents.",
    "Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis.",
    "Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                  width: 350,
                  height: 200,
                  margin: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      quotes[_index % quotes.length],
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ), //loop
          const Divider(
            thickness: 2.3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: TextButton.icon(
              onPressed: _showQoute,
              icon: const Icon(Icons.wb_sunny),
              label: const Text(
                'Ipsum!',
                style: TextStyle(fontSize: 15),
              ),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.red.shade900,
                  backgroundColor: Colors.black),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _showQoute() {
    // increment index by 1
    setState(() {
      _index += 1;
    });
  }
}
