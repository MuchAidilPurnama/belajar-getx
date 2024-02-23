
class Pasien {
    int id;
    String nama;
    String jenisKelamin;
    String alamat;
    String tglLahir;
    String noTelp;
    dynamic createdAt;
    dynamic updatedAt;


    Pasien({
        required this.id,
        required this.nama,
        required this.jenisKelamin,
        required this.alamat,
        required this.tglLahir,
        required this.noTelp,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        id: json["id"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        alamat: json["alamat"],
        tglLahir: json["tgl_lahir"],
        noTelp: json["no_telp"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "alamat": alamat,
        "tgl_lahir": tglLahir,
        "no_telp": noTelp,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
