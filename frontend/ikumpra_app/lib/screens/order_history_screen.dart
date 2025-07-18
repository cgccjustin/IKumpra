import 'package:flutter/material.dart';
import '../config/app_constants.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final List<Map<String, dynamic>> _orders = [
    {
      'id': 'ORD-001',
      'date': '2024-01-15',
      'status': 'delivered',
      'total': 545.00,
      'items': [
        {'name': 'Fresh Bangus', 'quantity': 2, 'price': 150.00},
        {'name': 'Fresh Danggit', 'quantity': 1, 'price': 200.00},
        {'name': 'Fresh Mamsa', 'quantity': 1, 'price': 200.00},
      ],
    },
    {
      'id': 'ORD-002',
      'date': '2024-01-10',
      'status': 'shipped',
      'total': 320.00,
      'items': [
        {'name': 'Fresh Bangus', 'quantity': 1, 'price': 150.00},
        {'name': 'Fresh Danggit', 'quantity': 1, 'price': 200.00},
      ],
    },
    {
      'id': 'ORD-003',
      'date': '2024-01-05',
      'status': 'preparing',
      'total': 180.00,
      'items': [
        {'name': 'Fresh Mamsa', 'quantity': 1, 'price': 180.00},
      ],
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'delivered':
        return AppConstants.successColor;
      case 'shipped':
        return AppConstants.primaryColor;
      case 'preparing':
        return AppConstants.warningColor;
      case 'pending':
        return AppConstants.textSecondaryColor;
      default:
        return AppConstants.errorColor;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'delivered':
        return 'Delivered';
      case 'shipped':
        return 'Shipped';
      case 'preparing':
        return 'Preparing';
      case 'pending':
        return 'Pending';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Order History'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return _buildOrderCard(order);
        },
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        border: Border.all(color: AppConstants.borderColor),
        boxShadow: AppConstants.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ${order['id']}',
                    style: AppConstants.subheadingStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Date: ${order['date']}',
                    style: AppConstants.captionStyle,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                  vertical: AppConstants.paddingSmall,
                ),
                decoration: BoxDecoration(
                  color: _getStatusColor(order['status']).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                ),
                child: Text(
                  _getStatusText(order['status']),
                  style: TextStyle(
                    color: _getStatusColor(order['status']),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppConstants.paddingMedium),
          
          // Order Items
          ...order['items'].map<Widget>((item) => Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.paddingSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${item['name']} x${item['quantity']}',
                  style: AppConstants.bodyStyle,
                ),
                Text(
                  '₱${(item['price'] * item['quantity']).toStringAsFixed(2)}',
                  style: AppConstants.priceStyle,
                ),
              ],
            ),
          )).toList(),
          
          const SizedBox(height: AppConstants.paddingMedium),
          
          // Order Total
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
                  'Total:',
                  style: AppConstants.subheadingStyle,
                ),
                Text(
                  '₱${order['total'].toStringAsFixed(2)}',
                  style: AppConstants.priceStyle.copyWith(fontSize: 18),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: AppConstants.paddingMedium),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: View order details
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppConstants.primaryColor,
                    side: BorderSide(color: AppConstants.primaryColor),
                  ),
                  child: const Text('View Details'),
                ),
              ),
              const SizedBox(width: AppConstants.paddingMedium),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Reorder
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Reorder'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 