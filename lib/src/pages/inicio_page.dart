import 'package:flutter/material.dart';
import 'package:food_app/src/pages/favoritos_page.dart';
import 'package:food_app/src/pages/home_page.dart';
import 'package:food_app/src/utils/app_colors.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [HomePage(), FavoritosPage()];

    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        elevation: 10,
        backgroundColor: AppColors.headerColor,
        selectedItemColor: AppColors.orangeColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        ],
      ),
    );
  }
}
