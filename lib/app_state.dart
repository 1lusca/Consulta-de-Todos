import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _exibeAviso = await secureStorage.getBool('ff_exibeAviso') ?? _exibeAviso;
    });
    await _safeInitAsync(() async {
      _exibeNotificacaoBolsa =
          await secureStorage.getBool('ff_exibeNotificacaoBolsa') ??
              _exibeNotificacaoBolsa;
    });
    await _safeInitAsync(() async {
      _exibeNotificacaoEnem =
          await secureStorage.getBool('ff_exibeNotificacaoEnem') ??
              _exibeNotificacaoEnem;
    });
    await _safeInitAsync(() async {
      _nis = await secureStorage.getString('ff_nis') ?? _nis;
    });
    await _safeInitAsync(() async {
      _valorBolsa =
          await secureStorage.getDouble('ff_valorBolsa') ?? _valorBolsa;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _exibeAviso = true;
  bool get exibeAviso => _exibeAviso;
  set exibeAviso(bool _value) {
    _exibeAviso = _value;
    secureStorage.setBool('ff_exibeAviso', _value);
  }

  void deleteExibeAviso() {
    secureStorage.delete(key: 'ff_exibeAviso');
  }

  String _dataHoje = '';
  String get dataHoje => _dataHoje;
  set dataHoje(String _value) {
    _dataHoje = _value;
  }

  dynamic _topicosBeneficios = jsonDecode(
      '[{\"titulo\":\"Bolsa Família\",\"subTitulo\":\"Transferência de renda\",\"topicos\":[{\"titulo\":\"O que é?\",\"imagem\":\"o-que-e.png\",\"tituloExpandido\":\"O que é o Bolsa Família?\",\"texto\":\"<p>O Bolsa Família é um programa do governo brasileiro criado em 2003 para combater a pobreza e promover a inclusão social. Ele oferece um auxílio financeiro mensal direto às famílias em situação de vulnerabilidade, em parceria com estados, municípios e o Distrito Federal.</p><br><p>As famílias que se cadastram e são aprovadas no programa recebem um valor de acordo com sua renda e composição familiar. Aquelas com renda per capita de até R\$ 89,00 são consideradas em extrema pobreza, enquanto aquelas com renda per capita entre R\$ 89,01 e R\$ 178,00 estão em situação de pobreza.</p><br><p>O Bolsa Família é uma ajuda financeira que visa aliviar a pobreza e garantir condições básicas de sobrevivência. Com esse apoio, as famílias têm maior acesso a alimentos, saúde, educação e outros serviços essenciais.</p><br><p>O programa é importante para combater a desigualdade social e garantir direitos básicos às famílias em situação de vulnerabilidade. Ele contribui para promover a inclusão social e reduzir a pobreza, criando um ambiente mais justo e igualitário para a população brasileira.</p>\"},{\"titulo\":\"Consultar benefício\",\"imagem\":\"consultar.png\"},{\"titulo\":\"Datas de pagamento\",\"imagem\":\"calendario.png\"},{\"titulo\":\"Como funciona\",\"imagem\":\"como-funciona.png\",\"tituloExpandido\":\"Como funciona o Bolsa Família?\",\"texto\":\"<p>O Bolsa Família é um programa que auxilia famílias em situação de vulnerabilidade por meio da transferência direta de recursos financeiros.</p><br><p><strong>1. Cadastro: </strong>As famílias que desejam receber o Bolsa Família precisam se cadastrar no Cadastro Único para Programas Sociais do Governo Federal (CadÚnico). Esse cadastro serve para identificar e caracterizar as famílias de baixa renda.</p><br><p><strong>2. Benefício: </strong>Após o cadastro, as famílias aprovadas passam a receber um auxílio financeiro mensal, de acordo com sua renda per capita, composição familiar e membros vulneráveis, como crianças e gestantes.</p><br><p><strong>3. Cartão Bolsa Família: </strong>O benefício é disponibilizado por meio de um cartão magnético chamado Cartão Bolsa Família. Com ele, as famílias podem sacar o dinheiro em caixas eletrônicos, lotéricas ou correspondentes bancários.</p><br><p><strong>4. Condicionalidades: </strong>Para continuar recebendo o benefício, as famílias devem cumprir algumas obrigações, chamadas de condicionalidades. Elas incluem a frequência escolar das crianças e adolescentes e o acompanhamento de saúde, como pré-natal e vacinação.</p><br><p>O Bolsa Família é uma ferramenta importante no combate à pobreza e à desigualdade social. Ao fornecer assistência financeira direta, o programa busca melhorar as condições de vida das famílias em vulnerabilidade, garantindo acesso a necessidades básicas e promovendo inclusão social.</p>\"},{\"titulo\":\"Quem pode participar?\",\"imagem\":\"quem-pode-participar.png\",\"tituloExpandido\":\"Quem pode participar do Bolsa Família?\",\"texto\":\"<p>O Bolsa Família é destinado a famílias em situação de vulnerabilidade socioeconômica. Para receber o benefício, é necessário atender aos seguintes critérios:</p><br><p><strong>Renda: </strong>A renda mensal por pessoa da família deve ser de até R\$ 178,00 para famílias em situação de pobreza e de até R\$ 89,00 para famílias em situação de extrema pobreza. Esses valores são atualizados periodicamente.</p><br><p><strong>Cadastro Único: </strong>A família deve estar cadastrada no Cadastro Único para Programas Sociais do Governo Federal, com informações atualizadas e corretas.</p><br><p><strong>Seleção: </strong>O processo de seleção é realizado pelo governo com base nas informações do Cadastro Único. Nem todas as famílias inscritas são contempladas, pois o programa prioriza aquelas em maior vulnerabilidade.</p><br><p>É importante ressaltar que o programa é direcionado a famílias, e não a indivíduos isoladamente. O valor do benefício pode variar de acordo com a composição familiar, a renda declarada e a quantidade de crianças e adolescentes na família.</p><br><p>O governo é responsável pela gestão e fiscalização do programa, além de monitorar se as famílias beneficiadas continuam atendendo aos critérios estabelecidos.</p>\"},{\"titulo\":\"O que é o NIS?\",\"imagem\":\"o-que-e-nis.png\",\"tituloExpandido\":\"O que é o NIS?\",\"texto\":\"<p>O NIS (Número de Identificação Social) é um número único atribuído a cada pessoa que faz parte de programas sociais do Governo Federal no Brasil, como o Bolsa Família.</p><br><p>É um número de cadastro utilizado para identificar e registrar os beneficiários desses programas.</p><br><p>O NIS é um número de 11 dígitos e pode ser encontrado no Cartão Cidadão, no Cartão do Bolsa Família ou em documentos de identificação dos membros do grupo familiar que são beneficiários de programas sociais.</p><br><p>Esse número é essencial para acessar serviços, consultas e atualizações relacionadas aos programas sociais do Governo Federal.</p><br><p>Ele garante a identificação única de cada beneficiário e ajuda a assegurar que os benefícios sejam destinados às pessoas elegíveis.</p>\"}]},{\"titulo\":\"BPC\"},{\"titulo\":\"Seguro Desemprego\"},{\"titulo\":\"Pronatec\"},{\"titulo\":\"ProUni\"},{\"titulo\":\"Pronera\"},{\"titulo\":\"PNAE\"},{\"titulo\":\"Farmácia Popular\"},{\"titulo\":\"SUS\"},{\"titulo\":\"Minha Casa, Minha Vida\"},{\"titulo\":\"PNHR\"},{\"titulo\":\"PAA\"},{\"titulo\":\"PETI\"},{\"titulo\":\"Brasil Sem Miséria\"},{\"titulo\":\"Tarifa Social de Energia Elétrica\"},{\"titulo\":\"SUAS\"},{\"titulo\":\"Programa Bolsa Verde\"}]');
  dynamic get topicosBeneficios => _topicosBeneficios;
  set topicosBeneficios(dynamic _value) {
    _topicosBeneficios = _value;
  }

  bool _exibeNotificacaoBolsa = true;
  bool get exibeNotificacaoBolsa => _exibeNotificacaoBolsa;
  set exibeNotificacaoBolsa(bool _value) {
    _exibeNotificacaoBolsa = _value;
    secureStorage.setBool('ff_exibeNotificacaoBolsa', _value);
  }

  void deleteExibeNotificacaoBolsa() {
    secureStorage.delete(key: 'ff_exibeNotificacaoBolsa');
  }

  bool _exibeNotificacaoEnem = true;
  bool get exibeNotificacaoEnem => _exibeNotificacaoEnem;
  set exibeNotificacaoEnem(bool _value) {
    _exibeNotificacaoEnem = _value;
    secureStorage.setBool('ff_exibeNotificacaoEnem', _value);
  }

  void deleteExibeNotificacaoEnem() {
    secureStorage.delete(key: 'ff_exibeNotificacaoEnem');
  }

  String _nis = '';
  String get nis => _nis;
  set nis(String _value) {
    _nis = _value;
    secureStorage.setString('ff_nis', _value);
  }

  void deleteNis() {
    secureStorage.delete(key: 'ff_nis');
  }

  double _valorBolsa = 0;
  double get valorBolsa => _valorBolsa;
  set valorBolsa(double _value) {
    _valorBolsa = _value;
    secureStorage.setDouble('ff_valorBolsa', _value);
  }

  void deleteValorBolsa() {
    secureStorage.delete(key: 'ff_valorBolsa');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
