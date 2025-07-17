import 'package:flutter/material.dart';
import '../config/app_constants.dart';

class VegetablesScreen extends StatefulWidget {
  const VegetablesScreen({super.key});

  @override
  State<VegetablesScreen> createState() => _VegetablesScreenState();
}

class _VegetablesScreenState extends State<VegetablesScreen> {
  final List<Map<String, dynamic>> _vegetableProducts = [
    {
      'name': 'Ahos',
      'price': '₱80/kg',
      'image': 'assets/Product Images/Product Images/bangus.jpg',
    },
    {
      'name': 'Alugbati',
      'price': '₱60/kg',
      'image': 'assets/Product Images/Product Images/Danggit.JPG',
    },
    {
      'name': 'Ampalaya',
      'price': '₱70/kg',
      'image': 'assets/Product Images/Product Images/Mamsa.jpg',
    },
    {
      'name': 'Atzal',
      'price': '₱90/kg',
      'image': 'assets/Product Images/Product Images/Rumpi.jpg',
    },
    {
      'name': 'Bagudo Beans',
      'price': '₱75/kg',
      'image': 'assets/Product Images/Product Images/Sangi.jpg',
    },
    {
      'name': 'Lemonsito',
      'price': '₱100/kg',
      'image': 'assets/Product Images/Product Images/Tamarong.jpg',
    },
    {
      'name': 'Luy-a',
      'price': '₱120/kg',
      'image': 'assets/Product Images/Product Images/Altasik.jpg',
    },
    {
      'name': 'Okra',
      'price': '₱65/kg',
      'image': 'assets/Product Images/Product Images/Anduhaw.jpg',
    },
    {
      'name': 'Patatas',
      'price': '₱85/kg',
      'image': 'assets/Product Images/Product Images/yellow-fin.jpg',
    },
    {
      'name': 'Pechay',
      'price': '₱55/kg',
      'image': 'assets/Product Images/Product Images/bangus.jpg',
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
        title: const Text('Vegetables'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // TODO: Show menu/sidebar
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // TODO: Navigate to cart
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        itemCount: _vegetableProducts.length,
        itemBuilder: (context, index) {
          final product = _vegetableProducts[index];
          return _buildProductCard(product);
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
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
              product['image']!,
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
                Text(
                  product['name']!,
                  style: AppConstants.subheadingStyle,
                ),
                const SizedBox(height: 4),
                Text(
                  product['price']!,
                  style: AppConstants.priceStyle,
                ),
              ],
            ),
          ),
          
          // Quantity and Add to Cart
          Column(
            children: [
              // Quantity Input
              Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppConstants.borderColor),
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                ),
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    hintText: '1',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              
              // Add to Cart Button
              SizedBox(
                width: 100,
                child: ElevatedButton(
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
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                    ),
                  ),
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 