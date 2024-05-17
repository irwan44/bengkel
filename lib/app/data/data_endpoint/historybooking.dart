class History {
  bool? status;
  String? message;
  Data? data;

  History({this.status, this.message, this.data});

  History.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  BengkellyRestAreaKM389BB1456JKT? bengkellyRestAreaKM389BB1456JKT;
  BengkellyRestAreaKM389BB1456JKT? bengkellyRestAreaKM379AB1456JKT;
  BengkellyRestAreaKM389BB1456JKT? bengkellyRestAreaKM379AB1283PLL;

  Data(
      {this.bengkellyRestAreaKM389BB1456JKT,
        this.bengkellyRestAreaKM379AB1456JKT,
        this.bengkellyRestAreaKM379AB1283PLL});

  Data.fromJson(Map<String, dynamic> json) {
    bengkellyRestAreaKM389BB1456JKT =
    json['Bengkelly Rest Area KM 389B|B 1456 JKT'] != null
        ? new BengkellyRestAreaKM389BB1456JKT.fromJson(
        json['Bengkelly Rest Area KM 389B|B 1456 JKT'])
        : null;
    bengkellyRestAreaKM379AB1456JKT =
    json['Bengkelly Rest Area KM 379A|B 1456 JKT'] != null
        ? new BengkellyRestAreaKM389BB1456JKT.fromJson(
        json['Bengkelly Rest Area KM 379A|B 1456 JKT'])
        : null;
    bengkellyRestAreaKM379AB1283PLL =
    json['Bengkelly Rest Area KM 379A|B1283PLL'] != null
        ? new BengkellyRestAreaKM389BB1456JKT.fromJson(
        json['Bengkelly Rest Area KM 379A|B1283PLL'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bengkellyRestAreaKM389BB1456JKT != null) {
      data['Bengkelly Rest Area KM 389B|B 1456 JKT'] =
          this.bengkellyRestAreaKM389BB1456JKT!.toJson();
    }
    if (this.bengkellyRestAreaKM379AB1456JKT != null) {
      data['Bengkelly Rest Area KM 379A|B 1456 JKT'] =
          this.bengkellyRestAreaKM379AB1456JKT!.toJson();
    }
    if (this.bengkellyRestAreaKM379AB1283PLL != null) {
      data['Bengkelly Rest Area KM 379A|B1283PLL'] =
          this.bengkellyRestAreaKM379AB1283PLL!.toJson();
    }
    return data;
  }
}

class BengkellyRestAreaKM389BB1456JKT {
  List<RepairMaintenance>? repairMaintenance;

  BengkellyRestAreaKM389BB1456JKT({this.repairMaintenance});

  BengkellyRestAreaKM389BB1456JKT.fromJson(Map<String, dynamic> json) {
    if (json['Repair & Maintenance'] != null) {
      repairMaintenance = <RepairMaintenance>[];
      json['Repair & Maintenance'].forEach((v) {
        repairMaintenance!.add(new RepairMaintenance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.repairMaintenance != null) {
      data['Repair & Maintenance'] =
          this.repairMaintenance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RepairMaintenance {
  int? id;
  String? namaPelanggan;
  String? namaCabang;
  String? noPolisi;
  String? namaStatus;
  String? namaJenissvc;
  List<Jasa>? jasa;
  List<Part>? part;

  RepairMaintenance(
      {this.id,
        this.namaPelanggan,
        this.namaCabang,
        this.noPolisi,
        this.namaStatus,
        this.namaJenissvc,
        this.jasa,
        this.part});

  RepairMaintenance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPelanggan = json['nama_pelanggan'];
    namaCabang = json['nama_cabang'];
    noPolisi = json['no_polisi'];
    namaStatus = json['nama_status'];
    namaJenissvc = json['nama_jenissvc'];
    if (json['jasa'] != null) {
      jasa = <Jasa>[];
      json['jasa'].forEach((v) {
        jasa!.add(new Jasa.fromJson(v));
      });
    }
    if (json['part'] != null) {
      part = <Part>[];
      json['part'].forEach((v) {
        part!.add(new Part.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_pelanggan'] = this.namaPelanggan;
    data['nama_cabang'] = this.namaCabang;
    data['no_polisi'] = this.noPolisi;
    data['nama_status'] = this.namaStatus;
    data['nama_jenissvc'] = this.namaJenissvc;
    if (this.jasa != null) {
      data['jasa'] = this.jasa!.map((v) => v.toJson()).toList();
    }
    if (this.part != null) {
      data['part'] = this.part!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jasa {
  String? tgl;
  String? kodeJasa;
  String? namaJasa;
  int? qtyJasa;
  int? harga;
  int? cabangId;

  Jasa(
      {this.tgl,
        this.kodeJasa,
        this.namaJasa,
        this.qtyJasa,
        this.harga,
        this.cabangId});

  Jasa.fromJson(Map<String, dynamic> json) {
    tgl = json['tgl'];
    kodeJasa = json['kode_jasa'];
    namaJasa = json['nama_jasa'];
    qtyJasa = json['qty_jasa'];
    harga = json['harga'];
    cabangId = json['cabang_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tgl'] = this.tgl;
    data['kode_jasa'] = this.kodeJasa;
    data['nama_jasa'] = this.namaJasa;
    data['qty_jasa'] = this.qtyJasa;
    data['harga'] = this.harga;
    data['cabang_id'] = this.cabangId;
    return data;
  }
}

class Part {
  String? tgl;
  String? kodeSparepart;
  String? namaSparepart;
  int? qtySparepart;
  int? harga;
  int? cabangId;

  Part(
      {this.tgl,
        this.kodeSparepart,
        this.namaSparepart,
        this.qtySparepart,
        this.harga,
        this.cabangId});

  Part.fromJson(Map<String, dynamic> json) {
    tgl = json['tgl'];
    kodeSparepart = json['kode_sparepart'];
    namaSparepart = json['nama_sparepart'];
    qtySparepart = json['qty_sparepart'];
    harga = json['harga'];
    cabangId = json['cabang_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tgl'] = this.tgl;
    data['kode_sparepart'] = this.kodeSparepart;
    data['nama_sparepart'] = this.namaSparepart;
    data['qty_sparepart'] = this.qtySparepart;
    data['harga'] = this.harga;
    data['cabang_id'] = this.cabangId;
    return data;
  }
}