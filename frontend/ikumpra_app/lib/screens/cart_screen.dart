import 'package:flutter/material.dart';
import '../config/app_constants.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Fresh Bangus',
      'price': 125.00,
      'quantity': 1,
      'image': 'assets/Product Images/Product Images/bangus.jpg',
    },
    {
      'name': 'Fresh Danggit',
      'price': 220.00,
      'quantity': 1,
      'image': 'assets/Product Images/Product Images/Danggit.JPG',
    },
    {
      'name': 'Fresh Mamsa',
      'price': 200.00,
      'quantity': 1,
      'image': 'assets/Product Images/Product Images/Mamsa.jpg',
    },
  ];

  final TextEditingController _couponController = TextEditingController();

  double get subtotal => _cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  double get shipping => 50.0; // Fixed shipping cost
  double get total => subtotal + shipping;

  void _navigateToCheckout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CheckoutScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('My Cart'),
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
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              // TODO: Clear cart
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Cart Items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return _buildCartItem(item, index);
              },
            ),
          ),
          
          // Cart Summary
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            decoration: BoxDecoration(
              color: AppConstants.cardColor,
              border: Border(
                top: BorderSide(color: AppConstants.borderColor),
              ),
            ),
            child: Column(
              children: [
                // Coupon Section
                Container(
                  padding: const EdgeInsets.all(AppConstants.paddingMedium),
                  decoration: BoxDecoration(
                    color: AppConstants.backgroundColor,
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                    border: Border.all(color: AppConstants.borderColor),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _couponController,
                          decoration: const InputDecoration(
                            hintText: 'Enter coupon code here',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Apply coupon
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Coupon applied!'),
                              backgroundColor: AppConstants.successColor,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                          ),
                        ),
                        child: const Text('Apply'),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppConstants.paddingLarge),
                
                // Cart Totals
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal', style: AppConstants.bodyStyle),
                        Text('₱${subtotal.toStringAsFixed(2)}', style: AppConstants.priceStyle),
                      ],
                    ),
                    const SizedBox(height: AppConstants.paddingSmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Shipping', style: AppConstants.bodyStyle),
                        Text('₱${shipping.toStringAsFixed(2)}', style: AppConstants.priceStyle),
                      ],
                    ),
                    const SizedBox(height: AppConstants.paddingSmall),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: const Text(
                        'Shipping costs are calculated during checkout',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppConstants.textSecondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppConstants.paddingMedium),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: AppConstants.paddingSmall),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: AppConstants.borderColor),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppConstants.textPrimaryColor,
                            ),
                          ),
                          Text(
                            '₱${total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppConstants.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: AppConstants.paddingLarge),
                
                // Checkout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _navigateToCheckout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: AppConstants.paddingLarge),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                      ),
                    ),
                    child: const Text(
                      'Proceed to Checkout',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, int index) {
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
              item['image']!,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 60,
                height: 60,
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
                  item['name']!,
                  style: AppConstants.subheadingStyle,
                ),
                const SizedBox(height: 4),
                Text(
                  '₱${item['price'].toStringAsFixed(2)}',
                  style: AppConstants.priceStyle,
                ),
              ],
            ),
          ),
          
          // Quantity
          Column(
            children: [
              Text(
                'Qty: ${item['quantity']}',
                style: AppConstants.captionStyle,
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (item['quantity'] > 1) {
                      _cartItems[index]['quantity'] = item['quantity'] - 1;
                    } else {
                      _cartItems.removeAt(index);
                    }
                  });
                },
                icon: const Icon(Icons.remove_circle_outline, color: AppConstants.errorColor),
                iconSize: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
} 