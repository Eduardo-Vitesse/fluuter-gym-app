import 'package:flutter/material.dart';

InputDecoration getAuthenticationInput(String label) {
  const double borderCircular = 64.0;

  return InputDecoration(
    hintText: label,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderCircular),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderCircular),
      borderSide: const BorderSide(color: Colors.blue, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderCircular),
      borderSide: const BorderSide(color: Colors.blueAccent, width: 3),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderCircular),
      borderSide: const BorderSide(color: Colors.red, width: 3),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderCircular),
      borderSide: const BorderSide(color: Colors.red, width: 3),
    ),
  );
}
