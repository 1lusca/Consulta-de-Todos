import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'beneficios_model.dart';
export 'beneficios_model.dart';

class BeneficiosWidget extends StatefulWidget {
  const BeneficiosWidget({Key? key}) : super(key: key);

  @override
  _BeneficiosWidgetState createState() => _BeneficiosWidgetState();
}

class _BeneficiosWidgetState extends State<BeneficiosWidget> {
  late BeneficiosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeneficiosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().exibeAviso == true) {
        context.pushNamed('AvisoInicio');

        return;
      } else {
        setState(() {
          _model.menuBeneficios =
              functions.setMenuBeneficios().toList().cast<String>();
          _model.beneficios =
              functions.setListaBeneficios('Populares').toList().cast<String>();
          _model.imagens = functions
              .setListaBeneficiosIcon('Populares')
              .toList()
              .cast<String>();
        });
        return;
      }
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
              Stack(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/logo-2-white.png',
                                  width: 55.0,
                                  height: 25.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 8.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                fillColor: Color(0x00FFFFFF),
                                icon: Icon(
                                  Icons.info_outline,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 25.0,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _model.mostraAviso = true;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Text(
                            'Benefícios Sociais',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final lvMenuBeneficios =
                                  _model.menuBeneficios.toList();
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      List.generate(lvMenuBeneficios.length,
                                          (lvMenuBeneficiosIndex) {
                                    final lvMenuBeneficiosItem =
                                        lvMenuBeneficios[lvMenuBeneficiosIndex];
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.itemSelecionado =
                                              lvMenuBeneficiosItem;
                                          _model.beneficios = functions
                                              .setListaBeneficios(
                                                  lvMenuBeneficiosItem)
                                              .toList()
                                              .cast<String>();
                                          _model.imagens = functions
                                              .setListaBeneficiosIcon(
                                                  lvMenuBeneficiosItem)
                                              .toList()
                                              .cast<String>();
                                        });
                                      },
                                      text: lvMenuBeneficiosItem,
                                      options: FFButtonOptions(
                                        height: 25.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: lvMenuBeneficiosItem ==
                                                _model.itemSelecionado
                                            ? FlutterFlowTheme.of(context)
                                                .primaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: lvMenuBeneficiosItem ==
                                                      _model.itemSelecionado
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
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
                                    );
                                  }).divide(SizedBox(width: 10.0)),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 150.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 100.0),
                              child: Builder(
                                builder: (context) {
                                  final lvBeneficios =
                                      _model.beneficios.toList();
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 0.0,
                                      mainAxisSpacing: 0.0,
                                      childAspectRatio: 1.0,
                                    ),
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: lvBeneficios.length,
                                    itemBuilder: (context, lvBeneficiosIndex) {
                                      final lvBeneficiosItem =
                                          lvBeneficios[lvBeneficiosIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().topicosBeneficios =
                                                  functions
                                                      .setJsonTopicosBeneficios();
                                            });
                                            if (lvBeneficiosItem ==
                                                'Bolsa Família') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[0]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'BPC') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[1]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'Seguro Desemprego') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[2]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'Pronatec') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[3]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'ProUni') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[4]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'Pronera') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[5]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'PNAE') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[6]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'Farmácia Popular') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[7]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'SUS') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[8]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'Minha Casa, Minha Vida') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[9]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'PNHR') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[10]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'PAA') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[11]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'PETI') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[12]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'Brasil Sem Miséria') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[13]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'Tarifa Social de Energia Elétrica') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[14]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'SUAS') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[15]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (lvBeneficiosItem ==
                                                'Programa Bolsa Verde') {
                                              context.pushNamed(
                                                'Beneficio',
                                                queryParameters: {
                                                  'beneficio': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .topicosBeneficios,
                                                      r'''$[16]''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              return;
                                            }
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              width: 150.0,
                                              height: 135.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      _model.imagens[
                                                          lvBeneficiosIndex],
                                                      width: 48.0,
                                                      height: 48.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                25.0,
                                                                20.0,
                                                                0.0),
                                                    child: Text(
                                                      lvBeneficiosItem,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: Material(
                  color: Colors.transparent,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(18.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/icon-beneficios-on.png',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(
                                'Benefícios',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Calendario');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/icon-calendario-off.png',
                              width: 20.0,
                              height: 20.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Blog');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/icon-blog-off.png',
                              width: 20.0,
                              height: 20.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 45.0)),
                    ),
                  ),
                ),
              ),
              if (_model.mostraAviso == true)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.mostraAviso = false;
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: Color(0x7F000000),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Aviso importante',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 8.0,
                                        borderWidth: 1.0,
                                        buttonSize: 45.0,
                                        fillColor: Color(0x00FFFFFF),
                                        icon: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.mostraAviso = false;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Nosso aplicativo tem a função exclusiva de fornecer informações sobre benefícios sociais do Governo Federal. \n\n',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        TextSpan(
                                          text:
                                              'Os dados solicitados serão utilizados apenas para essa finalidade e não serão compartilhados. \n\n',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        TextSpan(
                                          text:
                                              'Ressaltamos que o aplicativo não é oficial do Governo Federal, mas as informações são obtidas do Portal da Transparência. \n\n',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        TextSpan(
                                          text:
                                              'Obrigado por utilizar nosso aplicativo!',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.mostraAviso = false;
                                        });
                                      },
                                      text: 'Consultar',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
