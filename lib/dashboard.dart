import 'package:flutter/material.dart';
import 'package:tugas_2_124220032/Home.dart';
import 'package:tugas_2_124220032/Kalkulator.dart';
import 'package:tugas_2_124220032/account.dart';

class Dashboard extends StatefulWidget {
  final String username;

  const Dashboard({Key? key, required this.username}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      const Home(),
      Kalkulator(),
      Akun(username: widget.username),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: 'Kalkulator'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Akun'),
        ],
      ),
    );
  }
}
