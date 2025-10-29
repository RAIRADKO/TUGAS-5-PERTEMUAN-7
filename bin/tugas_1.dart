import 'dart:io';

class Item {
  String nama;
  int harga;
  int jumlah;

  Item(this.nama, this.harga, this.jumlah);

  int get total => harga * jumlah;
}

void main() {
  List<Item> keranjang = [];
  bool lanjut = true;

  print("=== SIMULASI KASIR SEDERHANA ===");

  while (lanjut) {
    stdout.write("\nMasukkan nama barang: ");
    String? nama = stdin.readLineSync();

    stdout.write("Masukkan harga barang: ");
    int harga = int.parse(stdin.readLineSync()!);

    stdout.write("Masukkan jumlah barang: ");
    int jumlah = int.parse(stdin.readLineSync()!);

    keranjang.add(Item(nama!, harga, jumlah));

    stdout.write("Tambah barang lagi? (y/n): ");
    String? pilih = stdin.readLineSync();
    if (pilih?.toLowerCase() == 'n') {
      lanjut = false;
    }
  }

  int totalBelanja = 0;
  print("\n===== STRUK BELANJA =====");
  for (var item in keranjang) {
    print(
        "${item.nama.padRight(15)} x${item.jumlah} = Rp${item.total.toString().padLeft(6)}");
    totalBelanja += item.total;
  }

  double diskon = 0;
  if (totalBelanja > 100000) {
    diskon = totalBelanja * 0.1;
    print("\nDiskon 10%: Rp${diskon.toInt()}");
  }

  double totalAkhir = totalBelanja - diskon;
  print("Total Belanja : Rp$totalBelanja");
  print("Total Bayar   : Rp${totalAkhir.toInt()}");

  stdout.write("\nMasukkan jumlah uang: ");
  int bayar = int.parse(stdin.readLineSync()!);

  if (bayar >= totalAkhir) {
    double kembalian = bayar - totalAkhir;
    print("Kembalian: Rp${kembalian.toInt()}");
  } else {
    print("Uang tidak cukup! Transaksi dibatalkan.");
  }

  print("\nTerima kasih telah berbelanja!");
}
