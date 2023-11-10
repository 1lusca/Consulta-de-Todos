import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendario_beneficio_model.dart';
export 'calendario_beneficio_model.dart';

class CalendarioBeneficioWidget extends StatefulWidget {
  const CalendarioBeneficioWidget({
    Key? key,
    this.titulo,
    this.beneficio,
  }) : super(key: key);

  final String? titulo;
  final String? beneficio;

  @override
  _CalendarioBeneficioWidgetState createState() =>
      _CalendarioBeneficioWidgetState();
}

class _CalendarioBeneficioWidgetState extends State<CalendarioBeneficioWidget> {
  late CalendarioBeneficioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarioBeneficioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.mesSelecionado = 'Janeiro';
        _model.datas = functions
            .setCalendarioBeneficios(
                _model.mesSelecionado, 'datas', widget.beneficio!)
            .toList()
            .cast<String>();
        _model.informacoes = functions
            .setCalendarioBeneficios(
                _model.mesSelecionado, 'info', widget.beneficio!)
            .toList()
            .cast<String>();
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 250.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 32.0,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            icon: FaIcon(
                              FontAwesomeIcons.chevronLeft,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 14.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                          Text(
                            widget.titulo!,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Text(
                                  'Selecione o mês',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 15.0, 20.0, 0.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Janeiro';
                                          _model.datas = functions
                                              .setCalendarioBeneficios(
                                                  'Janeiro',
                                                  'datas',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios(
                                                  'Janeiro',
                                                  'info',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Janeiro',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            _model.mesSelecionado == 'Janeiro'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Janeiro'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Fevereiro';
                                          _model.datas = functions
                                              .setCalendarioBeneficios(
                                                  'Fevereiro',
                                                  'datas',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios(
                                                  'Fevereiro',
                                                  'info',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Fevereiro',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            _model.mesSelecionado == 'Fevereiro'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Fevereiro'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Março';
                                          _model.datas = functions
                                              .setCalendarioBeneficios('Março',
                                                  'datas', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios('Março',
                                                  'info', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Março',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: _model.mesSelecionado == 'Março'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Março'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Abril';
                                          _model.datas = functions
                                              .setCalendarioBeneficios('Abril',
                                                  'datas', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios('Abril',
                                                  'info', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Abril',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: _model.mesSelecionado == 'Abril'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Abril'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Maio';
                                          _model.datas = functions
                                              .setCalendarioBeneficios('Maio',
                                                  'datas', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios('Maio',
                                                  'info', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Maio',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: _model.mesSelecionado == 'Maio'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Maio'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Junho';
                                          _model.datas = functions
                                              .setCalendarioBeneficios('Junho',
                                                  'datas', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios('Junho',
                                                  'info', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Junho',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: _model.mesSelecionado == 'Junho'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Junho'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Julho';
                                          _model.datas = functions
                                              .setCalendarioBeneficios('Julho',
                                                  'datas', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios('Julho',
                                                  'info', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Julho',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: _model.mesSelecionado == 'Julho'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Julho'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Agosto';
                                          _model.datas = functions
                                              .setCalendarioBeneficios('Agosto',
                                                  'datas', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios('Agosto',
                                                  'info', widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Agosto',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: _model.mesSelecionado == 'Agosto'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Agosto'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Setembro';
                                          _model.datas = functions
                                              .setCalendarioBeneficios(
                                                  'Setembro',
                                                  'datas',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios(
                                                  'Setembro',
                                                  'info',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Setembro',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            _model.mesSelecionado == 'Setembro'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Setembro'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Outubro';
                                          _model.datas = functions
                                              .setCalendarioBeneficios(
                                                  'Outubro',
                                                  'datas',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios(
                                                  'Outubro',
                                                  'info',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Outubro',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            _model.mesSelecionado == 'Outubro'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Outubro'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Novembro';
                                          _model.datas = functions
                                              .setCalendarioBeneficios(
                                                  'Novembro',
                                                  'datas',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios(
                                                  'Novembro',
                                                  'info',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Novembro',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            _model.mesSelecionado == 'Novembro'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Novembro'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mesSelecionado = 'Dezembro';
                                          _model.datas = functions
                                              .setCalendarioBeneficios(
                                                  'Dezembro',
                                                  'datas',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                          _model.informacoes = functions
                                              .setCalendarioBeneficios(
                                                  'Dezembro',
                                                  'info',
                                                  widget.beneficio!)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: 'Dezembro',
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            _model.mesSelecionado == 'Dezembro'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.mesSelecionado ==
                                                      'Dezembro'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : Color(0xFF4E80A6),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.13,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        'D',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.13,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        'S',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.13,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        'T',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.13,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        'Q',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.13,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        'Q',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.13,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        'S',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.13,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        'S',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Builder(
                                builder: (context) {
                                  final lvDatas = _model.datas.toList();
                                  return Wrap(
                                    spacing: 4.0,
                                    runSpacing: 15.0,
                                    alignment: WrapAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: List.generate(lvDatas.length,
                                        (lvDatasIndex) {
                                      final lvDatasItem = lvDatas[lvDatasIndex];
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.13,
                                        height:
                                            MediaQuery.sizeOf(context).width *
                                                0.13,
                                        decoration: BoxDecoration(
                                          color: (_model.informacoes[
                                                          lvDatasIndex] ==
                                                      '') ||
                                                  (_model.informacoes[
                                                          lvDatasIndex] ==
                                                      'xxx')
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          lvDatasItem,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: () {
                                                  if (_model.informacoes[
                                                          lvDatasIndex] ==
                                                      'xxx') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText;
                                                  } else if (_model.informacoes[
                                                          lvDatasIndex] ==
                                                      '') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground;
                                                  }
                                                }(),
                                              ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, -1.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    'Descrição',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 150.0),
                                child: Builder(
                                  builder: (context) {
                                    final lvDescricao = _model.informacoes
                                        .where((e) => (e != 'xxx') && (e != ''))
                                        .toList();
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: lvDescricao.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 20.0),
                                      itemBuilder: (context, lvDescricaoIndex) {
                                        final lvDescricaoItem =
                                            lvDescricao[lvDescricaoIndex];
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.13,
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.13,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                _model.datas[
                                                    functions.getIndexList(
                                                        _model.informacoes
                                                            .toList(),
                                                        lvDescricaoItem)],
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  lvDescricaoItem,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
