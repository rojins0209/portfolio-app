import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'screens/home_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/contact_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ProjectsScreen(),
    SkillsScreen(),
    ContactScreen(),
  ];

  // Function to navigate smoothly with animation
  void _onDestinationSelected(int index) {
    if (_selectedIndex == index) return; // Prevent reloading the same page

    Widget screen;
    switch (index) {
      case 0:
        screen = HomeScreen();
        break;
      case 1:
        screen = ProjectsScreen();
        break;
      case 2:
        screen = SkillsScreen();
        break;
      case 3:
        screen = ContactScreen();
        break;
      default:
        screen = HomeScreen();
    }

    // Smooth Page Transition
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0); // Slide from right to left
          var end = Offset.zero;
          var curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );

    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to download the resume PDF
  Future<void> _downloadResume() async {
    try {
      const String url = 'https://your-resume-link.com/resume.pdf'; // Replace with actual resume URL
      final Directory? directory = await getExternalStorageDirectory();
      if (directory == null) {
        throw Exception("Storage directory not found.");
      }

      final String filePath = '${directory.path}/Resume.pdf';
      Dio dio = Dio();

      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            double progress = received / total * 100;
            print('Downloading: ${progress.toStringAsFixed(0)}%');
          }
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Resume downloaded to ${directory.path}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.work), label: 'Projects'),
          NavigationDestination(icon: Icon(Icons.code), label: 'Skills'),
          NavigationDestination(icon: Icon(Icons.contact_mail), label: 'Contact'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _downloadResume,
        icon: Icon(Icons.download),
        label: Text('Download Resume'),
        backgroundColor: ColorScheme.dark().primary,
      ),
    );
  }
}
