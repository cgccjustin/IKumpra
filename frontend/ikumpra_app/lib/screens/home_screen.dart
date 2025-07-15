import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../config/app_constants.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Bangus',
      'price': '₱150/kg',
      'image': 'assets/Product Images/Product Images/bangus.jpg',
      'category': 'Fish',
    },
    {
      'name': 'Danggit',
      'price': '₱200/kg',
      'image': 'assets/Product Images/Product Images/Danggit.JPG',
      'category': 'Fish',
    },
    {
      'name': 'Dried Pusit',
      'price': '₱300/kg',
      'image': 'assets/Product Images/Product Images/Dried Pusit.jpg',
      'category': 'Fish',
    },
    {
      'name': 'Mamsa',
      'price': '₱180/kg',
      'image': 'assets/Product Images/Product Images/Mamsa.jpg',
      'category': 'Fish',
    },
    {
      'name': 'Molmol',
      'price': '₱120/kg',
      'image': 'assets/Product Images/Product Images/Molmol.jpg',
      'category': 'Fish',
    },
    {
      'name': 'Pasayan',
      'price': '₱250/kg',
      'image': 'assets/Product Images/Product Images/Pasayan.jpg',
      'category': 'Fish',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Row(
                children: [
                                      Image.asset(
                      'assets/iKumpra-logo-final.png',
                    height: 40,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.shopping_basket, size: 40),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'iKumpra',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppConstants.primaryColor,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // TODO: Show notifications
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            
            // Hero Banner
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(AppConstants.paddingMedium),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                boxShadow: AppConstants.cardShadow,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                                        child: Image.asset(
                          'assets/Posters/ikumpra-wedeliver-poster.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppConstants.primaryColor,
                    child: const Center(
                      child: Icon(
                        Icons.delivery_dining,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
              child: Text(
                'Categories',
                style: AppConstants.headingStyle,
              ),
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
                children: [
                  _buildCategoryCard('Fish', Icons.set_meal, AppConstants.primaryColor),
                  _buildCategoryCard('Vegetables', Icons.eco, const Color(0xFF4CAF50)),
                  _buildCategoryCard('Fruits', Icons.apple, const Color(0xFFFF9800)),
                  _buildCategoryCard('Meat', Icons.restaurant, const Color(0xFFF44336)),
                ],
              ),
            ),

            const SizedBox(height: AppConstants.paddingLarge),

            // Products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fresh Products',
                    style: AppConstants.headingStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to all products
                    },
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingMedium),

            // Product Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
              child: MasonryGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: AppConstants.paddingMedium,
                crossAxisSpacing: AppConstants.paddingMedium,
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return _buildProductCard(product);
                },
              ),
            ),
            const SizedBox(height: AppConstants.paddingLarge),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: AppConstants.cardShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppConstants.captionStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: AppConstants.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppConstants.borderRadiusMedium),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                product['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 48),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: AppConstants.subheadingStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  product['price'],
                  style: AppConstants.bodyStyle.copyWith(
                    color: AppConstants.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add to cart
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product['name']} added to cart!'),
                          backgroundColor: AppConstants.successColor,
                        ),
                      );
                    },
                    child: const Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 