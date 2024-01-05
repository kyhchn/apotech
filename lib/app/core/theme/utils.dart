import 'package:flutter/material.dart';

String formatCurrency(int value) {
  return 'Rp ${value.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]}.',
      )}';
}

String? validateIsNotEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return 'Make sure you fill the form';
  }
  return null;
}

class TrianglePainter extends CustomPainter {
  final Color color;
  TrianglePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color // Warna segitiga
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0) // Pindah ke titik awal (0, 0)
      ..lineTo(size.width, 0) // Garis horizontal ke kanan
      ..lineTo(0, size.height) // Garis vertikal ke bawah
      ..close(); // Menutup path untuk membentuk segitiga

    canvas.drawPath(path, paint); // Menggambar segitiga pada canvas
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
