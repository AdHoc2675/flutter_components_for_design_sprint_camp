import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '플러터 데모 홈 페이지'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentPage = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.card_membership),
                    title: Text('This is a card'),
                    subtitle: Text('but it is not a trump card or something'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('ok'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('nah'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.amber[700],
                child: const Text('I'),
              ),
              label: const Text('wanna'),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                child: const Text('h'),
              ),
              label: const Text('ave some'),
              labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
              backgroundColor: Colors.orange,
              elevation: 20,
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                child: const Text('P'),
              ),
              label: const Text('otato Chips'),
              labelStyle: TextStyle(fontSize: 25, color: Colors.green),
              shadowColor: Colors.amber,
              elevation: 10,
              side: BorderSide(width: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
            TextButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('This is a typical dialog.'),
                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Close',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.cyan,
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(30))),
                ),
              ),
              child: const Text('Show Dialog'),
            ),
            TextButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('AlertDialog Title'),
                  content: const Text('AlertDialog description'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: const Text('Show Dialog'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyNavigationBar(context),
    );
  }

  Widget MyNavigationBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyOutlinedButtonInBottomNavBar(
            0,
            'Home',
          ),
          MyOutlinedButtonInBottomNavBar(
            1,
            'Profile',
          ),
          MyOutlinedButtonInBottomNavBar(
            2,
            'Leaderboard',
          ),
        ],
      ),
    );
  }

  Icon getIcons(String iconName, int buttonIndex) {
    if (iconName == 'Home') {
      if (currentPage == buttonIndex) {
        return const Icon(Icons.home);
      } else {
        return const Icon(
          Icons.home,
          color: Colors.black,
        );
      }
    } else if (iconName == 'Profile') {
      if (currentPage == buttonIndex) {
        return const Icon(Icons.account_circle);
      } else {
        return const Icon(
          Icons.account_circle,
          color: Colors.black,
        );
      }
    } else if (iconName == 'Leaderboard') {
      if (currentPage == buttonIndex) {
        return const Icon(Icons.leaderboard);
      } else {
        return const Icon(
          Icons.leaderboard,
          color: Colors.black,
        );
      }
    } else {
      return const Icon(Icons.home);
    }
  }

  Widget MyOutlinedButtonInBottomNavBar(
    int buttonIndex,
    String name,
  ) {
    return Container(
      width: 130,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 0, color: Colors.white),
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            setState(() {
              currentPage = buttonIndex;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getIcons(name, buttonIndex),
              currentPage == buttonIndex
                  ? Text(name,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          color: Colors.blue))
                  : Text(name,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          color: Colors.black))
            ],
          )),
    );
  }
}
