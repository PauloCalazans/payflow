class BoletoModel {
  final String? name;
  final String? dueDate;
  final double? valor;
  final String? barcode;


  BoletoModel({this.name, this.dueDate, this.valor, this.barcode});

  BoletoModel copyWith({String? name, String? dueDate, double? valor, String? barcode}) {
    if ((name == null || identical(name, this.name)) &&
        (dueDate == null || identical(dueDate, this.dueDate)) &&
        (valor == null || identical(valor, this.valor)) &&
        (barcode == null || identical(barcode, this.barcode))) {
      return this;
    }

    return new BoletoModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      valor: valor ?? this.valor,
      barcode: barcode ?? this.barcode,
    );
  }

  @override
  String toString() {
    return 'BoletoModel{name: $name, dueDate: $dueDate, valor: $valor, barcode: $barcode}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoletoModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          dueDate == other.dueDate &&
          valor == other.valor &&
          barcode == other.barcode);

  @override
  int get hashCode => name.hashCode ^ dueDate.hashCode ^ valor.hashCode ^ barcode.hashCode;

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return new BoletoModel(
      name: map['name'] as String?,
      dueDate: map['dueDate'] as String?,
      valor: map['valor'] as double?,
      barcode: map['barcode'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'dueDate': this.dueDate,
      'valor': this.valor,
      'barcode': this.barcode,
    } as Map<String, dynamic>;
  }
}