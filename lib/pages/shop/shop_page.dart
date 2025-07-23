import 'package:flutter/material.dart';
import 'cart_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> cartItems = [];

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 1.0,
      upperBound: 1.3,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void addToCart(String name, String price, String image) {
    final index = cartItems.indexWhere((item) => item['name'] == name);
    setState(() {
      if (index != -1) {
        cartItems[index]['qty'] += 1;
      } else {
        cartItems.add({'name': name, 'price': price, 'image': image, 'qty': 1});
      }

      _controller.forward().then((_) => _controller.reverse());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$name ditambahkan ke keranjang'),
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  void updateQty(int index, int newQty) {
    setState(() {
      if (newQty <= 0) {
        cartItems.removeAt(index);
      } else {
        cartItems[index]['qty'] = newQty;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void checkout() {
    setState(() {
      cartItems.clear();
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Berhasil Checkout')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Store'),
        backgroundColor: Colors.green[700],
        actions: [
          ScaleTransition(
            scale: _scaleAnimation,
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(
                          cartItems: cartItems,
                          onUpdateQty: updateQty,
                          onRemove: removeItem,
                          onCheckout: checkout,
                        ),
                      ),
                    );
                  },
                ),
                if (cartItems.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cartItems.length}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search medicines...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildMedicineItem(
                  'Paracetamol',
                  'Rp 15.000',
                  'assets/obat1.png',
                ),
                _buildMedicineItem('Vitacimin', 'Rp 2.000', 'assets/obat2.png'),
                _buildMedicineItem('Antangin', 'Rp 10.000', 'assets/obat3.png'),
                _buildMedicineItem('Panadol', 'Rp 20.000', 'assets/obat4.png'),
                _buildMedicineItem(
                  'OBH Combi',
                  'Rp 25.000',
                  'assets/obat5.png',
                ),
                _buildMedicineItem('Betadine', 'Rp 18.000', 'assets/obat6.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineItem(String name, String price, String image) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => addToCart(name, price, image),
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
