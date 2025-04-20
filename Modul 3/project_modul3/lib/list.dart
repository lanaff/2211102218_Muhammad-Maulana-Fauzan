void main() {
  List<String> buah = ['Apel', 'Mangga', 'Jeruk'];

  for (var item in buah) {
    print('Buah: $item');
  }

  // Menambahkan item
  buah.add('Pisang');
  print('Setelah ditambah: $buah');
}
