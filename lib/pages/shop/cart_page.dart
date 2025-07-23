import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(int index, int newQty) onUpdateQty;
  final Function(int index) onRemove;
  final VoidCallback onCheckout;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.onUpdateQty,
    required this.onRemove,
    required this.onCheckout,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: widget.cartItems.isEmpty
                ? const Center(child: Text('Keranjang kosong'))
                : ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            item['image'],
                            width: 50,
                            height: 50,
                          ),
                          title: Text(item['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['price']),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        widget.onUpdateQty(
                                          index,
                                          item['qty'] - 1,
                                        );
                                      });
                                    },
                                  ),
                                  Text(item['qty'].toString()),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        widget.onUpdateQty(
                                          index,
                                          item['qty'] + 1,
                                        );
                                      });
                                    },
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        widget.onRemove(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (widget.cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  widget.onCheckout();
                  Navigator.pop(context);
                },
                child: const Text('Checkout'),
              ),
            ),
        ],
      ),
    );
  }
}
