import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HitungLuas(),
    );
  }
}

class HitungLuas extends StatefulWidget {
  const HitungLuas({super.key});

  @override
  State<HitungLuas> createState() => _HitungLuasState();
}

class _HitungLuasState extends State<HitungLuas> {
  final panjangCtrl = TextEditingController();
  final lebarCtrl = TextEditingController();

  String hasil = '';

  void hitung() {
    final p = double.tryParse(panjangCtrl.text);
    final l = double.tryParse(lebarCtrl.text);

    if (p == null || l == null || p < 0 || l < 0) {
      setState(() {
        hasil = 'Masukkan angka yang benar!';
      });
      return;
    }

    final luas = p * l;

    setState(() {
      hasil = 'L = $p × $l = $luas cm²';
    });
  }

  @override
  void dispose() {
    panjangCtrl.dispose();
    lebarCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F2FF),
      appBar: AppBar(
        title: const Text('Menghitung Luas'),
        backgroundColor: const Color(0xFFD7C2F2),
        foregroundColor: Color(0xfff6f5f5),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Rumus: L = p × l',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8061A8),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: panjangCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Panjang (cm)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFFFFCFF),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFB99AE0),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: lebarCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Lebar (cm)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFFFFCFF),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFB99AE0),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: hitung,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD7C2F2),
                  foregroundColor: const Color(0xFF65468C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Hitung Luas',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              hasil,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8061A8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
