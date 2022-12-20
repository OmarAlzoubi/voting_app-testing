import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colours
const backGroundColour = Color.fromRGBO(218, 252, 244, 1);
const fillColour = Color.fromRGBO(21, 45, 53, 1);

const buttonTextColour = Color.fromRGBO(218, 252, 244, 1);
const paragraphTextColour = Color.fromRGBO(52, 91, 99, 1);
const labelTextColour = Color.fromRGBO(218, 252, 244, 1);
const hintTextColour = Color.fromRGBO(99, 128, 134, 1);
const iconTextColour = Color.fromRGBO(52, 91, 99, 1);
const loginSignUpHelpTextColour = Color.fromRGBO(21, 45, 53, 1);

//Text Style
final logoTextStyle = GoogleFonts.poppins(
    fontSize: 30, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal);

final headerTextStyle = GoogleFonts.poppins(
    fontSize: 20, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal);

final paragraphTextStyle = GoogleFonts.poppins(
    color: paragraphTextColour,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal);

final buttonTextStyle = GoogleFonts.poppins(
    fontSize: 20, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal);

final labelTextStyle = GoogleFonts.poppins(
    color: labelTextColour,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal);

final hintTextStyle = GoogleFonts.poppins(
    color: hintTextColour,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal);

final iconTextStyle = GoogleFonts.poppins(
    color: iconTextColour,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal);

final loginSignUpHelpTextStyle = GoogleFonts.poppins(
    color: loginSignUpHelpTextColour,
    decoration: TextDecoration.underline,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal);
