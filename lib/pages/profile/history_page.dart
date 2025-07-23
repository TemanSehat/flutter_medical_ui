import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // Data riwayat pembelian dummy
  final List<Map<String, dynamic>> _history = [
    {
      'date': '20 Juli 2025',
      'items': ['Paracetamol', 'Vitamin C'],
      'total': 45000,
    },
    {
      'date': '18 Juli 2025',
      'items': ['Antangin', 'OBH Combi'],
      'total': 35000,
    },
    {
      'date': '15 Juli 2025',
      'items': ['Panadol'],
      'total': 20000,
    },
  ];

  void _deleteHistoryItem(int index) {
    setState(() {
      _history.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pembelian'),
        backgroundColor: Colors.green[700],
      ),
      body: _history.isEmpty
          ? const Center(child: Text('Belum ada riwayat transaksi.'))
          : ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                final transaction = _history[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              transaction['date'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _deleteHistoryItem(index),
                              icon: const Icon(Icons.delete, color: Colors.red),
                              tooltip: 'Hapus riwayat ini',
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (transaction['items'] as List<String>)
                              .map((item) => Text("- $item"))
                              .toList(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Total: Rp ${transaction['total']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
