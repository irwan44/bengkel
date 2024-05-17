class CreateKendaraan {
  String? message;
  Errors? errors;

  CreateKendaraan({this.message, this.errors});

  CreateKendaraan.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? noPolisi;

  Errors({this.noPolisi});

  Errors.fromJson(Map<String, dynamic> json) {
    noPolisi = json['no_polisi'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no_polisi'] = this.noPolisi;
    return data;
  }
}