// COLORS OF Onboarding screens
import 'package:flutter/material.dart';

const primary = Color(0xFF1F41BB);
const lightblue = Color.fromARGB(255, 224, 227, 250);
const white = Colors.white;
const black = Colors.black;

//
const h1 = TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: primary);
const h2 = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: primary);
const body = TextStyle(fontSize: 14);


// deviding the subscriptions into 3 categories
const categories = [
  "Entertainment",
  "Productivity",
  "Health & Fitness",
];
// list of icons for the categories
const categoryIcons = [
  Icons.movie,
  Icons.work,
  Icons.fitness_center,
];
// list of colors for the categories when seleccted
const categoryColors = [
  Color(0xFFE0E7FF), // Light Blue for Entertainment
  Color(0xFFD1FAE5), // Light Green for Productivity
  Color(0xFFFFE4E6), // Light Pink for Health & Fitness
];
// list of the time if its endedd or still 
const timeStatus = [
  "Active",
  "Expiring Soon",
  "Expired",
];
// list of icons for the time status
const timeStatusIcons = [
  Icons.check_circle, // Active
  Icons.warning, // Expiring Soon
  Icons.cancel, // Expired
];