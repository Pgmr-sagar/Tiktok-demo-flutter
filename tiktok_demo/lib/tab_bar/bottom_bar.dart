import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/view/video_list.dart';
import 'package:tiktok_demo/tab_bar/bottom_bar_demo_page.dart';
import 'package:tiktok_demo/tab_bar/tab_bar_cubit.dart';

class BottomTabBar extends StatelessWidget {
  BottomTabBar({super.key});

  final List<Widget> _pages = <Widget>[
    VideoList(),
    const BottomBarDemoPage(icon: Icons.group),
    const BottomBarDemoPage(icon: Icons.add_box_rounded),
    const BottomBarDemoPage(icon: Icons.chat),
    const BottomBarDemoPage(icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabBarCubit(0),
      child: BlocBuilder<TabBarCubit, int>(builder: (context, selectedIndex) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: IndexedStack(
            index: selectedIndex,
            children: _pages,
          ),
          extendBody: true,
          bottomNavigationBar: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, 
              backgroundColor: Colors.black,
              iconSize: 24,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: 'Friends',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_rounded),
                  label: 'Add',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Inbox',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: selectedIndex,
              onTap: (index) => context.read<TabBarCubit>().onItemTapped(index),
            ),
          ),
        );
      }),
    );
  }
}
