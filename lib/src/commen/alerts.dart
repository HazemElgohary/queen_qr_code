import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alert {
  Alert._();

  static void success(Object msg, {String desc = ''}) {
    edgeAlert(
      Get.context!,
      title: msg.toString(),
      icon: Icons.check,
      backgroundColor: const Color(0xFF4A189B),
      description: desc,
    );
  }

  static void error(Object msg, {String desc = ''}) {
    edgeAlert(
      Get.context!,
      title: msg.toString(),
      icon: Icons.error,
      backgroundColor: const Color(0xFFDC3130),
      description: desc,
    );
  }
}