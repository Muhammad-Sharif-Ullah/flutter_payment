import 'dart:convert';

import 'package:flutter/foundation.dart';

class InvoiceModel {
  final String creatorName;
  final String creatorEmail;
  final List items;
  final String recipientEmail;
  final String recipientName;
  final String recipientPhone;
  final String recipientAddress;
  final DateTime createAt;
  final int status;
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
  InvoiceModel({
    required this.creatorName,
    required this.creatorEmail,
    required this.items,
    required this.recipientEmail,
    required this.recipientName,
    required this.recipientPhone,
    required this.recipientAddress,
    required this.createAt,
    required this.status,
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
  });

  InvoiceModel copyWith({
    String? creatorName,
    String? creatorEmail,
    List? items,
    String? recipientEmail,
    String? recipientName,
    String? recipientPhone,
    String? recipientAddress,
    DateTime? createAt,
    int? status,
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
  }) {
    return InvoiceModel(
      creatorName: creatorName ?? this.creatorName,
      creatorEmail: creatorEmail ?? this.creatorEmail,
      items: items ?? this.items,
      recipientEmail: recipientEmail ?? this.recipientEmail,
      recipientName: recipientName ?? this.recipientName,
      recipientPhone: recipientPhone ?? this.recipientPhone,
      recipientAddress: recipientAddress ?? this.recipientAddress,
      createAt: createAt ?? this.createAt,
      status: status ?? this.status,
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'creatorName': creatorName,
      'creatorEmail': creatorEmail,
      'items': items,
      'recipientEmail': recipientEmail,
      'recipientName': recipientName,
      'recipientPhone': recipientPhone,
      'recipientAddress': recipientAddress,
      'createAt': createAt.millisecondsSinceEpoch,
      'status': status,
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
    };
  }

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
      creatorName: map['creatorName'] ?? '',
      creatorEmail: map['creatorEmail'] ?? '',
      items: List.from(map['items']),
      recipientEmail: map['recipientEmail'] ?? '',
      recipientName: map['recipientName'] ?? '',
      recipientPhone: map['recipientPhone'] ?? '',
      recipientAddress: map['recipientAddress'] ?? '',
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt']),
      status: map['status']?.toInt() ?? 0,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) =>
      InvoiceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InvoiceModel(creatorName: $creatorName, creatorEmail: $creatorEmail, items: $items, recipientEmail: $recipientEmail, recipientName: $recipientName, recipientPhone: $recipientPhone, recipientAddress: $recipientAddress, createAt: $createAt, status: $status, payment: $payment, fee: $fee, recipientGets: $recipientGets, transactionId: $transactionId, paymentRequestId: $paymentRequestId, paymentRequestDueDate: $paymentRequestDueDate, description: $description, receivedByRecipient: $receivedByRecipient, complete: $complete, processing: $processing)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InvoiceModel &&
        other.creatorName == creatorName &&
        other.creatorEmail == creatorEmail &&
        listEquals(other.items, items) &&
        other.recipientEmail == recipientEmail &&
        other.recipientName == recipientName &&
        other.recipientPhone == recipientPhone &&
        other.recipientAddress == recipientAddress &&
        other.createAt == createAt &&
        other.status == status &&
        other.payment == payment &&
        other.fee == fee &&
        other.recipientGets == recipientGets &&
        other.transactionId == transactionId &&
        other.paymentRequestId == paymentRequestId &&
        other.paymentRequestDueDate == paymentRequestDueDate &&
        other.description == description &&
        other.receivedByRecipient == receivedByRecipient &&
        other.complete == complete &&
        other.processing == processing;
  }

  @override
  int get hashCode {
    return creatorName.hashCode ^
        creatorEmail.hashCode ^
        items.hashCode ^
        recipientEmail.hashCode ^
        recipientName.hashCode ^
        recipientPhone.hashCode ^
        recipientAddress.hashCode ^
        createAt.hashCode ^
        status.hashCode ^
        payment.hashCode ^
        fee.hashCode ^
        recipientGets.hashCode ^
        transactionId.hashCode ^
        paymentRequestId.hashCode ^
        paymentRequestDueDate.hashCode ^
        description.hashCode ^
        receivedByRecipient.hashCode ^
        complete.hashCode ^
        processing.hashCode;
  }
}
