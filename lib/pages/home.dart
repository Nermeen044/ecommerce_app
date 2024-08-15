import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'categorie.dart';
import 'product.dart';
import 'profile.dart';
import 'whishlist.dart';
import 'search.dart';
import 'CartPage.dart';
import 'laptop.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int _cartItemCount = 0; // Counter for the cart
  int _wishlistItemCount = 0; // Counter for the wishlist
  final TextEditingController _searchController = TextEditingController();
  bool _showAllProducts = false; // Track whether to show all products
  final Set<String> _wishlistItems = {}; // Set to track unique wishlist items

  static final List<Widget> _pages = [
    const Categorie(),
    const Product(),
    const Search(),
    const Whishlist(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addToWishlist(String productId) {
    if (!_wishlistItems.contains(productId)) {
      setState(() {
        _wishlistItems.add(productId);
        _wishlistItemCount = _wishlistItems.length;
      });
    }
  }

  void _removeFromWishlist(String productId) {
    if (_wishlistItems.contains(productId)) {
      setState(() {
        _wishlistItems.remove(productId);
        _wishlistItemCount = _wishlistItems.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 2
          ? null
          : AppBar(
              leading: _selectedIndex == 0
                  ? IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _searchController.text = '';
                          _selectedIndex = 2;
                        });
                      },
                    )
                  : null,
              title: _selectedIndex == 0 || _selectedIndex == 1
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        onChanged: (query) {
                          // Handle search query changes
                        },
                      ),
                    )
                  : const Text(''),
              actions: [
                IconButton(
                  icon: Stack(
                    children: [
                      const Icon(Icons.favorite_border),
                      if (_wishlistItemCount > 0)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Center(
                              child: Text(
                                '$_wishlistItemCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Whishlist()),
                    );
                  },
                ),
                IconButton(
                  icon: Stack(
                    children: [
                      const Icon(Icons.shopping_cart),
                      if (_cartItemCount > 0)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Center(
                              child: Text(
                                '$_cartItemCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                ),
              ],
            ),
      body: _selectedIndex == 0 ? buildHomePage() : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/application.png',
                width: 24, height: 24),
            label: 'Categorie',
          ),
          BottomNavigationBarItem(
            icon:
                Image.asset('assets/images/search.png', width: 24, height: 24),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/heart.png', width: 24, height: 24),
            label: 'Whishlist',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/user.png', width: 24, height: 24),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildHomePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Special for You ;)',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "fontyy"),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0, // Increased height
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
              viewportFraction: 1.0, // Full screen width
            ),
            items: [
              buildCategoryCard('assets/products/download.jpg', 'Cameras', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Product()),
                );
              }),
              buildCategoryCard('assets/products/laptobs.jpg', 'Computers', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Product()),
                );
              }),
              buildCategoryCard('assets/products/lights.jpg', 'Lights', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Product()),
                );
              }),
              buildCategoryCard(
                  'assets/products/phonessmart.jpg', 'Smart Phones', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Product()),
                );
              }),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Products',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "fontyy"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _showAllProducts = !_showAllProducts;
                  });
                },
                child: Text(
                  _showAllProducts ? 'See Less' : 'See More',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          _showAllProducts
              ? Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: buildFeaturedProductCards(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: buildFeaturedProductCards().take(3).toList(),
                ),
        ],
      ),
    );
  }

  Widget buildCategoryCard(String imageUrl, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildFeaturedProductCards() {
    final products = [
      ProductItem(
        name: 'Sony Camera',
        price: 499.99,
        imageUrl: 'assets/cards/camera.jpg',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Laptop()),
          );
        },
      ),
      ProductItem(
        name: 'iPhone 15',
        price: 999.99,
        imageUrl: 'assets/cards/iphone.jpg',
        onTap: () {
          // Navigate to specific page if needed
        },
      ),
      ProductItem(
        name: 'Lenovo Laptop',
        price: 799.99,
        imageUrl: 'assets/cards/laptop.jpg',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Laptop()),
          );
        },
      ),
      ProductItem(
        name: 'Fan',
        price: 199.99,
        imageUrl: 'assets/cards/fans.jpg',
        onTap: () {
          // Navigate to specific page if needed
        },
      ),
    ];

    return products.map((product) {
      return Container(
        width: (MediaQuery.of(context).size.width - 40) / 3,
        child: ProductCard(product: product),
      );
    }).toList();
  }
}

class ProductItem {
  final String name;
  final double price;
  final String imageUrl;
  final VoidCallback onTap;

  ProductItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.onTap,
  });
}

class ProductCard extends StatelessWidget {
  final ProductItem product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: product.onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100, // Adjusted image height
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
