import 'dart:convert';

import 'package:flutter/foundation.dart';

class RequestAPaymentModel {
  final int requestId;
  final DateTime requestSent;
  final String description;
  final String paymentMethod;
  final String paymentLink;
  final List timeLine;
  final int status;
  final double payment;
  RequestAPaymentModel({
    required this.requestId,
    required this.requestSent,
    required this.description,
    required this.paymentMethod,
    required this.paymentLink,
    required this.timeLine,
    required this.status,
    required this.payment,
  });

  RequestAPaymentModel copyWith({
    int? requestId,
    DateTime? requestSent,
    String? description,
    String? paymentMethod,
    String? paymentLink,
    List? timeLine,
    int? status,
    double? payment,
  }) {
    return RequestAPaymentModel(
      requestId: requestId ?? this.requestId,
      requestSent: requestSent ?? this.requestSent,
      description: description ?? this.description,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentLink: paymentLink ?? this.paymentLink,
      timeLine: timeLine ?? this.timeLine,
      status: status ?? this.status,
      payment: payment ?? this.payment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'requestId': requestId,
      'requestSent': requestSent.millisecondsSinceEpoch,
      'description': description,
      'paymentMethod': paymentMethod,
      'paymentLink': paymentLink,
      'timeLine': timeLine,
      'status': status,
      'payment': payment,
    };
  }

  factory RequestAPaymentModel.fromMap(Map<String, dynamic> map) {
    return RequestAPaymentModel(
      requestId: map['requestId']?.toInt() ?? 0,
      requestSent: DateTime.fromMillisecondsSinceEpoch(map['requestSent']),
      description: map['description'] ?? '',
      paymentMethod: map['paymentMethod'] ?? '',
      paymentLink: map['paymentLink'] ?? '',
      timeLine: List.from(map['timeLine']),
      status: map['status']?.toInt() ?? 0,
      payment: map['payment']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestAPaymentModel.fromJson(String source) =>
      RequestAPaymentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RequestAPaymentModel(requestId: $requestId, requestSent: $requestSent, description: $description, paymentMethod: $paymentMethod, paymentLink: $paymentLink, timeLine: $timeLine, status: $status, payment: $payment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RequestAPaymentModel &&
        other.requestId == requestId &&
        other.requestSent == requestSent &&
        other.description == description &&
        other.paymentMethod == paymentMethod &&
        other.paymentLink == paymentLink &&
        listEquals(other.timeLine, timeLine) &&
        other.status == status &&
        other.payment == payment;
  }

  @override
  int get hashCode {
    return requestId.hashCode ^
        requestSent.hashCode ^
        description.hashCode ^
        paymentMethod.hashCode ^
        paymentLink.hashCode ^
        timeLine.hashCode ^
        status.hashCode ^
        payment.hashCode;
  }
}
