import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  List<Map<String, dynamic>> paymentMethods = [
    {'name': 'Dana', 'selected': true},
    {'name': 'OVO', 'selected': false},
    {'name': 'ShopeePay', 'selected': false},
  ];

  final TextEditingController _controller = TextEditingController();

  void _addPaymentMethod(String methodName) {
    if (methodName.isEmpty) return;

    setState(() {
      paymentMethods.add({'name': methodName, 'selected': false});
      _controller.clear();
    });
  }

  void _deletePaymentMethod(int index) {
    setState(() {
      paymentMethods.removeAt(index);
    });
  }

  void _selectPaymentMethod(int index) {
    setState(() {
      for (int i = 0; i < paymentMethods.length; i++) {
        paymentMethods[i]['selected'] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metode Pembayaran'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Tambah metode pembayaran...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _addPaymentMethod(_controller.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = paymentMethods[index];
                  return Card(
                    child: ListTile(
                      title: Text(method['name']),
                      leading: Radio(
                        value: true,
                        groupValue: method['selected'],
                        onChanged: (_) => _selectPaymentMethod(index),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deletePaymentMethod(index),
                      ),
                      onTap: () => _selectPaymentMethod(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
