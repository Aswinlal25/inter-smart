class PaymentResponse {
  bool status;
  int statusCode;
  String message;
  PaymentData data;

  PaymentResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      status: json['status'],
      statusCode: json['status_code'],
      message: json['message'],
      data: PaymentData.fromJson(json['data']),
    );
  }
}

class PaymentData {
  String paymentStatus;
  int amount;
  String paidTo;
  String refId;
  String transId;
  List<PaymentItem> items;

  PaymentData({
    required this.paymentStatus,
    required this.amount,
    required this.paidTo,
    required this.refId,
    required this.transId,
    required this.items,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemsJson = json['items'];
    List<PaymentItem> items =
        itemsJson.map((item) => PaymentItem.fromJson(item)).toList();

    return PaymentData(
      paymentStatus: json['payment_status'],
      amount: json['amount'],
      paidTo: json['paid_to'],
      refId: json['ref_id'],
      transId: json['trans_id'],
      items: items,
    );
  }
}

class PaymentItem {
  String key;
  int values;

  PaymentItem({
    required this.key,
    required this.values,
  });

  factory PaymentItem.fromJson(Map<String, dynamic> json) {
    return PaymentItem(
      key: json['key'],
      values: json['values'],
    );
  }
}
