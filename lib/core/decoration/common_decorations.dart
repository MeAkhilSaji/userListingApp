part of '../core_ui.dart';

class CommonDecorration {
  static Decoration? detaislScreenDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.grey[200]!, // Light gray
        Colors.black54, // Light black
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    // Rounded corners
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), // Shadow color
        spreadRadius: 5,
        blurRadius: 10,
        offset: const Offset(0, 3), // Shadow offset
      ),
    ],
  );

  static Decoration? detaislScreenCardDecoration = BoxDecoration(
    color: Colors.blue, // Card background color
    borderRadius: BorderRadius.circular(16.0), // Rounded corners
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2), // Shadow color
        spreadRadius: 2,
        blurRadius: 4,
        offset: const Offset(0, 2), // Shadow offset
      ),
    ],
  );
}
