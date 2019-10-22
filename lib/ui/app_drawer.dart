import 'package:flutter/material.dart';
import 'package:flutter_bloc_library/ui/user_search_view.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),
          _buildDrawerItem(Icons.search, 'Users search',
              () => _navigateTo(context, UserSearchView())),
//          _buildDrawerItem(Icons.flag, 'Countries',
//              () => _navigateTo(context, CountriesView())),
//          _buildDrawerItem(Icons.favorite_border, 'Something',
//              () => _navigateTo(context, SomethingView())),
//          _buildDrawerItem(Icons.favorite_border, 'Something2',
//              () => _navigateTo(context, Something2View())),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      child: Text('My Menu'),
      decoration: BoxDecoration(color: Colors.yellow),
    );
  }

  Widget _buildDrawerItem(
      IconData icon, String title, GestureTapCallback onTap) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(title),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
