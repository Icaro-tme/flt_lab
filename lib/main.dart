// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/components/header_comp.dart';
import '/routes/app_routes.dart';
import 'components/sidebar_comp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProjLab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.home,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  bool _isSidebarExpanded = true;

  void _toggleSidebar() {
    setState(() {
      _isSidebarExpanded = !_isSidebarExpanded;
    });
  }

  void _onItemSelected(String routeName) {
    _navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ProjLab'),
      //   leading: IconButton(
      //     icon: Icon(Icons.menu),
      //     onPressed: () {
      //       setState(() {
      //         _isSidebarExpanded = !_isSidebarExpanded;
      //       });
      //     },
      //   ),
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HeaderComp(
          isSidebarExpanded: _isSidebarExpanded,
          toggleSidebar: _toggleSidebar,
        ),
      ),
      body: Row(
        children: [
          SidebarComp(
            onItemSelected: _onItemSelected,
            isExpanded: _isSidebarExpanded,
          ),
          Expanded(
            child: Navigator(
              key: _navigatorKey,
              initialRoute: AppRoutes.home,
              onGenerateRoute: AppRoutes.generateRoute,
            ),
          ),
        ],
      ),
    );
  }
}
