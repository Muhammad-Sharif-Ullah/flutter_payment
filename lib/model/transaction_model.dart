import 'dart:convert';

class TransactionModel {
  final String creatorName;
  final String creatorEmail;
  final String recipientEmail;
  final String recipientName;
  final String recipientPhone;
  final String recipientAddress;
  final DateTime createAt;
  final double payment;
  final double fee;
  final double recipientGets;
  final int transactionId;
  final int paymentRequestId;
  final DateTime paymentRequestDueDate;
  final String description;
  final DateTime receivedByRecipient;
  final DateTime complete;
  final DateTime processing;
  final bool isDeposited;
  TransactionModel({
    required this.creatorName,
    required this.creatorEmail,
    required this.recipientEmail,
    required this.recipientName,
    required this.recipientPhone,
    required this.recipientAddress,
    required this.createAt,
    required this.payment,
    required this.fee,
    required this.recipientGets,
    required this.transactionId,
    required this.paymentRequestId,
    required this.paymentRequestDueDate,
    required this.description,
    required this.receivedByRecipient,
    required this.complete,
    required this.processing,
    required this.isDeposited,
  });

  TransactionModel copyWith({
    String? creatorName,
    String? creatorEmail,
    String? recipientEmail,
    String? recipientName,
    String? recipientPhone,
    String? recipientAddress,
    DateTime? createAt,
    double? payment,
    double? fee,
    double? recipientGets,
    int? transactionId,
    int? paymentRequestId,
    DateTime? paymentRequestDueDate,
    String? description,
    DateTime? receivedByRecipient,
    DateTime? complete,
    DateTime? processing,
    bool? isDeposited,
  }) {
    return TransactionModel(
      creatorName: creatorName ?? this.creatorName,
      creatorEmail: creatorEmail ?? this.creatorEmail,
      recipientEmail: recipientEmail ?? this.recipientEmail,
      recipientName: recipientName ?? this.recipientName,
      recipientPhone: recipientPhone ?? this.recipientPhone,
      recipientAddress: recipientAddress ?? this.recipientAddress,
      createAt: createAt ?? this.createAt,
      payment: payment ?? this.payment,
      fee: fee ?? this.fee,
      recipientGets: recipientGets ?? this.recipientGets,
      transactionId: transactionId ?? this.transactionId,
      paymentRequestId: paymentRequestId ?? this.paymentRequestId,
      paymentRequestDueDate:
          paymentRequestDueDate ?? this.paymentRequestDueDate,
      description: description ?? this.description,
      receivedByRecipient: receivedByRecipient ?? this.receivedByRecipient,
      complete: complete ?? this.complete,
      processing: processing ?? this.processing,
      isDeposited: isDeposited ?? this.isDeposited,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'creatorName': creatorName,
      'creatorEmail': creatorEmail,
      'recipientEmail': recipientEmail,
      'recipientName': recipientName,
      'recipientPhone': recipientPhone,
      'recipientAddress': recipientAddress,
      'createAt': createAt.millisecondsSinceEpoch,
      'payment': payment,
      'fee': fee,
      'recipientGets': recipientGets,
      'transactionId': transactionId,
      'paymentRequestId': paymentRequestId,
      'paymentRequestDueDate': paymentRequestDueDate.millisecondsSinceEpoch,
      'description': description,
      'receivedByRecipient': receivedByRecipient.millisecondsSinceEpoch,
      'complete': complete.millisecondsSinceEpoch,
      'processing': processing.millisecondsSinceEpoch,
      'isDeposited': isDeposited,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      creatorName: map['creatorName'] ?? '',
      creatorEmail: map['creatorEmail'] ?? '',
      recipientEmail: map['recipientEmail'] ?? '',
      recipientName: map['recipientName'] ?? '',
      recipientPhone: map['recipientPhone'] ?? '',
      recipientAddress: map['recipientAddress'] ?? '',
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt']),
      payment: map['payment']?.toDouble() ?? 0.0,
      fee: map['fee']?.toDouble() ?? 0.0,
      recipientGets: map['recipientGets']?.toDouble() ?? 0.0,
      transactionId: map['transactionId']?.toInt() ?? 0,
      paymentRequestId: map['paymentRequestId']?.toInt() ?? 0,
      paymentRequestDueDate:
          DateTime.fromMillisecondsSinceEpoch(map['paymentRequestDueDate']),
      description: map['description'] ?? '',
      receivedByRecipient:
          DateTime.fromMillisecondsSinceEpoch(map['receivedByRecipient']),
      complete: DateTime.fromMillisecondsSinceEpoch(map['complete']),
      processing: DateTime.fromMillisecondsSinceEpoch(map['processing']),
      isDeposited: map['isDeposited'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(creatorName: $creatorName, creatorEmail: $creatorEmail, recipientEmail: $recipientEmail, recipientName: $recipientName, recipientPhone: $recipientPhone, recipientAddress: $recipientAddress, createAt: $createAt, payment: $payment, fee: $fee, recipientGets: $recipientGets, transactionId: $transactionId, paymentRequestId: $paymentRequestId, paymentRequestDueDate: $paymentRequestDueDate, description: $description, receivedByRecipient: $receivedByRecipient, complete: $complete, processing: $processing, isDeposited: $isDeposited)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.creatorName == creatorName &&
        other.creatorEmail == creatorEmail &&
        other.recipientEmail == recipientEmail &&
        other.recipientName == recipientName &&
        other.recipientPhone == recipientPhone &&
        other.recipientAddress == recipientAddress &&
        other.createAt == createAt &&
        other.payment == payment &&
        other.fee == fee &&
        other.recipientGets == recipientGets &&
        other.transactionId == transactionId &&
        other.paymentRequestId == paymentRequestId &&
        other.paymentRequestDueDate == paymentRequestDueDate &&
        other.description == description &&
        other.receivedByRecipient == receivedByRecipient &&
        other.complete == complete &&
        other.processing == processing &&
        other.isDeposited == isDeposited;
  }

  @override
  int get hashCode {
    return creatorName.hashCode ^
        creatorEmail.hashCode ^
        recipientEmail.hashCode ^
        recipientName.hashCode ^
        recipientPhone.hashCode ^
        recipientAddress.hashCode ^
        createAt.hashCode ^
        payment.hashCode ^
        fee.hashCode ^
        recipientGets.hashCode ^
        transactionId.hashCode ^
        paymentRequestId.hashCode ^
        paymentRequestDueDate.hashCode ^
        description.hashCode ^
        receivedByRecipient.hashCode ^
        complete.hashCode ^
        processing.hashCode ^
        isDeposited.hashCode;
  }
}
