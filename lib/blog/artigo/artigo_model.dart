import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'artigo_widget.dart' show ArtigoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArtigoModel extends FlutterFlowModel<ArtigoWidget> {
  ///  Local state fields for this page.

  List<String> tags = [];
  void addToTags(String item) => tags.add(item);
  void removeFromTags(String item) => tags.remove(item);
  void removeAtIndexFromTags(int index) => tags.removeAt(index);
  void insertAtIndexInTags(int index, String item) => tags.insert(index, item);
  void updateTagsAtIndex(int index, Function(String) updateFn) =>
      tags[index] = updateFn(tags[index]);

  List<String> tagsId = [];
  void addToTagsId(String item) => tagsId.add(item);
  void removeFromTagsId(String item) => tagsId.remove(item);
  void removeAtIndexFromTagsId(int index) => tagsId.removeAt(index);
  void insertAtIndexInTagsId(int index, String item) =>
      tagsId.insert(index, item);
  void updateTagsIdAtIndex(int index, Function(String) updateFn) =>
      tagsId[index] = updateFn(tagsId[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - API (getArtigo)] action in Text widget.
  ApiCallResponse? getArtigoResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    listViewController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
