import 'package:flutter/material.dart';
import '../config/app_constants.dart';

class FishScreen extends StatefulWidget {
  const FishScreen({super.key});

  @override
  State<FishScreen> createState() => _FishScreenState();
}

class _FishScreenState extends State<FishScreen> {
  final List<Map<String, dynamic>> _fishProducts = [
    {
      'name': 'Alvantasik',
      'price': '₱300/kg',
      'image': 'assets/Product Images/Product Images/Altasik.jpg',
    },
    {
      'name': 'Anduhaw',
      'price': '₱220/kg',
      'image': 'assets/Product Images/Product Images/Anduhaw.jpg',
    },
    {
      'name': 'Bangus',
      'price': '₱150/kg',
      'image': 'assets/Product Images/Product Images/bangus.jpg',
    },
    {
      'name': 'Danggit',
      'price': '₱200/kg',
      'image': 'assets/Product Images/Product Images/Danggit.JPG',
    },
    {
      'name': 'Katambak',
      'price': '₱180/kg',
      'image': 'assets/Product Images/Product Images/Mamsa.jpg',
    },
    {
      'name': 'Yellow Fin tuna',
      'price': '₱250/kg',
      'image': 'assets/Product Images/Product Images/yellow-fin.jpg',
    },
    {
      'name': 'Rumpi',
      'price': '₱120/kg',
      'image': 'assets/Product Images/Product Images/Rumpi.jpg',
    },
    {
      'name': 'Salid',
      'price': '₱160/kg',
      'image': 'assets/Product Images/Product Images/Sangi.jpg',
    },
    {
      'name': 'Tamarang',
      'price': '₱140/kg',
      'image': 'assets/Product Images/Product Images/Tamarong.jpg',
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
        title: const Text('Fish'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // TODO: Show menu/sidebar
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              // TODO: Navigate to next screen
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        itemCount: _fishProducts.length,
        itemBuilder: (context, index) {
          final product = _fishProducts[index];
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