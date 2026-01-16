import 'package:flutter/material.dart';
import 'ManagePage.dart';
import 'productpage.dart';
import 'dashboardpage.dart';
import 'profilepage.dart';
import 'stokpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const ProductsPage(),
    );
  }
}

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _selectedIndex = 2;
  String _selectedCategory = 'All Items';

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Wireless Mouse X1',
      'price': 25.00,
      'category': 'Electronics',
      'sku': 'WM-001',
      'stock': 34,
      'status': 'in_stock',
      'image': Icons.mouse,
      'bgColor': const Color(0xFF1E4D4D),
    },
    {
      'name': 'Ergo Keyboard P...',
      'price': 120.00,
      'category': 'Electronics',
      'sku': 'KB-992',
      'stock': 12,
      'status': 'low_stock',
      'image': Icons.keyboard,
      'bgColor': const Color(0xFFE8EDF3),
    },
    {
      'name': 'Modern Chair',
      'price': 89.00,
      'category': 'Furniture',
      'sku': 'CH-204',
      'stock': 105,
      'status': 'in_stock',
      'image': Icons.chair,
      'bgColor': const Color(0xFFE8EDF3),
    },
    {
      'name': 'Sport Runner 200',
      'price': 145.00,
      'category': 'Footwear',
      'sku': 'SP-555',
      'stock': 0,
      'status': 'out_of_stock',
      'image': Icons.directions_run,
      'bgColor': const Color(0xFFE8EDF3),
    },
    {
      'name': 'Laptop Pro 15',
      'price': 1899.00,
      'category': 'Electronics',
      'sku': 'LP-15X',
      'stock': 8,
      'status': 'in_stock',
      'image': Icons.laptop_mac,
      'bgColor': const Color(0xFFE8EDF3),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Products',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E3A5F),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Track inventory & categories',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE2E8F0),
                                width: 1,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Color(0xFF1E3A5F),
                                size: 22,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Stack(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0xFFE2E8F0),
                                    width: 1,
                                  ),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.notifications_outlined,
                                    color: Color(0xFF1E3A5F),
                                    size: 22,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFEF4444),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Action Cards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildActionCard(
                              title: 'Add Product',
                              subtitle: 'Update Inventory',
                              icon: Icons.add,
                              color: const Color(0xFF1E3A5F),
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildActionCard(
                              title: 'New Category',
                              subtitle: 'Organize Items',
                              icon: Icons.category,
                              color: const Color(0xFF1E3A5F),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Category Tabs
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          _buildCategoryChip('All Items', true),
                          const SizedBox(width: 8),
                          _buildCategoryChip('Electronics', false),
                          const SizedBox(width: 8),
                          _buildCategoryChip('Furniture', false),
                          const SizedBox(width: 8),
                          _buildCategoryChip('Clothing', false),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Inventory Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Inventory Items (1,248)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E3A5F),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFE2E8F0),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.filter_list,
                                  size: 16,
                                  color: Color(0xFF64748B),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF64748B),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Products List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: products.map((product) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _buildProductCard(
                              name: product['name'],
                              price: product['price'],
                              category: product['category'],
                              sku: product['sku'],
                              stock: product['stock'],
                              status: product['status'],
                              icon: product['image'],
                              bgColor: product['bgColor'],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1E3A5F),
        child: const Icon(Icons.add, size: 28),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE8EDF3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A5F),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1E3A5F) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? const Color(0xFF1E3A5F) : const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : const Color(0xFF64748B),
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String name,
    required double price,
    required String category,
    required String sku,
    required int stock,
    required String status,
    required IconData icon,
    required Color bgColor,
  }) {
    Color statusColor;
    String statusText;

    switch (status) {
      case 'in_stock':
        statusColor = const Color(0xFF10B981);
        statusText = '$stock in stock';
        break;
      case 'low_stock':
        statusColor = const Color(0xFFEA580C);
        statusText = 'Low Stock ($stock)';
        break;
      case 'out_of_stock':
        statusColor = const Color(0xFFEF4444);
        statusText = 'Out of Stock';
        break;
      default:
        statusColor = const Color(0xFF64748B);
        statusText = '$stock in stock';
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: bgColor == const Color(0xFF1E4D4D)
                  ? Colors.white
                  : const Color(0xFF64748B),
              size: 36,
            ),
          ),
          const SizedBox(width: 16),
          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A5F),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A5F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  '$category • SKU: $sku',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF94A3B8),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          statusText,
                          style: TextStyle(
                            fontSize: 13,
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.edit_outlined,
                      size: 18,
                      color: const Color(0xFFCBD5E1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //bouton Dashboard
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardPage(),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.dashboard,
                      color: _selectedIndex == 1
                          ? const Color(0xFF1E3A5F)
                          : const Color(0xFF94A3B8),
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 11,
                        color: _selectedIndex == 1
                            ? const Color(0xFF1E3A5F)
                            : const Color(0xFF94A3B8),
                        fontWeight: _selectedIndex == 1
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              //bouton products
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductsPage(),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      color: _selectedIndex == 2
                          ? const Color(0xFF1E3A5F)
                          : const Color(0xFF94A3B8),
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Products',
                      style: TextStyle(
                        fontSize: 11,
                        color: _selectedIndex == 2
                            ? const Color(0xFF1E3A5F)
                            : const Color(0xFF94A3B8),
                        fontWeight: _selectedIndex == 2
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              //bouton categories
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriesPage(),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.category_outlined,
                      color: _selectedIndex == 3
                          ? const Color(0xFF1E3A5F)
                          : const Color(0xFF94A3B8),
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 11,
                        color: _selectedIndex == 3
                            ? const Color(0xFF1E3A5F)
                            : const Color(0xFF94A3B8),
                        fontWeight: _selectedIndex == 3
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              //bouton de Stock
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StockMovementPage(),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.store_outlined,
                      color: _selectedIndex == 4
                          ? const Color(0xFF1E3A5F)
                          : const Color(0xFF94A3B8),
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Stock',
                      style: TextStyle(
                        fontSize: 11,
                        color: _selectedIndex == 4
                            ? const Color(0xFF1E3A5F)
                            : const Color(0xFF94A3B8),
                        fontWeight: _selectedIndex == 4
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              //bouton de profile
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person,
                      color: _selectedIndex == 5
                          ? const Color(0xFF1E3A5F)
                          : const Color(0xFF94A3B8),
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 11,
                        color: _selectedIndex == 5
                            ? const Color(0xFF1E3A5F)
                            : const Color(0xFF94A3B8),
                        fontWeight: _selectedIndex == 5
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? const Color(0xFF1E3A5F)
                : const Color(0xFF94A3B8),
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected
                  ? const Color(0xFF1E3A5F)
                  : const Color(0xFF94A3B8),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
