import 'package:flutter/material.dart';

class Address {
  final String title;
  final String area;
  final String details;
  final String phone;
  final String? courierNotes;
  final IconData icon;
  final bool isDefault;

   Address({
    required this.title,
    required this.area,
    required this.details,
    required this.phone,
    required this.icon,
    this.courierNotes,
    this.isDefault = false,
  });
}