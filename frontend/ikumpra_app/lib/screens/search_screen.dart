import 'package:flutter/material.dart';
import '../config/app_constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _selectedSortBy = 'Name';
  
  final List<Map<String, dynamic>> _allProducts = [
    // Fish Products
    {'name': 'Alvantasik', 'price': 300.0, 'category': 'Fish', 'image': 'assets/Product Images/Product Images/Altasik.jpg'},
    {'name': 'Anduhaw', 'price': 220.0, 'category': 'Fish', 'image': 'assets/Product Images/Product Images/Anduhaw.jpg'},
    {'name': 'Bangus', 'price': 150.0, 'category': 'Fish', 'image': 'assets/Product Images/Product Images/bangus.jpg'},
    {'name': 'Danggit', 'price': 200.0, 'category': 'Fish', 'image': 'assets/Product Images/Product Images/Danggit.JPG'},
    {'name': 'Mamsa', 'price': 180.0, 'category': 'Fish', 'image': 'assets/Product Images/Product Images/Mamsa.jpg'},
    {'name': 'Rumpi', 'price': 120.0, 'category': 'Fish', 'image': 'assets/Product Images/Product Images/Rumpi.jpg'},
    {'name': 'Sangi', 'price': 160.0, 'category': 'Fish', 'image': 'assets/Product Images/Product Images/Sangi.jpg'},
    {'name': 'Tamarong', 'price': 140.0, 'category': 'Fish', 'image': 'assets/Product Images/Product Images/Tamarong.jpg'},
    {'name': 'Yellow Fin', 'price': 250.0, 'category': 'Fish', 'image': 'assets/Product Images/Product Images/yellow-fin.jpg'},
    
    // Vegetable Products (using fish images as placeholders)
    {'name': 'Ahos', 'price': 80.0, 'category': 'Vegetables', 'image': 'assets/Product Images/Product Images/bangus.jpg'},
    {'name': 'Alugbati', 'price': 60.0, 'category': 'Vegetables', 'image': 'assets/Product Images/Product Images/Danggit.JPG'},
    {'name': 'Ampalaya', 'price': 70.0, 'category': 'Vegetables', 'image': 'assets/Product Images/Product Images/Mamsa.jpg'},
    {'name': 'Atzal', 'price': 90.0, 'category': 'Vegetables', 'image': 'assets/Product Images/Product Images/Rumpi.jpg'},
    {'name': 'Bagudo Beans', 'price': 75.0, 'category': 'Vegetables', 'image': 'assets/Product Images/Product Images/Sangi.jpg'},
    {'name': 'Lemonsito', 'price': 100.0, 'category': 'Vegetables', 'image': 'assets/Product Images/Product Images/Tamarong.jpg'},
    {'name': 'Luy-a', 'price': 120.0, 'category': 'Vegetables', 'image': 'assets/Product Images/Product Images/Altasik.jpg'},
    {'name': 'Okra', 'price': 65.0, 'category': 'Vegetables', 'image': 'assets/Product Images/Product Images/Anduhaw.jpg'},
    {'name': 'Patatas', 'price': 85.0, 'category': 'Vegetables', 'image': 'assets/Product Images/Product Images/yellow-fin.jpg'},
    {'name': 'Pechay', 'price': 55.0, 'category': 'Vegetables', 'image': 'assets/Product Images/Product Images/bangus.jpg'},
  ];

  List<Map<String, dynamic>> get _filteredProducts {
    List<Map<String, dynamic>> filtered = _allProducts;
    
    // Filter by search query
    if (_searchController.text.isNotEmpty) {
      filtered = filtered.where((product) =>
        product['name'].toString().toLowerCase().contains(_searchController.text.toLowerCase())
      ).toList();
    }
    
    // Filter by category
    if (_selectedCategory != 'All') {
      filtered = filtered.where((product) =>
        product['category'] == _selectedCategory
      ).toList();
    }
    
    // Sort products
    switch (_selectedSortBy) {
      case 'Name':
        filtered.sort((a, b) => a['name'].compareTo(b['name']));
        break;
      case 'Price: Low':
        filtered.sort((a, b) => a['price'].compareTo(b['price']));
        break;
      case 'Price: High':
        filtered.sort((a, b) => b['price'].compareTo(a['price']));
        break;
    }
    
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Search Products'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            decoration: BoxDecoration(
              color: AppConstants.primaryColor,
              boxShadow: AppConstants.cardShadow,
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.white70),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          
          // Filters
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Row(
              children: [
                // Category Filter
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    items: ['All', 'Fish', 'Vegetables'].map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(
                          category,
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                  ),
                ),
                
                const SizedBox(width: AppConstants.paddingMedium),
                
                // Sort Filter
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedSortBy,
                    decoration: const InputDecoration(
                      labelText: 'Sort',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    items: ['Name', 'Price: Low', 'Price: High'].map((sort) {
                      return DropdownMenuItem(
                        value: sort,
                        child: Text(
                          sort,
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedSortBy = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          
          // Results Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_filteredProducts.length} products found',
                  style: AppConstants.captionStyle,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _selectedCategory = 'All';
                      _selectedSortBy = 'Name';
                    });
                  },
                  child: const Text('Clear Filters'),
                ),
              ],
            ),
          ),
          
          // Products Grid
          Expanded(
            child: _filteredProducts.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey),
                        SizedBox(height: AppConstants.paddingMedium),
                        Text(
                          'No products found',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(AppConstants.paddingMedium),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: AppConstants.paddingMedium,
                      mainAxisSpacing: AppConstants.paddingMedium,
                    ),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return _buildProductCard(product);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        border: Border.all(color: AppConstants.borderColor),
        boxShadow: AppConstants.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppConstants.borderRadiusMedium),
              ),
              child: Image.asset(
                product['image'],
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppConstants.borderColor,
                  child: const Icon(Icons.image, size: 48),
                ),
              ),
            ),
          ),
          
          // Product Details
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Reduced padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: AppConstants.subheadingStyle.copyWith(fontSize: 12), // Smaller font
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2), // Reduced spacing
                  Text(
                    '₱${product['price'].toStringAsFixed(2)}/kg',
                    style: AppConstants.priceStyle.copyWith(fontSize: 11), // Smaller font
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
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
                        padding: const EdgeInsets.symmetric(vertical: 6), // Reduced padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 10), // Smaller font
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
} 