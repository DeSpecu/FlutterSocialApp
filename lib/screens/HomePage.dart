import 'package:flutter/material.dart';

import '../widgets/AddPost.dart';
import 'AlbumsScreen.dart';
import 'PostsScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  final _bottomBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.list_sharp),
        label: "Posty",
        backgroundColor: Colors.pink),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Dodaj Post'),
    BottomNavigationBarItem(
        icon: Icon(Icons.photo_album_outlined), label: 'Albumy')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            if (newIndex == 1)
              _selectedIndex = 2;
            else
              _selectedIndex = newIndex;
          });
        },
        children: [PostsScreen(), AlbumsScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _bottomBarItems,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            if (index == 0 || index == 2)
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            else
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddPost()));
          }),
    );
  }
}
