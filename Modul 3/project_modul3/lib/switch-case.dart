void main() {
  String hari = 'Senin';

  switch (hari) {
    case 'Senin':
      print('Hari kerja dimulai!');
      break;
    case 'Sabtu':
    case 'Minggu':
      print('Hari libur!');
      break;
    default:
      print('Hari biasa');
  }
}
