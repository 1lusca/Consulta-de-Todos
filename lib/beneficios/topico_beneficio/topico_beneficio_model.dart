import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'topico_beneficio_widget.dart' show TopicoBeneficioWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopicoBeneficioModel extends FlutterFlowModel<TopicoBeneficioWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
