// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'package:crypto/crypto.dart';

Future<String> setTokenApi() async {
  // converto a string to md5

  String input = DateFormat('dd/MM').format(DateTime.now());
  List<int> bytes = utf8.encode(input); // convert the input string to bytes
  Digest md5Hash = md5.convert(bytes); // calculate the md5 hash
  String md5String = md5Hash.toString(); // convert the hash to a string

  String token = 'plege653nsuantpmew923ns';

  String token_auth = token.replaceAll('u', md5String);

  return token_auth;
}
