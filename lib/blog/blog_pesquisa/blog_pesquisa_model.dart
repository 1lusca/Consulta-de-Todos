import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'blog_pesquisa_widget.dart' show BlogPesquisaWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BlogPesquisaModel extends FlutterFlowModel<BlogPesquisaWidget> {
  ///  Local state fields for this page.

  bool isCarregando = false;

  dynamic artigos;

  String quantidadePaginas = '1';

  int? paginaAtual = 1;

  String pesquisa = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getArtigos)] action in BlogPesquisa widget.
  ApiCallResponse? getArtigosResult;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getArtigos)] action in TextField widget.
  ApiCallResponse? getArtigosProcuraResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in IconButton widget.
  ApiCallResponse? getArtigosPaginaAnterior;
  // Stores action output result for [Backend Call - API (getArtigos)] action in IconButton widget.
  ApiCallResponse? getArtigosProximaPagina;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
