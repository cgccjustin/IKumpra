import 'package:flutter/material.dart';
import '../config/app_constants.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, dynamic>> _favorites = [
    {
      'name': 'Fresh Bangus',
      'price': 150.0,
      'image': 'assets/Product Images/Product Images/bangus.jpg',
      'category': 'Fish',
    },
    {
      'name': 'Fresh Danggit',
      'price': 200.0,
      'image': 'assets/Product Images/Product Images/Danggit.JPG',
      'category': 'Fish',
    },
    {
      'name': 'Fresh Mamsa',
      'price': 180.0,
      'image': 'assets/Product Images/Product Images/Mamsa.jpg',
      'category': 'Fish',
    },
    {
      'name': 'Ahos',
      'price': 80.0,
      'image': 'assets/Product Images/Product Images/bangus.jpg',
      'category': 'Vegetables',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Favorites'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (_favorites.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              onPressed: () {
                _showClearFavoritesDialog();
              },
            ),
        ],
      ),
      body: _favorites.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: AppConstants.paddingMedium),
                  Text(
                    'No favorites yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: AppConstants.paddingSmall),
                  Text(
                    'Add products to your favorites to see them here',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              itemCount: _favorites.length,
              itemBuilder: (context, index) {
                final product = _favorites[index];
                return _buildFavoriteCard(product, index);
              },
            ),
    );
  }

  Widget _buildFavoriteCard(Map<String, dynamic> product, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        border: Border.all(color: AppConstants.borderColor),
        boxShadow: AppConstants.cardShadow,
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
            child: Image.asset(
              product['image'],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80,
                height: 80,
                color: AppConstants.borderColor,
                child: const Icon(Icons.image),
              ),
            ),
          ),
          
          const SizedBox(width: AppConstants.paddingMedium),
          
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product['name'],
                        style: AppConstants.subheadingStyle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _favorites.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product['name']} removed from favorites'),
                            backgroundColor: AppConstants.errorColor,
                          ),
                        );
                      },
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      iconSize: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  product['category'],
                  style: AppConstants.captionStyle,
                ),
                const SizedBox(height: 4),
                Text(
                  '₱${product['price'].toStringAsFixed(2)}/kg',
                  style: AppConstants.priceStyle,
                ),
              ],
            ),
          ),
          
          // Add to Cart Button
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product['name']} added to cart!'),
                      backgroundColor: AppConstants.successColor,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                  ),
                ),
                child: const Text('Add to Cart'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showClearFavoritesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear Favorites'),
          content: const Text('Are you sure you want to remove all favorites?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _favorites.clear();
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('All favorites cleared'),
                    backgroundColor: AppConstants.successColor,
                  ),
                );
              },
              child: const Text('Clear All'),
            ),
          ],
        );
      },
    );
  }
} 