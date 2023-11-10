import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'blog_widget.dart' show BlogWidget;
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

class BlogModel extends FlutterFlowModel<BlogWidget> {
  ///  Local state fields for this page.

  String tagSelecionada = 'Auxílio Brasil';

  bool isCarregando = false;

  dynamic artigosDestacados;

  dynamic artigos;

  String quantidadePaginas = '';

  int? paginaAtual = 1;

  String tagIdSelecionada = '';

  bool todosArtigos = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getIdArtigosDestacados)] action in Blog widget.
  ApiCallResponse? getIdArtigosDestacadosResult;
  // Stores action output result for [Backend Call - API (getArtigosDestacados)] action in Blog widget.
  ApiCallResponse? getArtigosDestacadosResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in Blog widget.
  ApiCallResponse? getArtigosResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in Button widget.
  ApiCallResponse? getArtigosRecentesResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in Button widget.
  ApiCallResponse? getArtigosBolsaResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in Button widget.
  ApiCallResponse? getArtigosBpcResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in Button widget.
  ApiCallResponse? getArtigosSeguroResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in Button widget.
  ApiCallResponse? getArtigosEducacaoResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in Button widget.
  ApiCallResponse? getArtigosSaudeResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in Button widget.
  ApiCallResponse? getArtigosHabitacaoResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in Button widget.
  ApiCallResponse? getArtigosProtecaoResult;
  // Stores action output result for [Backend Call - API (getArtigos)] action in IconButton widget.
  ApiCallResponse? getArtigosPaginaAnterior;
  // Stores action output result for [Backend Call - API (getArtigos)] action in IconButton widget.
  ApiCallResponse? getArtigosProximaPagina;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
