import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          title: Text("Profile"),
        ),
      ]),
      tabBuilder: (context, i) {
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: (i == 0) ? Text("Home") : Text("Profile"),
            ),
            child: Center(
              child: CupertinoButton(
                child: Text(
                  "This is tab #$i",
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .actionTextStyle
                      .copyWith(fontSize: 32),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return DetailScreen(i == 0 ? "Home" : "Profile");
                    }),
                  );
                },
              ),
            ),
          );
        });
      },
    );
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen(this.topic);
  final String topic;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Details"),
      ),
      child: Center(
        child: Padding(padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min ,
            children: [
       CupertinoButton(
         child: Text("Launch action sheet"),
         onPressed: () {
           showCupertinoModalPopup<int>(
             context: context,
             builder: (context) {
             return CupertinoActionSheet(
               title: Text("Some choices"),
               actions: [
                 CupertinoActionSheetAction(
                   child: Text("One!"),
                   onPressed: () {
                     Navigator.pop(context, 1);
                   },
                   isDefaultAction: true,
                 ),
                 CupertinoActionSheetAction(
                   child: Text("Two!"),
                   onPressed: () {
                     Navigator.pop(context, 2);
                   },
                 ),
                 CupertinoActionSheetAction(
                   child: Text("Three!"),
                   onPressed: () {
                     Navigator.pop(context, 3);
                   },
                 ),
               ],
             );
           },
           );
         },
       )
      ])),
      ),
    );
  }
}
