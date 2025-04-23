import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();
  final TextEditingController JumlahMakananController = TextEditingController();
  final TextEditingController JumlahMinumannController = TextEditingController();
  int totalHarga = 0;

  void calculateTotalPrice() {
    int jumlahMakanan = int.tryParse(JumlahMakananController.text) ?? 0;
    int jumlahMinuman = int.tryParse(JumlahMinumannController.text) ?? 0;

    setState(() {
      totalHarga = (jumlahMakanan * 32000) + (jumlahMinuman * 5000);
    });
  }

  @override 
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text('Order Page')),
      body: Form(
        key: _formKey,
        child: Column(
          spacing: 16,
          children: [
            TextFormField(
              controller: makananController,
              decoration: const InputDecoration(labelText: 'Food Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your food order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: minumanController,
              decoration: const InputDecoration(labelText: 'Drink Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your drink order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: JumlahMakananController,
              decoration: const InputDecoration(labelText: 'Food QTY Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your qty of food order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: JumlahMinumannController,
              decoration: const InputDecoration(labelText: 'Drink QTY Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your QTY of drink order';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  calculateTotalPrice();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: 
                      (context) => DetailOrderPage(
                        jumlahMakanan: JumlahMakananController.text,
                        jumlahMinuman: JumlahMinumannController.text,
                        makanan: makananController.text,
                        minuman: minumanController.text,
                        totalHarga: totalHarga,
                      ),
                    ),
                  );
                }
              }, child: Text('Order Now'))
          ],
        ),
      ),
    );
  }
}