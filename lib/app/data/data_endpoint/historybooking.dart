class HistoryBooking {
  bool? status;
  String? message;
  List<Data>? data;

  HistoryBooking({this.status, this.message, this.data});

  HistoryBooking.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? namaPelanggan;
  String? namaCabang;
  String? alamat;
  String? noPolisi;
  String? namaStatus;
  String? namaJenissvc;
  List<Jasa>? jasa;
  String? message;
  List<Null>? part;

  Data(
      {this.id,
        this.namaPelanggan,
        this.namaCabang,
        this.alamat,
        this.noPolisi,
        this.namaStatus,
        this.namaJenissvc,
        this.jasa,
        this.message,
        this.part});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPelanggan = json['nama_pelanggan'];
    namaCabang = json['nama_cabang'];
    alamat = json['alamat'];
    noPolisi = json['no_polisi'];
    namaStatus = json['nama_status'];
    namaJenissvc = json['nama_jenissvc'];
    if (json['jasa'] != null) {
      jasa = <Jasa>[];
      json['jasa'].forEach((v) {
        jasa!.add(new Jasa.fromJson(v));
      });
    }
    message = json['message'];
    if (json['part'] != null) {
      part = <Null>[];
      json['part'].forEach((v) {
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_pelanggan'] = this.namaPelanggan;
    data['nama_cabang'] = this.namaCabang;
    data['alamat'] = this.alamat;
    data['no_polisi'] = this.noPolisi;
    data['nama_status'] = this.namaStatus;
    data['nama_jenissvc'] = this.namaJenissvc;
    if (this.jasa != null) {
      data['jasa'] = this.jasa!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;

    return data;
  }
}

class Jasa {
  String? tgl;
  String? kodeJasa;
  String? namaJasa;
  int? qtyJasa;
  int? harga;

  Jasa({this.tgl, this.kodeJasa, this.namaJasa, this.qtyJasa, this.harga});

  Jasa.fromJson(Map<String, dynamic> json) {
    tgl = json['tgl'];
    kodeJasa = json['kode_jasa'];
    namaJasa = json['nama_jasa'];
    qtyJasa = json['qty_jasa'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tgl'] = this.tgl;
    data['kode_jasa'] = this.kodeJasa;
    data['nama_jasa'] = this.namaJasa;
    data['qty_jasa'] = this.qtyJasa;
    data['harga'] = this.harga;
    return data;
  }
}