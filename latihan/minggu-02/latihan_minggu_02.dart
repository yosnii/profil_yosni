// --- Task 3: Demonstrasi const, final, var, dan late ---

// const: Digunakan untuk nilai konstan yang sudah pasti sejak waktu kompilasi (compile-time constant).
const double konstantaPi = 3.14159;

// final: Nilai diinisialisasi sekali saat runtime/compile-time dan tidak dapat diubah setelahnya.
final String namaPengembang = "Mahasiswa Teknik Komputer";

void main() {
  // var: Dart secara otomatis mendeteksi tipe data dari nilai yang diberikan.
  var suhuCelsius = 30.0;

  print('=== TUGAS 1: KONVERSI SUHU ===');
  print('Suhu dalam Celsius: $suhuCelsius °C');
  print('Fahrenheit: ${konversiKeFahrenheit(suhuCelsius)} °F');
  print('Kelvin: ${konversiKeKelvin(suhuCelsius)} K\n');

  print('=== TUGAS 2: CLASS PRODUK ===');
  // Membuat objek dengan diskon opsional
  var produk1 = Produk(nama: 'Laptop ASUS', harga: 12000000, diskon: 10);
  produk1.tampilkanDetail();

  // Membuat objek tanpa diskon (diskon bernilai null)
  var produk2 = Produk(nama: 'Mouse Logitech', harga: 250000);
  produk2.tampilkanDetail();

  print('=== TUGAS 3: DEMO VARIABEL ===');
  print('Konstanta Pi: $konstantaPi');
  print('Pengembang: $namaPengembang');

  // late: Menunda inisialisasi variabel sampai variabel tersebut benar-benar dipanggil/digunakan.
  late String statusPesan = ambilDataDariServer();
  print('Variabel late telah dideklarasikan, tetapi belum diinisialisasi di atas.');
  print('Mengakses variabel late sekarang:');
  print(statusPesan); // Di sinilah fungsi ambilDataDariServer() dieksekusi
}

// ==========================================
// FUNGSI UNTUK TUGAS 1 (Konversi Suhu)
// ==========================================
double konversiKeFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

double konversiKeKelvin(double celsius) {
  return celsius + 273.15;
}

// ==========================================
// CLASS UNTUK TUGAS 2 (Class Produk)
// ==========================================
class Produk {
  String nama;
  double harga;
  double? diskon; // Menggunakan tanda tanya (?) agar bersifat opsional (nullable)

  // Konstruktor dengan named parameters
  Produk({required this.nama, required this.harga, this.diskon});

  // Method untuk menghitung harga akhir setelah diskon
  double hitungHargaAkhir() {
    if (diskon != null && diskon! > 0) {
      return harga - (harga * (diskon! / 100));
    }
    return harga; // Jika tidak ada diskon, kembalikan harga awal
  }

  // Method untuk menampilkan informasi produk
  void tampilkanDetail() {
    print('Nama Produk : $nama');
    print('Harga Asli  : Rp $harga');
    if (diskon != null) {
      print('Diskon      : $diskon%');
    } else {
      print('Diskon      : Tidak ada');
    }
    print('Harga Akhir : Rp ${hitungHargaAkhir()}');
    print('-----------------------------------');
  }
}

// ==========================================
// FUNGSI PENDUKUNG UNTUK TUGAS 3 (Late)
// ==========================================
String ambilDataDariServer() {
  print('[Log: Fungsi ambilDataDariServer dijalankan...]');
  return 'Status: Data berhasil dimuat dengan sukses!';
}