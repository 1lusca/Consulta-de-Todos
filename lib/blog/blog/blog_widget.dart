import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'blog_model.dart';
export 'blog_model.dart';

class BlogWidget extends StatefulWidget {
  const BlogWidget({Key? key}) : super(key: key);

  @override
  _BlogWidgetState createState() => _BlogWidgetState();
}

class _BlogWidgetState extends State<BlogWidget> {
  late BlogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isCarregando = true;
        _model.tagSelecionada = 'Recentes';
        _model.tagIdSelecionada = '24,25,29,33,36,31,27';
        _model.todosArtigos = false;
      });
      _model.getIdArtigosDestacadosResult =
          await GetIdArtigosDestacadosCall.call();
      if ((_model.getIdArtigosDestacadosResult?.succeeded ?? true)) {
        _model.getArtigosDestacadosResult =
            await BlogGroup.getArtigosDestacadosCall.call(
          include: functions.setIdsArtigosDestacados((getJsonField(
            (_model.getIdArtigosDestacadosResult?.jsonBody ?? ''),
            r'''$''',
            true,
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!),
        );
        if ((_model.getArtigosDestacadosResult?.succeeded ?? true)) {
          setState(() {
            _model.artigosDestacados = getJsonField(
              (_model.getArtigosDestacadosResult?.jsonBody ?? ''),
              r'''$''',
            );
          });
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Houve um erro ao buscar as notícias em destaque. Desculpe pelo incômodo!',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Houve um erro ao buscar as notícias em destaque. Desculpe pelo incômodo!',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }

      _model.getArtigosResult = await BlogGroup.getArtigosCall.call(
        page: '1',
      );
      if ((_model.getArtigosResult?.succeeded ?? true)) {
        setState(() {
          _model.artigos = getJsonField(
            (_model.getArtigosResult?.jsonBody ?? ''),
            r'''$''',
          );
          _model.quantidadePaginas =
              (_model.getArtigosResult?.getHeader('x-wp-totalpages') ?? '');
          _model.paginaAtual = 1;
        });
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }

      setState(() {
        _model.isCarregando = false;
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
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/logo-2-color.png',
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
                              Icons.search_sharp,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 25.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('BlogPesquisa');
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Text(
                        'Nosso Blog',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.tagSelecionada = 'Recentes';
                                  _model.isCarregando = true;
                                  _model.tagIdSelecionada =
                                      '24,25,29,33,36,31,27';
                                  _model.todosArtigos = false;
                                });
                                _model.getArtigosRecentesResult =
                                    await BlogGroup.getArtigosCall.call(
                                  page: '1',
                                );
                                if ((_model
                                        .getArtigosRecentesResult?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.artigos = getJsonField(
                                      (_model.getArtigosRecentesResult
                                              ?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    _model.quantidadePaginas = (_model
                                            .getArtigosRecentesResult
                                            ?.getHeader('x-wp-totalpages') ??
                                        '');
                                    _model.paginaAtual = 1;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                setState(() {
                                  _model.isCarregando = false;
                                });

                                setState(() {});
                              },
                              text: 'Recentes',
                              options: FFButtonOptions(
                                height: 25.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: _model.tagSelecionada == 'Recentes'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: _model.tagSelecionada == 'Recentes'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : Color(0xFF4E80A6),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.tagSelecionada = 'Todos';
                                  _model.todosArtigos = true;
                                });
                              },
                              text: 'Todos',
                              options: FFButtonOptions(
                                height: 25.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: _model.tagSelecionada == 'Todos'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: _model.tagSelecionada == 'Todos'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : Color(0xFF4E80A6),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.tagSelecionada = 'Bolsa Família';
                                  _model.isCarregando = true;
                                  _model.tagIdSelecionada = '24';
                                  _model.todosArtigos = false;
                                });
                                _model.getArtigosBolsaResult =
                                    await BlogGroup.getArtigosCall.call(
                                  page: '1',
                                  tags: _model.tagIdSelecionada,
                                );
                                if ((_model.getArtigosBolsaResult?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.artigos = getJsonField(
                                      (_model.getArtigosBolsaResult?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    _model.quantidadePaginas = (_model
                                            .getArtigosBolsaResult
                                            ?.getHeader('x-wp-totalpages') ??
                                        '');
                                    _model.paginaAtual = 1;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                setState(() {
                                  _model.isCarregando = false;
                                });

                                setState(() {});
                              },
                              text: 'Bolsa Família',
                              options: FFButtonOptions(
                                height: 25.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: _model.tagSelecionada == 'Bolsa Família'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: _model.tagSelecionada ==
                                              'Bolsa Família'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : Color(0xFF4E80A6),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.tagSelecionada = 'BPC';
                                  _model.isCarregando = true;
                                  _model.tagIdSelecionada = '25';
                                  _model.todosArtigos = false;
                                });
                                _model.getArtigosBpcResult =
                                    await BlogGroup.getArtigosCall.call(
                                  page: '1',
                                  tags: _model.tagIdSelecionada,
                                );
                                if ((_model.getArtigosBpcResult?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.artigos = getJsonField(
                                      (_model.getArtigosBpcResult?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    _model.quantidadePaginas = (_model
                                            .getArtigosBpcResult
                                            ?.getHeader('x-wp-totalpages') ??
                                        '');
                                    _model.paginaAtual = 1;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                setState(() {
                                  _model.isCarregando = false;
                                });

                                setState(() {});
                              },
                              text: 'BPC',
                              options: FFButtonOptions(
                                height: 25.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: _model.tagSelecionada == 'BPC'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: _model.tagSelecionada == 'BPC'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : Color(0xFF4E80A6),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.tagSelecionada = 'Seguro Desemprego';
                                  _model.isCarregando = true;
                                  _model.tagIdSelecionada = '29';
                                  _model.todosArtigos = false;
                                });
                                _model.getArtigosSeguroResult =
                                    await BlogGroup.getArtigosCall.call(
                                  page: '1',
                                  tags: _model.tagIdSelecionada,
                                );
                                if ((_model.getArtigosSeguroResult?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.artigos = getJsonField(
                                      (_model.getArtigosSeguroResult
                                              ?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    _model.quantidadePaginas = (_model
                                            .getArtigosSeguroResult
                                            ?.getHeader('x-wp-totalpages') ??
                                        '');
                                    _model.paginaAtual = 1;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                setState(() {
                                  _model.isCarregando = false;
                                });

                                setState(() {});
                              },
                              text: 'Seguro Desemprego',
                              options: FFButtonOptions(
                                height: 25.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    _model.tagSelecionada == 'Seguro Desemprego'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: _model.tagSelecionada ==
                                              'Seguro Desemprego'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : Color(0xFF4E80A6),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.tagSelecionada = 'Educação';
                                  _model.isCarregando = true;
                                  _model.tagIdSelecionada = '33';
                                  _model.todosArtigos = false;
                                });
                                _model.getArtigosEducacaoResult =
                                    await BlogGroup.getArtigosCall.call(
                                  page: '1',
                                  tags: _model.tagIdSelecionada,
                                );
                                if ((_model
                                        .getArtigosEducacaoResult?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.artigos = getJsonField(
                                      (_model.getArtigosEducacaoResult
                                              ?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    _model.quantidadePaginas = (_model
                                            .getArtigosEducacaoResult
                                            ?.getHeader('x-wp-totalpages') ??
                                        '');
                                    _model.paginaAtual = 1;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                setState(() {
                                  _model.isCarregando = false;
                                });

                                setState(() {});
                              },
                              text: 'Educação',
                              options: FFButtonOptions(
                                height: 25.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: _model.tagSelecionada == 'Educação'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: _model.tagSelecionada == 'Educação'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : Color(0xFF4E80A6),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.tagSelecionada = 'Saúde';
                                  _model.isCarregando = true;
                                  _model.tagIdSelecionada = '36';
                                  _model.todosArtigos = false;
                                });
                                _model.getArtigosSaudeResult =
                                    await BlogGroup.getArtigosCall.call(
                                  page: '1',
                                  tags: _model.tagIdSelecionada,
                                );
                                if ((_model.getArtigosSaudeResult?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.artigos = getJsonField(
                                      (_model.getArtigosSaudeResult?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    _model.quantidadePaginas = (_model
                                            .getArtigosSaudeResult
                                            ?.getHeader('x-wp-totalpages') ??
                                        '');
                                    _model.paginaAtual = 1;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                setState(() {
                                  _model.isCarregando = false;
                                });

                                setState(() {});
                              },
                              text: 'Saúde',
                              options: FFButtonOptions(
                                height: 25.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: _model.tagSelecionada == 'Saúde'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: _model.tagSelecionada == 'Saúde'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : Color(0xFF4E80A6),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.tagSelecionada = 'Habitação';
                                  _model.isCarregando = true;
                                  _model.tagIdSelecionada = '31';
                                  _model.todosArtigos = false;
                                });
                                _model.getArtigosHabitacaoResult =
                                    await BlogGroup.getArtigosCall.call(
                                  page: '1',
                                  tags: _model.tagIdSelecionada,
                                );
                                if ((_model
                                        .getArtigosHabitacaoResult?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.artigos = getJsonField(
                                      (_model.getArtigosHabitacaoResult
                                              ?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    _model.quantidadePaginas = (_model
                                            .getArtigosHabitacaoResult
                                            ?.getHeader('x-wp-totalpages') ??
                                        '');
                                    _model.paginaAtual = 1;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                setState(() {
                                  _model.isCarregando = false;
                                });

                                setState(() {});
                              },
                              text: 'Habitação',
                              options: FFButtonOptions(
                                height: 25.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: _model.tagSelecionada == 'Habitação'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          _model.tagSelecionada == 'Habitação'
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : Color(0xFF4E80A6),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.tagSelecionada = 'Proteção Social';
                                  _model.isCarregando = true;
                                  _model.tagIdSelecionada = '27';
                                  _model.todosArtigos = false;
                                });
                                _model.getArtigosProtecaoResult =
                                    await BlogGroup.getArtigosCall.call(
                                  page: '1',
                                  tags: _model.tagIdSelecionada,
                                );
                                if ((_model
                                        .getArtigosProtecaoResult?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.artigos = getJsonField(
                                      (_model.getArtigosProtecaoResult
                                              ?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    _model.quantidadePaginas = (_model
                                            .getArtigosProtecaoResult
                                            ?.getHeader('x-wp-totalpages') ??
                                        '');
                                    _model.paginaAtual = 1;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                setState(() {
                                  _model.isCarregando = false;
                                });

                                setState(() {});
                              },
                              text: 'Proteção Social',
                              options: FFButtonOptions(
                                height: 25.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    _model.tagSelecionada == 'Proteção Social'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: _model.tagSelecionada ==
                                              'Proteção Social'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : Color(0xFF4E80A6),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        children: [
                          if (_model.isCarregando == false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (_model.todosArtigos == false)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final lvArtigosDestacados = _model
                                                  .artigosDestacados
                                                  ?.toList() ??
                                              [];
                                          if (lvArtigosDestacados.isEmpty) {
                                            return Center(
                                              child: Image.asset(
                                                'assets/images/lista-vazia.png',
                                                width: 320.0,
                                                height: 175.0,
                                                fit: BoxFit.contain,
                                              ),
                                            );
                                          }
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: List.generate(
                                                  lvArtigosDestacados.length,
                                                  (lvArtigosDestacadosIndex) {
                                                final lvArtigosDestacadosItem =
                                                    lvArtigosDestacados[
                                                        lvArtigosDestacadosIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'Artigo',
                                                      queryParameters: {
                                                        'artigo':
                                                            serializeParam(
                                                          lvArtigosDestacadosItem,
                                                          ParamType.JSON,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: getJsonField(
                                                        lvArtigosDestacadosItem,
                                                        r'''$._embedded["wp:featuredmedia"][0].link''',
                                                      ),
                                                      width: 300.0,
                                                      height: 210.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                );
                                              }).divide(SizedBox(width: 10.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: Text(
                                        'Recentes',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final lvArtigos =
                                            _model.artigos?.toList() ?? [];
                                        if (lvArtigos.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/lista-vazia.png',
                                              width: 320.0,
                                              height: 175.0,
                                            ),
                                          );
                                        }
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: lvArtigos.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 20.0),
                                          itemBuilder:
                                              (context, lvArtigosIndex) {
                                            final lvArtigosItem =
                                                lvArtigos[lvArtigosIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'Artigo',
                                                  queryParameters: {
                                                    'artigo': serializeParam(
                                                      lvArtigosItem,
                                                      ParamType.JSON,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: getJsonField(
                                                        lvArtigosItem,
                                                        r'''$._embedded["wp:featuredmedia"][0].source_url''',
                                                      ),
                                                      width: 105.0,
                                                      height: 60.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            functions
                                                                .setDataEscrita(
                                                                    getJsonField(
                                                              lvArtigosItem,
                                                              r'''$.date''',
                                                            ).toString()),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              lvArtigosItem,
                                                              r'''$.title.rendered''',
                                                            ).toString(),
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 40.0, 20.0, 150.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          borderWidth: 1.0,
                                          buttonSize: 32.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          disabledIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          icon: FaIcon(
                                            FontAwesomeIcons.chevronLeft,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                          onPressed: _model.paginaAtual == 1
                                              ? null
                                              : () async {
                                                  var _shouldSetState = false;
                                                  setState(() {
                                                    _model.paginaAtual =
                                                        _model.paginaAtual! +
                                                            -1;
                                                  });
                                                  if (_model.paginaAtual! >=
                                                      1) {
                                                    setState(() {
                                                      _model.isCarregando =
                                                          true;
                                                    });
                                                    _model.getArtigosPaginaAnterior =
                                                        await BlogGroup
                                                            .getArtigosCall
                                                            .call(
                                                      tags: _model
                                                          .tagIdSelecionada,
                                                      page: _model.paginaAtual
                                                          ?.toString(),
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model
                                                            .getArtigosPaginaAnterior
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        _model.artigos =
                                                            getJsonField(
                                                          (_model.getArtigosPaginaAnterior
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$''',
                                                        );
                                                        _model
                                                            .quantidadePaginas = (_model
                                                                .getArtigosPaginaAnterior
                                                                ?.getHeader(
                                                                    'x-wp-totalpages') ??
                                                            '');
                                                      });
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                      setState(() {
                                                        _model.paginaAtual =
                                                            _model.paginaAtual! +
                                                                1;
                                                      });
                                                    }

                                                    setState(() {
                                                      _model.isCarregando =
                                                          false;
                                                    });
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  } else {
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                        ),
                                        RichText(
                                          textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Página ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  _model.paginaAtual
                                                      ?.toString(),
                                                  '1',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: ' de ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              TextSpan(
                                                text: _model.quantidadePaginas,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          borderWidth: 1.0,
                                          buttonSize: 32.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          disabledIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          icon: FaIcon(
                                            FontAwesomeIcons.chevronRight,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                          onPressed: _model.paginaAtual ==
                                                  functions.converteStringInt(
                                                      _model.quantidadePaginas)
                                              ? null
                                              : () async {
                                                  var _shouldSetState = false;
                                                  setState(() {
                                                    _model.paginaAtual =
                                                        _model.paginaAtual! + 1;
                                                  });
                                                  if (_model.paginaAtual! <=
                                                      functions.converteStringInt(
                                                          _model
                                                              .quantidadePaginas)) {
                                                    setState(() {
                                                      _model.isCarregando =
                                                          true;
                                                    });
                                                    _model.getArtigosProximaPagina =
                                                        await BlogGroup
                                                            .getArtigosCall
                                                            .call(
                                                      tags: _model
                                                          .tagIdSelecionada,
                                                      page: _model.paginaAtual
                                                          ?.toString(),
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model
                                                            .getArtigosProximaPagina
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        _model.artigos =
                                                            getJsonField(
                                                          (_model.getArtigosProximaPagina
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$''',
                                                        );
                                                        _model
                                                            .quantidadePaginas = (_model
                                                                .getArtigosProximaPagina
                                                                ?.getHeader(
                                                                    'x-wp-totalpages') ??
                                                            '');
                                                      });
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                      setState(() {
                                                        _model.paginaAtual =
                                                            _model.paginaAtual! +
                                                                -1;
                                                      });
                                                    }

                                                    setState(() {
                                                      _model.isCarregando =
                                                          false;
                                                    });
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  } else {
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (_model.isCarregando == true)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 100.0, 0.0, 0.0),
                                  child: Lottie.asset(
                                    'assets/lottie_animations/loading.json',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.contain,
                                    animate: true,
                                  ),
                                ),
                                Text(
                                  'Carregando...',
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Beneficios');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/icon-beneficios-off.png',
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
                                  'assets/images/icon-blog-on.png',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(
                                'Notícias',
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
                      ].divide(SizedBox(width: 45.0)),
                    ),
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
