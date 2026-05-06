import 'package:dalil_syria/features/attractions/presentation/views/attractions_view.dart';
import 'package:dalil_syria/features/booking/presentation/views/my_bookings_view.dart';
import 'package:dalil_syria/features/favorite/presentation/views/favorites_view.dart';
import 'package:dalil_syria/features/profile/presentation/views/profile_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../home/presentation/views/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const AttractionsView(),
    const MyBookingsView(),
    const FavoritesView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0D6EFD),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "nav_home".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: "nav_attractions".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            activeIcon: Icon(Icons.date_range_outlined),
            label: "nav_bookings".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: "nav_favorites".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "nav_profile".tr(),
          ),
        ],
      ),
    );
  }
}
