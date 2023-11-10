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
import 'blog_pesquisa_model.dart';
export 'blog_pesquisa_model.dart';

class BlogPesquisaWidget extends StatefulWidget {
  const BlogPesquisaWidget({Key? key}) : super(key: key);

  @override
  _BlogPesquisaWidgetState createState() => _BlogPesquisaWidgetState();
}

class _BlogPesquisaWidgetState extends State<BlogPesquisaWidget> {
  late BlogPesquisaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogPesquisaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.paginaAtual = 1;
        _model.isCarregando = true;
      });
      _model.getArtigosResult = await BlogGroup.getArtigosCall.call(
        search: _model.pesquisa,
        page: _model.paginaAtual?.toString(),
      );
      if ((_model.getArtigosResult?.succeeded ?? true)) {
        setState(() {
          _model.artigos = getJsonField(
            (_model.getArtigosResult?.jsonBody ?? ''),
            r'''$''',
          );
          _model.quantidadePaginas =
              (_model.getArtigosResult?.getHeader('x-wp-totalpages') ?? '');
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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 32.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: FaIcon(
                              FontAwesomeIcons.chevronLeft,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 14.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Pesquisar',
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onFieldSubmitted: (_) async {
                          setState(() {
                            _model.pesquisa = _model.textController.text;
                            _model.isCarregando = true;
                            _model.paginaAtual = 1;
                          });
                          _model.getArtigosProcuraResult =
                              await BlogGroup.getArtigosCall.call(
                            search: _model.pesquisa,
                            page: _model.paginaAtual?.toString(),
                          );
                          if ((_model.getArtigosProcuraResult?.succeeded ??
                              true)) {
                            setState(() {
                              _model.artigos = getJsonField(
                                (_model.getArtigosProcuraResult?.jsonBody ??
                                    ''),
                                r'''$''',
                              );
                              _model.quantidadePaginas = (_model
                                      .getArtigosProcuraResult
                                      ?.getHeader('x-wp-totalpages') ??
                                  '');
                            });
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Houve um erro ao buscar as notícias. Desculpe pelo incômodo!',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
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
                        autofocus: true,
                        textCapitalization: TextCapitalization.none,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Digite aqui',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator:
                            _model.textControllerValidator.asValidator(context),
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
                                  0.0, 20.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: Text(
                                        'Resultado',
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
                                        final lvArtigos = getJsonField(
                                          _model.artigos,
                                          r'''$''',
                                        ).toList();
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
                                                      page: _model.paginaAtual
                                                          ?.toString(),
                                                      search: _model.pesquisa,
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
                                                      search: _model.pesquisa,
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/icon-calendario-off.png',
                            width: 20.0,
                            height: 20.0,
                            fit: BoxFit.contain,
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
