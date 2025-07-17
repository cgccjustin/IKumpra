import 'package:flutter/material.dart';
import '../config/app_constants.dart';
import 'home_screen.dart';
import 'chat_screen.dart';
import 'fish_screen.dart';
import 'vegetables_screen.dart';
import 'cart_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const HomeScreen(),
    const FishScreen(),
    const VegetablesScreen(),
    const CartScreen(),
    const ChatScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          // Handle back button press
          if (_currentIndex != 0) {
            setState(() {
              _currentIndex = 0;
            });
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppConstants.backgroundColor,
        body: _screens.isNotEmpty && _currentIndex < _screens.length
          ? PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _screens,
              physics: const NeverScrollableScrollPhysics(), // Prevent swipe navigation
            )
          : Container(
              color: AppConstants.backgroundColor,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppConstants.primaryColor),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppConstants.textPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: AppConstants.primaryColor,
            boxShadow: [
              BoxShadow(
                color: Color(0x1A000000),
                offset: Offset(0, -2),
                blurRadius: 4,
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            backgroundColor: AppConstants.primaryColor,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.set_meal),
                label: 'Fish',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.eco),
                label: 'Vegetables',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'My Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 