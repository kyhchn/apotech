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
