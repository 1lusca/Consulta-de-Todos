import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

List<String> setMenuBeneficios() {
  List<String> menu = [
    'Todos',
    'Populares',
    'Renda',
    'Educação',
    'Saúde',
    'Habitação',
    'Proteção Social',
    'Ambiental'
  ];
  return menu;
}

List<String> setListaBeneficios(String tipoBeneficio) {
  List<String> beneficios;

  switch (tipoBeneficio) {
    case 'Todos':
      beneficios = [
        'Bolsa Família',
        'BPC',
        'Seguro Desemprego',
        'Pronatec',
        'ProUni',
        'Pronera',
        'PNAE',
        'Farmácia Popular',
        'SUS',
        'Minha Casa, Minha Vida',
        'PNHR',
        'PAA',
        'PETI',
        'Brasil Sem Miséria',
        'Tarifa Social de Energia Elétrica',
        'SUAS',
        'Programa Bolsa Verde'
      ];
      break;
    case 'Populares':
      beneficios = [
        'Bolsa Família',
        'Seguro Desemprego',
        'Tarifa Social de Energia Elétrica',
        'Farmácia Popular',
        'Minha Casa, Minha Vida',
        'ProUni'
      ];
      break;
    case 'Renda':
      beneficios = ['Bolsa Família', 'BPC', 'Seguro Desemprego'];
      break;
    case 'Educação':
      beneficios = ['Pronatec', 'ProUni', 'Pronera', 'PNAE'];
      break;
    case 'Saúde':
      beneficios = ['Farmácia Popular', 'SUS'];
      break;
    case 'Habitação':
      beneficios = ['Minha Casa, Minha Vida', 'PNHR'];
      break;
    case 'Proteção Social':
      beneficios = [
        'PAA',
        'PETI',
        'Brasil Sem Miséria',
        'Tarifa Social de Energia Elétrica',
        'SUAS'
      ];
      break;
    case 'Ambiental':
      beneficios = ['Programa Bolsa Verde'];
      break;
    default:
      beneficios = [
        'Bolsa Família',
        'Seguro Desemprego',
        'Tarifa Social de Energia Elétrica',
        'Farmácia Popular',
        'Minha Casa, Minha Vida',
        'ProUni'
      ];
  }

  return beneficios;
}

List<String> setListaBeneficiosIcon(String tipoBeneficio) {
  List<String> beneficios;

  switch (tipoBeneficio) {
    case 'Todos':
      beneficios = [
        'bolsa-familia-icon.png',
        'bpc-icon.png',
        'seguro-desemprego-icon.png',
        'pronatec-icon.png',
        'prouni-icon.png',
        'pronera-icon.png',
        'pnae-icon.png',
        'farmacia-popular-icon.png',
        'sus-icon.png',
        'minha-casa-minha-vida-icon.png',
        'pnhr-icon.png',
        'paa-icon.png',
        'peti-icon.png',
        'brasil-sem-miseria-icon.png',
        'tarifa-social-energia-icon.png',
        'sistema-unico-assistencia-social-icon.png',
        'programa-bolsa-verde-icon.png'
      ];
      break;
    case 'Populares':
      beneficios = [
        'bolsa-familia-icon.png',
        'seguro-desemprego-icon.png',
        'tarifa-social-energia-icon.png',
        'farmacia-popular-icon.png',
        'minha-casa-minha-vida-icon.png',
        'prouni-icon.png'
      ];
      break;
    case 'Renda':
      beneficios = [
        'bolsa-familia-icon.png',
        'bpc-icon.png',
        'seguro-desemprego-icon.png'
      ];
      break;
    case 'Educação':
      beneficios = [
        'pronatec-icon.png',
        'prouni-icon.png',
        'pronera-icon.png',
        'pnae-icon.png'
      ];
      break;
    case 'Saúde':
      beneficios = ['farmacia-popular-icon.png', 'sus-icon.png'];
      break;
    case 'Habitação':
      beneficios = ['minha-casa-minha-vida-icon.png', 'pnhr-icon.png'];
      break;
    case 'Proteção Social':
      beneficios = [
        'paa-icon.png',
        'peti-icon.png',
        'brasil-sem-miseria-icon.png',
        'tarifa-social-energia-icon.png',
        'sistema-unico-assistencia-social-icon.png'
      ];
      break;
    case 'Ambiental':
      beneficios = ['programa-bolsa-verde-icon.png'];
      break;
    default:
      beneficios = [
        'bolsa-familia-icon.png',
        'seguro-desemprego-icon.png',
        'tarifa-social-energia-icon.png',
        'farmacia-popular-icon.png',
        'minha-casa-minha-vida-icon.png',
        'prouni-icon.png'
      ];
  }

  return beneficios;
}

List<String> setListaTagsBlog() {
  List<String> tags = [
    'Recente',
    'Bolsa Família',
    'BPC',
    'Seguro Desemprego',
    'Educação',
    'Saúde',
    'Habitação',
    'Proteção Social'
  ];
  return tags;
}

List<String> setListaTagsIdBlog() {
  List<String> tags = ['', '24', '25', '29', '33', '36', '31', '27'];
  return tags;
}

String setIdsArtigosDestacados(List<String> ids) {
  String newIds = ids.toString();
  newIds = newIds.replaceAll('[', '');
  newIds = newIds.replaceAll(']', '');
  newIds = newIds.replaceAll(' ', '');

  return newIds;
}

String setData(String data) {
  var temp = DateTime.parse(data);
  //return DateFormat("dd/MM/yy").format(temp);
  return DateFormat("dd/MM/yyyy").format(temp);
}

String setDataEscrita(String data) {
  final now = DateTime.now();
  final date = DateTime.parse(data);

  final difference = now.difference(date);

  if (difference.inDays >= 30) {
    final months = (difference.inDays / 30).floor();
    return '$months mês${months > 1 ? 'es' : ''} atrás';
  } else if (difference.inDays >= 7) {
    final weeks = (difference.inDays / 7).floor();
    return '$weeks semana${weeks > 1 ? 's' : ''} atrás';
  } else if (difference.inDays == 1) {
    return 'Ontem';
  } else {
    return 'Hoje';
  }
}

List<String> setCalendarioBeneficios(
  String mes,
  String tipoDado,
  String beneficio,
) {
  List<String> dados = [];

  switch (mes) {
    case 'Janeiro':
      if (tipoDado == 'datas') {
        dados = [
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        } else {
          dados = [
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        }
      }
      return dados;

    case 'Fevereiro':
      if (tipoDado == 'datas') {
        dados = [
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '1',
          '2',
          '3',
          '4',
          '5'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        } else {
          dados = [
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        }
      }
      return dados;

    case 'Março':
      if (tipoDado == 'datas') {
        dados = [
          '26',
          '27',
          '28',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            'xxx'
          ];
        } else {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx'
          ];
        }
      }
      return dados;

    case 'Abril':
      if (tipoDado == 'datas') {
        dados = [
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            '',
            '',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        } else {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        }
      }
      return dados;

    case 'Maio':
      if (tipoDado == 'datas') {
        dados = [
          '30',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            'xxx',
            'xxx',
            'xxx'
          ];
        } else {
          dados = [
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx',
            'xxx',
            'xxx'
          ];
        }
      }
      return dados;

    case 'Junho':
      if (tipoDado == 'datas') {
        dados = [
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '1'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            'xxx'
          ];
        } else {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            'Início das inscrições para o Enem 2023',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Último dia das inscrições para o Enem 2023',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx'
          ];
        }
      }
      return dados;

    case 'Julho':
      if (tipoDado == 'datas') {
        dados = [
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        } else {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        }
      }
      return dados;

    case 'Agosto':
      if (tipoDado == 'datas') {
        dados = [
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            'xxx',
            'xxx'
          ];
        } else {
          dados = [
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx',
            'xxx'
          ];
        }
      }
      return dados;

    case 'Setembro':
      if (tipoDado == 'datas') {
        dados = [
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            ''
          ];
        } else {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            ''
          ];
        }
      }
      return dados;

    case 'Outubro':
      if (tipoDado == 'datas') {
        dados = [
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        } else {
          dados = [
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        }
      }
      return dados;

    case 'Novembro':
      if (tipoDado == 'datas') {
        dados = [
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '1',
          '2'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            'xxx',
            'xxx'
          ];
        } else {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            'Primeiro dia de aplicação da prova do Enem 2023',
            '',
            '',
            '',
            '',
            '',
            '',
            'Segundo dia de aplicação da prova do Enem 2023',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx',
            'xxx'
          ];
        }
      }
      return dados;

    case 'Dezembro':
      if (tipoDado == 'datas') {
        dados = [
          '26',
          '27',
          '28',
          '29',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6'
        ];
      } else {
        if (beneficio == 'bolsa') {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
            '',
            '',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
            'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        } else {
          dados = [
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx',
            'xxx'
          ];
        }
      }
      return dados;

    default:
      return dados;
  }
}

int getIndex(
  List<String> list,
  String item,
) {
  return list.indexOf(item);
}

String divideTexto(
  String texto,
  int nTexto,
) {
  String text1 = '';
  String text2 = '';
  if (texto.contains('Veja também:')) {
    text1 = texto.substring(0, texto.indexOf('Veja também:'));
    text2 = texto.substring(
        texto.indexOf("</ul>", texto.indexOf("Veja também:")), texto.length);
    texto = texto.replaceRange((texto.indexOf("Veja também:")),
        texto.indexOf("</ul>", texto.indexOf("Veja também:")), '');
  } else if (texto.contains('Veja Também:')) {
    text1 = texto.substring(0, texto.indexOf('Veja Também:'));
    text2 = texto.substring(
        texto.indexOf("</ul>", texto.indexOf("Veja Também:")), texto.length);
    texto = texto.replaceRange((texto.indexOf("Veja Também:")),
        texto.indexOf("</ul>", texto.indexOf("Veja Também:")), '');
  } else {
    text1 = texto.substring(0, texto.indexOf(".", (texto.length ~/ 4)) + 1);
    text2 = texto.substring(texto.indexOf(text1) + text1.length, texto.length);
  }

  if (nTexto == 1) {
    return text1;
  } else {
    return text2;
  }
}

String formataTexto(String texto) {
  if (texto.contains(' class="wp-block-heading"')) {
    texto = texto.replaceAll(' class="wp-block-heading"', '');
  }

  if (texto.contains('<p>')) {
    texto = texto.replaceAll('<p>',
        '<p style="color: #666; font-family: Poppins, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; line-height: normal;">');
  }

  if (texto.contains('<h1>')) {
    texto = texto.replaceAll('<h1>',
        '<h1 style="color: #000; font-family: Poppins, sans-serif; font-size: 18px; font-style: normal; font-weight: 700; line-height: normal;">');
  }

  if (texto.contains('<h2>')) {
    texto = texto.replaceAll('<h2>',
        '<h2 style="color: #000; font-family: Poppins, sans-serif; font-size: 16px; font-style: normal; font-weight: 700; line-height: normal;">');
  }

  if (texto.contains('<h3>')) {
    texto = texto.replaceAll('<h3>',
        '<h3 style="color: #000; font-family: Poppins, sans-serif; font-size: 14px; font-style: normal; font-weight: 700; line-height: normal;">');
  }

  if (texto.contains('<a')) {
    texto = texto.replaceAll('<a',
        '<a style="color: #12378F; font-family: Poppins, sans-serif; font-size: 14px; font-style: normal; font-weight: 500; line-height: normal;"');
  }

  if (texto.contains('<li>')) {
    texto = texto.replaceAll('<li>',
        '<li style="color: #666; font-family: Poppins, sans-serif; font-size: 14px; font-style: normal; font-weight: 500; line-height: normal;">');
  }

  return texto;
}

List<String> getTextoLinksArtigo(String text) {
  if (text.contains("Veja Também:")) {
    text = text.substring((text.indexOf("Veja Também:") + 12), text.length);
  } else if (text.contains("Veja também:")) {
    text = text.substring((text.indexOf("Veja também:") + 12), text.length);
  } else {
    List<String>? links = ["lala", "la"];
    return links;
  }

  if (text.contains("<strong>")) {
    text = text.replaceAll('<strong>', '');
  }

  if (text.contains("</strong>")) {
    text = text.replaceAll('</strong>', '');
  }

  text = text.substring(0, text.indexOf("</ul>"));

  final regex = RegExp(r'<a[^>]*>(.*?)<\/a>');
  final matches = regex.allMatches(text);
  final links = matches.map((match) => match.group(1)).cast<String>().toList();

  return links;
}

String getLinkSlug(String text) {
  text = text.substring(42, text.length);

  String barra = text.substring(text.length - 1);
  if (barra == "/") {
    text = text.substring(0, text.length - 1);
  }

  if (text.contains("/")) {
    while (text.contains('/')) {
      text = text.substring(text.indexOf("/") + 1, text.length);
    }
  }

  return text;
}

List<String> getUrlLinksArtigo(String text) {
  if (text.contains("Veja Também:")) {
    text = text.substring((text.indexOf("Veja Também:") + 12), text.length);
  } else if (text.contains("Veja também:")) {
    text = text.substring((text.indexOf("Veja também:") + 12), text.length);
  } else {
    List<String>? links = ["lala", "la"];
    return links;
  }

  if (text.contains("<strong>")) {
    text = text.replaceAll('<strong>', '');
  }

  if (text.contains("</strong>")) {
    text = text.replaceAll('</strong>', '');
  }

  text = text.substring(0, text.indexOf("</ul>"));

  final regex = RegExp(r'<a[^>]* href="([^"]*)"[^>]*>');
  final matches = regex.allMatches(text);
  List<String>? links =
      matches.map((match) => match.group(1)).cast<String>().toList();
  return links;
}

bool textoContemLinks(String texto) {
  if (texto.contains("Veja Também:") || texto.contains("Veja também:")) {
    return true;
  }
  return false;
}

int converteStringInt(String valor) {
  return int.parse(valor);
}

dynamic setJsonTopicosBeneficios() {
  String jsonString = '''
    [
      {
          "titulo": "Bolsa Família",
          "subTitulo": "Transferência de renda",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O Bolsa Família é o maior programa de transferência de renda do Brasil, reconhecido internacionalmente por já ter tirado milhões de famílias da fome. O Governo Federal relançou o programa com mais proteção às famílias, com um modelo de benefício que considera o tamanho e as características familiares, aquelas com três ou mais pessoas passarão a receber mais do que uma pessoa que vive sozinha.</p><br><p>Além de garantir renda básica para as famílias em situação de pobreza, o Programa Bolsa Família busca integrar políticas públicas, fortalecendo o acesso das famílias a direitos básicos como saúde, educação e assistência social. O Bolsa Família vai resgatar a dignidade e a cidadania das famílias também pela atuação em ações complementares por meio de articulação com outras políticas para a superação da pobreza e transformação social, tais como assistência social, esporte, ciência e trabalho.</p><br><p><strong>Quem tem direito?</strong></p><br><p>Para ter direito ao Bolsa Família, a principal regra é que a renda de cada pessoa da família seja de, no máximo, 218 reais por mês. Ou seja, se um integrante da família recebe um salário mínimo (1.302 reais), e nessa família há seis pessoas, a renda de cada um é de 217 reais. Como está abaixo do limite de 218 reais por pessoa, essa família tem o direito de receber o benefício.</p>"
              },
              {
                  "titulo": "Consultar benefício",
                  "imagem": "consultar.png"
              },
              {
                  "titulo": "Datas de pagamento",
                  "imagem": "calendario.png"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O Bolsa Família é um programa que auxilia famílias em situação de vulnerabilidade por meio da transferência direta de recursos financeiros.</p><br><p><strong>1. Cadastro: </strong>As famílias que desejam receber o Bolsa Família precisam se cadastrar no Cadastro Único para Programas Sociais do Governo Federal (CadÚnico). Esse cadastro serve para identificar e caracterizar as famílias de baixa renda.</p><br><p><strong>2. Benefício: </strong>Após o cadastro, as famílias aprovadas passam a receber um auxílio financeiro mensal, de acordo com sua renda per capita, composição familiar e membros vulneráveis, como crianças e gestantes.</p><br><p><strong>3. Cartão Bolsa Família: </strong>O benefício é disponibilizado por meio de um cartão magnético chamado Cartão Bolsa Família. Com ele, as famílias podem sacar o dinheiro em caixas eletrônicos, lotéricas ou correspondentes bancários.</p><br><p><strong>4. Condicionalidades: </strong>Para continuar recebendo o benefício, as famílias devem cumprir algumas obrigações, chamadas de condicionalidades. Elas incluem a frequência escolar das crianças e adolescentes e o acompanhamento de saúde, como pré-natal e vacinação.</p><br><p>O Bolsa Família é uma ferramenta importante no combate à pobreza e à desigualdade social. Ao fornecer assistência financeira direta, o programa busca melhorar as condições de vida das famílias em vulnerabilidade, garantindo acesso a necessidades básicas e promovendo inclusão social.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O Bolsa Família é destinado a famílias em situação de vulnerabilidade socioeconômica. Para receber o benefício, é necessário atender aos seguintes critérios:</p><br><p><strong>Renda: </strong>A renda mensal por pessoa da família deve ser de até 178,00 reais para famílias em situação de pobreza e de até 89,00 reais para famílias em situação de extrema pobreza. Esses valores são atualizados periodicamente.</p><br><p><strong>Cadastro Único: </strong>A família deve estar cadastrada no Cadastro Único para Programas Sociais do Governo Federal, com informações atualizadas e corretas.</p><br><p><strong>Seleção: </strong>O processo de seleção é realizado pelo governo com base nas informações do Cadastro Único. Nem todas as famílias inscritas são contempladas, pois o programa prioriza aquelas em maior vulnerabilidade.</p><br><p>É importante ressaltar que o programa é direcionado a famílias, e não a indivíduos isoladamente. O valor do benefício pode variar de acordo com a composição familiar, a renda declarada e a quantidade de crianças e adolescentes na família.</p><br><p>O governo é responsável pela gestão e fiscalização do programa, além de monitorar se as famílias beneficiadas continuam atendendo aos critérios estabelecidos.</p>"
              },
              {
                  "titulo": "O que é o NIS?",
                  "imagem": "o-que-e-nis.png",
                  "texto": "<p>O NIS (Número de Identificação Social) é um número único atribuído a cada pessoa que faz parte de programas sociais do Governo Federal no Brasil, como o Bolsa Família.</p><br><p>É um número de cadastro utilizado para identificar e registrar os beneficiários desses programas.</p><br><p>O NIS é um número de 11 dígitos e pode ser encontrado no Cartão Cidadão, no Cartão do Bolsa Família ou em documentos de identificação dos membros do grupo familiar que são beneficiários de programas sociais.</p><br><p>Esse número é essencial para acessar serviços, consultas e atualizações relacionadas aos programas sociais do Governo Federal.</p><br><p>Ele garante a identificação única de cada beneficiário e ajuda a assegurar que os benefícios sejam destinados às pessoas elegíveis.</p>"
              }
          ]
      },

      {
          "titulo": "BPC",
          "subTitulo": "Benefício de Prestação Continuada",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O Benefício de Prestação Continuada (BPC) é um benefício assistencial garantido pela Constituição Federal do Brasil e regulamentado pela Lei Orgânica da Assistência Social (LOAS). O BPC é destinado a pessoas idosas com 65 anos ou mais e a pessoas com deficiência de qualquer idade que comprovem não possuir meios de prover sua subsistência ou tê-la provida pela sua família.</p><br><p>O BPC tem como objetivo garantir uma renda mínima para essas pessoas em situação de vulnerabilidade social, que não contribuíram para a Previdência Social ou não possuem renda suficiente para se manterem.</p><br><p>O benefício é pago pelo Instituto Nacional do Seguro Social (INSS) e tem valor equivalente a um salário mínimo vigente.</p><br><p>Para ter direito ao BPC, é necessário atender a alguns requisitos, como comprovar a condição de idoso ou deficiente, ter renda familiar per capita inferior a 1/4 do salário mínimo, não possuir bens ou renda suficiente para sua subsistência, entre outros critérios estabelecidos pela legislação.</p><br><p>É importante ressaltar que o BPC é um benefício assistencial, ou seja, não está vinculado ao pagamento de contribuições previdenciárias. Ele não é considerado uma aposentadoria, mas sim uma proteção social para aqueles que não têm condições de prover seu sustento.</p><br><p>Para requerer o BPC, é necessário procurar uma agência do INSS e apresentar a documentação exigida. O processo passará por uma avaliação para verificar se o solicitante cumpre os critérios estabelecidos pela legislação.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",

                  "texto": "<h3>Sobre o BPC</h3><br><p>O cidadão pode procurar o Centro de Referência de Assistência Social (CRAS) da sua cidade ou aquele mais próximo da sua residência para receber as informações sobre o BPC e como pode requerê-lo. Para receber o benefício, não é preciso pagar intermediários ou agenciadores.</p><br><h3>Formas de requerimento</h3><br><p>O requerimento, que é o pedido do BPC, deve ser realizado nas Agências da Previdência Social (APS) ou por meio dos canais de atendimento do INSS: pelo telefone 135 (ligação gratuita de telefone fixo) ou pelo site ou aplicativo de celular Meu INSS.</p><br><h3>Cadastro Único</h3><br><p>A pessoa que solicita o BPC e todas as outras pessoas da família devem estar inscritas no Cadastro Único. Isso deve ser feito antes mesmo de o benefício ser solicitado junto ao INSS, ou seja, antes do requerimento. Os dados do requerente e de sua família são extraídos diretamente do Cadastro Único pelo INSS. Isso significa que não é preciso apresentar comprovante de cadastramento ao INSS, quando for pedir o BPC.</p><br><h3>Elegibilidade para o BPC</h3><br><p>Os idosos ou as pessoas com deficiência que moram sozinhas, ou se encontram em Unidades de Acolhimento ou em situação de rua, têm direito ao BPC, desde que atendam aos critérios de acesso ao benefício.</p><br><h3>Documentos necessários</h3><br><p>Para fazer o requerimento do BPC, basta apresentar o CPF. Se o requerente não tiver documentos, ele pode dar entrada no BPC desde que a informação possa ser confirmada pelo INSS por meio de consultas a outros bancos de dados. Lembrando que, mesmo que isso ocorra, o INSS pode pedir, a qualquer momento, os documentos originais.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>Pessoas com deficiência de qualquer idade e pessoas com 65 anos ou mais que não podem se manter sozinhas ou ser mantidas pela família. A família do idoso ou da pessoa com deficiência tem de ter baixa renda, ou seja, a renda de cada pessoa do grupo familiar tem de ser igual ou menor que 275,00 reais (ou 1/4 do salário mínimo, que é de 1.100,00 reais).</p>"
              }
          ]
      },

      {
          "titulo": "Seguro Desemprego",
          "subTitulo": "Assistência financeira temporária ao trabalhador",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O Seguro-Desemprego, um dos mais importantes direitos dos trabalhadores brasileiros, é um benefício que oferece auxílio em dinheiro por um período determinado.</p><br><p>Ele é pago de três a cinco parcelas de forma contínua ou alternada, de acordo com o tempo trabalhado.</p><br><p>E tem a finalidade de garantir assistência financeira temporária ao trabalhador dispensado involuntariamente (sem justa causa).</p>    "
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>Entenda cada parte do processo para receber e solicitar o Seguro Desemprego.</p><br><p><strong></strong>Requisitos de elegibilidade: Para ter direito ao seguro-desemprego, é necessário atender a certos critérios, como ter sido dispensado sem justa causa, estar desempregado no momento da solicitação, ter recebido salário por um período mínimo consecutivo, entre outros requisitos estabelecidos pela legislação trabalhista.</p><br><p><strong>Número de parcelas: </strong>O número de parcelas do seguro-desemprego varia de acordo com o tempo trabalhado e o número de solicitações anteriores do benefício. Geralmente, varia de 3 a 5 parcelas, mas em casos específicos pode ser estendido para até 7 parcelas.</p><br><p><strong>Valor do benefício: </strong>O valor do seguro-desemprego é calculado com base na média dos salários recebidos nos últimos meses trabalhados. Existem faixas de renda que determinam o valor máximo a ser recebido em cada parcela.</p><br><p><strong>Solicitação do benefício: </strong>O trabalhador deve fazer a solicitação do seguro-desemprego em um posto de atendimento do Ministério do Trabalho, no Sistema Nacional de Emprego (SINE) ou através do aplicativo ou site do governo. É necessário apresentar a documentação exigida, como RG, CPF, carteira de trabalho e formulários preenchidos.</p><br><p><strong>Pagamento: </strong>O pagamento do seguro-desemprego é realizado por meio de depósito em conta bancária, geralmente em parcelas mensais.</p><br>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O seguro-desemprego pode ser recebido por trabalhadores que atendam aos seguintes critérios:</p><br><ul><li><p>Ter sido demitido sem justa causa.</p></li><li><p>Estar desempregado no momento da solicitação.</p></li><li><p>Ter recebido salário por um período mínimo consecutivo, conforme definido pela legislação.</p></li><li><p>Cumprir outros requisitos estabelecidos pela legislação trabalhista.</p></li></ul>"
              }
          ]
      },

      {
          "titulo": "Pronatec",
          "subTitulo": "Assistência financeira temporária ao trabalhador",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O Pronatec (Programa Nacional de Acesso ao Ensino Técnico e Emprego) é um programa do governo brasileiro que tem como objetivo expandir, democratizar e qualificar a oferta de cursos de educação profissional e tecnológica no país.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O programa funciona por meio de parcerias entre instituições de ensino, como escolas técnicas e institutos federais, empresas, prefeituras e entidades do Sistema S (como o Senai, Senac, Senar, entre outros). Essas parcerias viabilizam a oferta de cursos gratuitos de formação inicial e continuada ou de educação profissional técnica de nível médio.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>Os cursos oferecidos pelo Pronatec são voltados para diversas áreas do mercado de trabalho, como indústria, comércio, serviços, agricultura, turismo, tecnologia da informação, entre outras. Eles são desenvolvidos de acordo com as demandas do mercado e visam preparar os participantes para ingressar no mercado de trabalho ou aprimorar suas habilidades profissionais.</p><br><p>Quanto aos requisitos para participar, o Pronatec atende a diferentes perfis de estudantes e trabalhadores. Os cursos são destinados a jovens e adultos, estudantes do ensino médio da rede pública ou da rede privada (com bolsa integral), trabalhadores, beneficiários de programas sociais do governo (como o Bolsa Família), pessoas em situação de vulnerabilidade social, agricultores familiares, egressos do sistema prisional, pessoas com deficiência, entre outros.</p><br><p>Os interessados em participar do Pronatec devem ficar atentos aos processos seletivos e às inscrições realizadas pelas instituições parceiras. Essas informações costumam ser divulgadas pelos sites das instituições, prefeituras, empresas e outros canais de comunicação. É importante ressaltar que a disponibilidade de cursos, a oferta de vagas e os critérios de seleção podem variar de acordo com a região e as parcerias estabelecidas em cada localidade.</p>"
              }
          ]
      },

      {
          "titulo": "ProUni",
          "subTitulo": "Programa Universidade para Todos",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O ProUni (Programa Universidade para Todos) é um programa do governo brasileiro que tem como objetivo facilitar o acesso de estudantes de baixa renda ao ensino superior em instituições privadas.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O programa funciona por meio da concessão de bolsas de estudo integrais e parciais (50% da mensalidade) em cursos de graduação em universidades privadas. As bolsas são destinadas a estudantes que tenham realizado o Exame Nacional do Ensino Médio (Enem) e atendam a determinados critérios socioeconômicos.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>Os critérios para participar do ProUni incluem ter cursado todo o ensino médio em escola pública ou ter sido bolsista integral em escola particular, ter renda familiar per capita de até um salário mínimo e meio para bolsas integrais, e até três salários mínimos para bolsas parciais, além de atender a outros requisitos estabelecidos pelo programa.</p><br><h3>Como participar do ProUni?</h3><br><p>Os interessados em participar do ProUni devem se inscrever no processo seletivo, que ocorre duas vezes por ano. Durante a inscrição, os candidatos podem escolher até duas opções de curso e instituição para concorrer às bolsas. O desempenho obtido no Enem é utilizado como critério de seleção, sendo dada prioridade aos candidatos com maiores pontuações.</p><br><p>Após o período de inscrição e seleção, os candidatos aprovados são convocados para realizar a matrícula na instituição de ensino em que foram selecionados. O ProUni também oferece a oportunidade de concorrer às bolsas remanescentes, caso haja vagas não preenchidas nas chamadas regulares.</p>"
              },
              {
                  "titulo": "Data de inscrições",
                  "imagem": "calendario.png"
              }
          ]
      },

      {
          "titulo": "Pronera",
          "subTitulo": "Educação na Reforma Agrária",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O Pronera (Programa Nacional de Educação na Reforma Agrária) é um programa educacional do governo brasileiro voltado para a promoção da educação no campo e a formação de trabalhadores rurais assentados pela reforma agrária.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O Pronera é implementado por meio de parcerias entre o Instituto Nacional de Colonização e Reforma Agrária (INCRA), universidades públicas, movimentos sociais ligados à reforma agrária e outros órgãos e entidades envolvidas com a educação no campo.</p><br><p>O programa oferece oportunidades de educação e formação profissional para as populações rurais, buscando fortalecer suas capacidades e promover o desenvolvimento sustentável no campo.</p><br><p>As ações do Pronera abrangem desde a alfabetização de adultos até a formação técnica e profissionalizante, bem como a oferta de cursos de nível superior, como licenciaturas e cursos de pós-graduação. Os projetos educacionais são desenvolvidos de forma conjunta com as comunidades assentadas e as instituições parceiras, levando em consideração as demandas locais e regionais.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O Pronera é destinado aos trabalhadores rurais assentados pela reforma agrária e suas famílias, buscando proporcionar oportunidades de educação e formação para esse público. Os assentados e suas comunidades podem participar do programa e se beneficiar das ações educacionais oferecidas.</p><br><p>Além disso, o Pronera também envolve parcerias com universidades públicas, movimentos sociais e outras entidades, que atuam na implementação das atividades educacionais. Essas instituições desempenham um papel fundamental na oferta dos cursos e na promoção da educação no campo.</p><br><p>É importante ressaltar que as modalidades de participação e os critérios específicos podem variar de acordo com os projetos e ações desenvolvidos no âmbito do Pronera.</p><br><p>Portanto, é recomendado verificar as informações disponibilizadas pelos responsáveis e instituições envolvidas para obter detalhes sobre as oportunidades de participação.</p>    "
              }
          ]
      },

      {
          "titulo": "PNAE",
          "subTitulo": "Alimentação Escolar",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O PNAE (Programa Nacional de Alimentação Escolar) é um programa do governo brasileiro que tem como objetivo garantir a oferta de alimentação saudável e adequada aos estudantes das escolas públicas do país. O programa visa promover a segurança alimentar e nutricional dos alunos, contribuindo para o seu desenvolvimento físico, cognitivo e social.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O PNAE é executado em parceria entre o governo federal, estados, municípios e o Distrito Federal.</p><br><p>O programa destina recursos financeiros para as escolas públicas oferecerem refeições balanceadas e de qualidade aos estudantes, levando em consideração as necessidades nutricionais específicas de cada faixa etária.</p><br><p>Os recursos repassados pelo governo federal são utilizados para a compra de alimentos, aquisição de equipamentos, capacitação de profissionais da área de alimentação escolar e outras ações relacionadas à promoção da alimentação saudável.</p><br><p>As escolas têm autonomia para definir o cardápio das refeições, desde que estejam de acordo com as orientações nutricionais estabelecidas pelo programa.</p><br><p>Além disso, o PNAE também promove a valorização da agricultura familiar e estimula a compra de alimentos produzidos por agricultores familiares e empreendimentos da economia solidária.</p><br><p>Essa medida busca fortalecer a economia local, estimular a agricultura sustentável e oferecer alimentos frescos e de qualidade aos estudantes.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O público-alvo do PNAE são os estudantes matriculados em escolas públicas, desde a educação infantil até o ensino médio, incluindo também a educação de jovens e adultos (EJA). O programa atende tanto as escolas municipais quanto as estaduais e do Distrito Federal.</p><br><p>O acesso à alimentação escolar pelo PNAE é universal, ou seja, todos os estudantes matriculados nas escolas públicas têm direito a receber as refeições oferecidas. Não há restrições de renda ou situação socioeconômica para participar do programa.</p><br><p>Vale destacar que o PNAE é voltado exclusivamente para as escolas públicas, enquanto as instituições privadas têm suas próprias políticas de alimentação escolar. O PNAE desempenha um papel fundamental na promoção da alimentação saudável e na garantia do direito à alimentação dos estudantes das escolas públicas.</p><br><p>Ele contribui para a formação de hábitos alimentares saudáveis, o desenvolvimento integral dos estudantes e o combate à insegurança alimentar e à desnutrição.</p>"
              }
          ]
      },

      {
          "titulo": "Farmácia Popular",
          "subTitulo": "Acesso a medicamentos essenciais",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O Farmácia Popular é um programa do governo brasileiro que visa facilitar o acesso da população a medicamentos essenciais, oferecendo-os a preços mais acessíveis ou gratuitamente.</p><br><p>O programa busca garantir o acesso a medicamentos de qualidade, principalmente para pessoas de baixa renda.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O Farmácia Popular funciona por meio de parcerias entre o governo federal e farmácias privadas, além de contar com a rede própria de unidades chamadas Aqui Tem Farmácia Popular.</p><br><p>Por meio dessas parcerias, os medicamentos são disponibilizados com preços reduzidos, abaixo dos valores praticados no mercado convencional.</p><br><p>No programa, existem duas modalidades de atendimento:</p><br><p><strong>Aquisição com desconto: </strong>Nessa modalidade, os medicamentos são vendidos com preços reduzidos, em uma tabela própria de valores, disponível tanto nas farmácias privadas credenciadas quanto nas unidades próprias 'Aqui Tem Farmácia Popular'. O desconto é oferecido diretamente no momento da compra, sem a necessidade de cadastro prévio.</p><br><p><strong>Medicamentos gratuitos: </strong>Além dos descontos, o Farmácia Popular também oferece uma lista de medicamentos disponibilizados gratuitamente para algumas doenças específicas, como hipertensão, diabetes e asma. Nesse caso, é necessário apresentar uma receita médica válida, emitida pelo SUS (Sistema Único de Saúde), e seguir as orientações do programa.</p><br>    "
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O programa é voltado para a população em geral, com ênfase nos grupos de baixa renda e pessoas que dependem do Sistema Único de Saúde (SUS) para acesso aos medicamentos.</p><br><p>Qualquer pessoa pode adquirir medicamentos com desconto, independentemente de renda, mediante pagamento do valor estabelecido na tabela de preços.</p><br><p>Já para ter acesso aos medicamentos gratuitos, é necessário se enquadrar nos critérios estabelecidos pelo programa para cada doença específica. Geralmente, é exigida a apresentação da receita médica emitida pelo SUS, contendo o nome do paciente e a prescrição do medicamento adequado.</p><br><p>É importante ressaltar que o Farmácia Popular é um programa em constante atualização e os critérios de participação, lista de medicamentos disponíveis e condições podem sofrer alterações ao longo do tempo.</p>"
              }
          ]
      },

      {
          "titulo": "SUS",
          "subTitulo": "Sistema Único de Saúde",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O SUS (Sistema Único de Saúde) é o sistema público de saúde do Brasil, responsável por garantir o acesso universal, integral e gratuito aos serviços de saúde para toda a população do país.</p><br><p>O SUS foi estabelecido pela Constituição Federal de 1988 e é considerado um dos maiores sistemas de saúde do mundo em termos de abrangência e complexidade.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O SUS funciona por meio da integração de diversas instituições e serviços de saúde, como hospitais, centros de saúde, unidades básicas de saúde, postos de saúde, laboratórios, centros especializados, entre outros.</p><br><p>O sistema é organizado em três níveis de atenção:</p><br><p><strong>Atenção Primária: </strong>É a porta de entrada do sistema, realizada nas unidades básicas de saúde, postos de saúde e equipes de saúde da família. Nesse nível, são oferecidos serviços de prevenção, promoção da saúde, diagnóstico e tratamento de doenças comuns.</p><br><p><strong>Atenção Secundária: </strong>Abrange a atenção especializada, com hospitais, clínicas e centros de especialidades. Nesse nível, são oferecidos serviços de maior complexidade, como cirurgias, tratamentos especializados, exames de alta complexidade e internações.</p><br><p><strong>Atenção Terciária: </strong>Refere-se ao atendimento de alta complexidade, realizado em hospitais de referência, como os hospitais universitários e hospitais de ensino, que oferecem serviços de alta complexidade, como transplantes, tratamentos de doenças raras e cuidados intensivos.</p><br><p>O SUS é financiado por recursos provenientes do orçamento da União, dos estados e dos municípios, além de contar com contribuições sociais. Os serviços prestados pelo SUS são oferecidos de forma gratuita, mas também é possível complementar o atendimento por meio de serviços privados, como planos de saúde.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O SUS é um sistema de saúde público e universal, o que significa que toda a população brasileira tem direito de acesso aos seus serviços. Não há exigências de renda, emprego ou contribuições prévias para utilizar o SUS.</p><br><p>Qualquer pessoa, independente de sua condição socioeconômica, pode buscar atendimento nas unidades de saúde do SUS, desde consultas médicas, exames, vacinação, internações hospitalares até procedimentos cirúrgicos e tratamentos especializados.</p><br><p>É importante destacar que, no SUS, o acesso aos serviços de saúde é realizado de acordo com a gravidade do quadro clínico, respeitando a ordem de prioridade e as necessidades individuais de cada paciente.</p><br><p>O SUS é um pilar fundamental na garantia do direito à saúde no Brasil, assegurando atendimento igualitário e de qualidade para toda a população, independentemente de sua condição socioeconômica.</p>"
              }
          ]
      },

      {
          "titulo": "Minha Casa, Minha Vida",
          "subTitulo": "Habitação popular",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O Minha Casa, Minha Vida é um programa habitacional do governo brasileiro criado para facilitar o acesso à moradia digna para famílias de baixa renda.</p><br><p>Seu principal objetivo é reduzir o déficit habitacional no país, oferecendo condições mais acessíveis para a aquisição ou o aluguel de imóveis.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O programa atua por meio da parceria entre o governo, instituições financeiras, construtoras e prefeituras municipais.</p><br><p>Ele oferece subsídios financeiros, taxas de juros reduzidas e prazos estendidos para pagamento de financiamentos, tornando o acesso à moradia mais viável para as famílias de baixa renda.</p><br><p>O programa contempla diferentes faixas de renda, variando os valores dos subsídios, das taxas de juros e das condições de pagamento conforme a renda familiar.</p><br><p>Além disso, o Minha Casa, Minha Vida possibilita a construção de empreendimentos habitacionais, incluindo casas e apartamentos, em áreas urbanas e rurais.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O programa é destinado a famílias de baixa renda que se enquadram nas faixas de rendimento estabelecidas pelo governo.</p><br><p>As faixas são definidas de acordo com a renda mensal bruta familiar. Normalmente, as faixas são divididas em grupos como:</p><br><p><strong>Faixa 1: </strong>Renda mensal de até 1.800,00 reais (com subsídios significativos e condições facilitadas).</p><br><p><strong>Faixa 1,5: </strong>Renda mensal de até 2.600,00 reais.</p><br><p><strong>Faixas 2 e 3: </strong>Renda mensal de até 9.000,00 reais (com condições mais vantajosas do que o mercado tradicional).</p><br><p>Além de atender aos critérios de renda, os interessados precisam seguir as regras estabelecidas pelo programa, que podem variar conforme a região e o tipo de imóvel.</p><br><p>Geralmente, as inscrições são realizadas por meio das prefeituras municipais ou das construtoras parceiras do programa.</p><br><p>O Minha Casa, Minha Vida é uma iniciativa importante para promover a moradia digna e a inclusão social, beneficiando famílias que anteriormente enfrentavam dificuldades para obter uma casa própria.</p>"
              }
          ]
      },

      {
          "titulo": "PNHR",
          "subTitulo": "Programa Nacional de Habitação Rural",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O PNHR (Programa Nacional de Habitação Rural) é um programa do governo brasileiro que visa proporcionar o acesso à moradia digna no meio rural, especialmente para agricultores familiares e trabalhadores rurais de baixa renda.</p><br><p>O programa busca combater o déficit habitacional no campo, promovendo a melhoria das condições de vida e o desenvolvimento sustentável nas áreas rurais do país.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O PNHR funciona por meio de parcerias entre o governo federal, estados, municípios, entidades organizadoras e beneficiários. O programa oferece subsídios e financiamentos para a construção, reforma ou ampliação de unidades habitacionais rurais.</p><br><p>Os beneficiários do PNHR podem receber financiamentos para a construção de sua moradia, com prazos e condições especiais.</p><br><p>O programa também prevê a participação das famílias na construção das casas, por meio do regime de autoconstrução, no qual as próprias famílias, com apoio técnico, participam ativamente das etapas de construção, contribuindo com mão de obra e reduzindo os custos.</p><br><p>Além disso, o PNHR prioriza a utilização de materiais de construção de origem local e sustentável, valorizando as técnicas construtivas tradicionais e a cultura da região. O objetivo é promover a sustentabilidade ambiental, econômica e social das habitações rurais.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O PNHR destina-se principalmente a agricultores familiares, trabalhadores rurais, extrativistas, pescadores artesanais e comunidades tradicionais de baixa renda que vivem no meio rural. O programa busca atender prioritariamente as famílias em situação de vulnerabilidade social, que enfrentam dificuldades habitacionais.</p><br><p>Os critérios para participar do PNHR podem variar de acordo com as diretrizes estabelecidas pelo programa em cada estado ou município.</p><br><p>Geralmente, são considerados fatores como renda familiar, condições de moradia, situação de vulnerabilidade social e regularidade da propriedade rural.</p><br><p>Os interessados em participar do PNHR devem procurar os órgãos responsáveis pelo programa em sua região, como as secretarias de habitação ou agricultura dos municípios, ou ainda entidades parceiras do programa, como cooperativas habitacionais, associações e sindicatos rurais.</p><br><p>O PNHR busca promover o acesso à moradia digna no meio rural, beneficiando agricultores familiares e trabalhadores rurais de baixa renda.</p><br><p>O programa contribui para a melhoria das condições de vida no campo e o desenvolvimento sustentável das áreas rurais do Brasil.</p>"
              }
          ]
      },

      {
          "titulo": "PAA",
          "subTitulo": "Programa de Aquisição de Alimentos",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O PAA (Programa de Aquisição de Alimentos) é uma política pública do governo brasileiro que visa promover o acesso à alimentação adequada, a valorização da agricultura familiar e o combate à fome e à pobreza no país.</p><br><p>O programa atua por meio da compra direta de alimentos produzidos por agricultores familiares e sua distribuição a entidades socio-assistenciais, hospitais, escolas, entre outros.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O PAA funciona por meio da articulação entre agricultores familiares, cooperativas, associações, prefeituras, órgãos estaduais e entidades recebedoras.</p><br><p>O programa estabelece a compra dos alimentos diretamente dos produtores, por meio de chamadas públicas ou compras institucionais, a preços justos e compatíveis com os custos de produção.</p><br><p>Os alimentos adquiridos pelo PAA são destinados a instituições socio-assistenciais, como bancos de alimentos, cozinhas comunitárias, asilos, creches, hospitais, escolas públicas, entre outras. Essas entidades recebem os alimentos e os utilizam na preparação de refeições para pessoas em situação de vulnerabilidade social.</p><br><p>Além da aquisição direta de alimentos, o PAA também incentiva ações complementares, como capacitação dos agricultores, apoio à produção sustentável, estímulo à organização dos agricultores familiares em cooperativas e associações, entre outras medidas que visam fortalecer a agricultura familiar.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O PAA é direcionado especialmente aos agricultores familiares, que são produtores rurais que desenvolvem suas atividades agrícolas de forma familiar e em pequenas propriedades.</p><br><p>Também são contemplados assentados da reforma agrária, pescadores artesanais, quilombolas, indígenas e demais grupos tradicionais que pratiquem a agricultura familiar.</p><br><p>Para participar do PAA, é necessário atender aos critérios definidos pelo programa e cumprir com os requisitos estabelecidos em cada chamada pública ou compra institucional.</p><br><p>Geralmente, é exigida a regularidade da situação fiscal e sanitária dos agricultores, além do enquadramento na categoria de agricultura familiar.</p><br><p>As instituições que recebem os alimentos também devem atender a determinados critérios e requisitos estabelecidos pelo programa.</p><br><p>O PAA desempenha um papel importante na promoção da segurança alimentar, na valorização da agricultura familiar e no combate à fome e à pobreza.</p><br><p>O programa fortalece a economia local, estimula a produção sustentável de alimentos e contribui para a garantia do direito à alimentação adequada para todos.</p>"
              }
          ]
      },

      {
          "titulo": "PETI",
          "subTitulo": "Programa de Erradicação do Trabalho Infantil",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O PETI (Programa de Erradicação do Trabalho Infantil) é um programa do governo brasileiro que tem como objetivo combater e erradicar o trabalho infantil no país.</p><br><p>O programa busca garantir o direito à proteção e à convivência familiar e comunitária de crianças e adolescentes, além de promover seu desenvolvimento integral por meio de ações socioeducativas.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O PETI é desenvolvido por meio de ações intersetoriais, envolvendo diferentes áreas como assistência social, educação, saúde e trabalho.</p><br><p>O programa oferece medidas de proteção social e socioeducativas, visando retirar as crianças e adolescentes do trabalho infantil e promover seu acesso a serviços e oportunidades para seu desenvolvimento integral.</p><br><p>As ações do PETI incluem identificação e registro de crianças em situação de trabalho infantil, realização de ações socioeducativas, inclusão das crianças em atividades educativas e culturais, acompanhamento familiar, encaminhamento para serviços de saúde e garantia de direitos.</p><br><p>O PETI também prevê a transferência de renda para as famílias que têm seus filhos afastados do trabalho infantil.</p><br><p>Essa transferência ocorre por meio do Programa Bolsa Família, que complementa a renda familiar e contribui para a superação da vulnerabilidade socioeconômica.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O público-alvo do PETI são crianças e adolescentes em situação de trabalho infantil, considerando a faixa etária entre 5 e 17 anos.</p><br><p>O programa busca atender especialmente aqueles que se encontram em situações de maior vulnerabilidade social e risco.</p><br><p>As famílias das crianças e adolescentes também são envolvidas no programa, recebendo apoio e acompanhamento para a superação das condições que levaram à inserção das crianças no trabalho infantil.</p><br><p>Vale ressaltar que a participação no PETI ocorre de forma voluntária. As famílias e crianças são identificadas e abordadas pelas equipes técnicas do programa, que oferecem informações sobre os direitos, os riscos do trabalho infantil e os benefícios de sua erradicação.</p><br><p>A participação é realizada mediante a adesão da família aos serviços e ações propostas pelo programa.</p><br><p>O PETI desempenha um papel importante na proteção e promoção dos direitos de crianças e adolescentes, contribuindo para a erradicação do trabalho infantil e a garantia de seu desenvolvimento pleno.</p><br><p>O programa busca intervir nas situações de trabalho infantil, promovendo a inclusão social e a construção de um futuro melhor para as crianças e adolescentes do Brasil.</p>"
              }
          ]
      },

      {
          "titulo": "Brasil Sem Miséria",
          "subTitulo": "Combate a extrema pobreza",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O Brasil Sem Miséria é uma política pública do governo brasileiro que busca combater a extrema pobreza e promover a inclusão social de famílias em situação de vulnerabilidade socioeconômica.</p><br><p>O programa foi lançado em 2011 com o objetivo de superar a miséria e garantir condições mínimas de vida digna para todos os brasileiros.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O Brasil Sem Miséria atua por meio de um conjunto de ações integradas que abrangem diversos aspectos da vida das famílias em situação de extrema pobreza.</p><br><p> O programa combina transferência de renda, acesso a serviços públicos, inclusão produtiva e mobilização social. As principais estratégias do Brasil Sem Miséria são:</p><br><p><strong>Transferência de renda: </strong>O programa fortalece a transferência de renda para as famílias mais pobres por meio do programa Bolsa Família, que oferece benefícios financeiros mensais com base na renda per capita e no número de membros da família.</p><br><p><br><strong>Acesso a serviços públicos: </strong>O Brasil Sem Miséria busca garantir o acesso das famílias em situação de extrema pobreza a serviços essenciais, como saúde, educação, assistência social, água, saneamento básico, energia elétrica, entre outros.</p><p><strong>Inclusão produtiva: </strong>O programa promove ações de capacitação profissional, qualificação e geração de emprego e renda para as famílias em situação de extrema pobreza. Essas ações visam possibilitar a inserção no mercado de trabalho, o empreendedorismo e o desenvolvimento de atividades produtivas.</p><br><p><strong>Mobilização social: </strong>O Brasil Sem Miséria busca fortalecer a participação e a organização das comunidades em situação de pobreza, estimulando a mobilização social, a participação cidadã e a construção de soluções coletivas para os problemas enfrentados.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O Brasil Sem Miséria é destinado às famílias em situação de extrema pobreza, ou seja, aquelas que possuem renda per capita inferior a um determinado valor estabelecido pelo programa.</p><br><p>Os critérios de elegibilidade são definidos pelo governo federal, considerando a renda familiar, a composição da família e outros fatores socioeconômicos.</p><br><p>As famílias que se enquadram nos critérios estabelecidos podem acessar os benefícios e serviços oferecidos pelo programa.</p><br><p>A participação no Brasil Sem Miséria ocorre por meio de cadastro e acompanhamento pelos órgãos responsáveis, como o Ministério da Cidadania e as prefeituras municipais.</p><br><p>É importante destacar que as ações do Brasil Sem Miséria são implementadas em parceria com diversos atores, como governos estaduais e municipais, organizações da sociedade civil, empresas e outros parceiros, buscando ampliar o alcance e os impactos do programa na redução da pobreza e da desigualdade social.</p><br><p>O Brasil Sem Miséria é uma importante iniciativa governamental que visa combater a extrema pobreza e promover a inclusão social de famílias em situação de vulnerabilidade socioeconômica.</p><br><p>Por meio de suas ações integradas, o programa busca garantir o acesso a recursos, serviços e oportunidades que contribuam para a superação da miséria e a melhoria das condições de vida das famílias mais vulneráveis do país.</p>"
              }
          ]
      },

      {
          "titulo": "Tarifa Social de Energia Elétrica",
          "subTitulo": "Descontos na conta de energia elétrica",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>A Tarifa Social de Energia Elétrica é um programa do governo brasileiro que oferece descontos na conta de energia elétrica para consumidores de baixa renda.</p><br><p>O objetivo do programa é promover o acesso à energia elétrica de forma mais acessível, contribuindo para a redução das desigualdades e o bem-estar das famílias em situação de vulnerabilidade socioeconômica.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>A Tarifa Social de Energia Elétrica funciona por meio da concessão de descontos na conta de energia elétrica para os consumidores de baixa renda cadastrados no programa.</p><br><p>O desconto é aplicado sobre o valor da tarifa de energia, proporcionando uma redução no valor a ser pago mensalmente.</p><br><p>Os descontos variam de acordo com a faixa de consumo de cada família e a classificação estabelecida pelo programa. As famílias de baixa renda podem receber descontos que variam de 10% a 65% sobre o valor total da conta de energia elétrica.</p><br><p>Para participar do programa, é necessário realizar o cadastro na distribuidora de energia elétrica responsável pela região onde o consumidor está localizado.</p><br><p>Cada distribuidora possui seus próprios critérios e procedimentos para o cadastramento no programa.</p><br><p>Geralmente, são exigidos documentos como comprovante de residência, documentos pessoais e comprovante de renda ou inscrição em programas sociais.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>Podem participar da Tarifa Social de Energia Elétrica as famílias de baixa renda que se enquadram nos critérios estabelecidos pelo programa. Os critérios podem variar, mas geralmente consideram:</p><br><p><strong>Renda familiar: </strong>O programa leva em conta a renda per capita familiar, ou seja, a renda dividida pelo número de pessoas que compõem a família. Os valores estabelecidos para a faixa de renda podem variar de acordo com a regulamentação de cada estado ou município.</p><br><p><strong>Cadastro em programas sociais: </strong>Em alguns casos, a participação em programas sociais, como o Bolsa Família, automaticamente qualifica a família para receber a Tarifa Social de Energia Elétrica, sem necessidade de realização de um novo cadastro.</p><br><p><strong>Beneficiários de programas específicos: </strong>Além do Bolsa Família, outras categorias de beneficiários de programas sociais também podem ter direito à Tarifa Social de Energia Elétrica, como famílias inscritas no Benefício de Prestação Continuada (BPC) e famílias em situação de rua.</p><br><p>É importante ressaltar que os critérios de elegibilidade podem variar de acordo com a regulamentação de cada distribuidora de energia elétrica e também podem sofrer alterações ao longo do tempo.</p><br><p>A Tarifa Social de Energia Elétrica é uma iniciativa que busca proporcionar descontos na conta de energia elétrica para famílias de baixa renda, contribuindo para a redução das desigualdades sociais e o acesso à energia elétrica de forma mais acessível.</p><br><p>O programa representa um apoio importante para as famílias em situação de vulnerabilidade socioeconômica, auxiliando na redução de suas despesas e promovendo maior inclusão social.</p>"
              }
          ]
      },

      {
          "titulo": "SUAS",
          "subTitulo": "Sistema Único de Assistência Social",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O SUAS (Sistema Único de Assistência Social) é um sistema público brasileiro que organiza e regula a oferta de serviços socio-assistenciais no país.</p><br><p>Ele foi criado com base nos princípios da Política Nacional de Assistência Social, estabelecida pela Lei Orgânica de Assistência Social (LOAS) em 1993.</p><br><p>O SUAS tem como objetivo promover a proteção social, garantindo o acesso a direitos e contribuindo para a melhoria das condições de vida das pessoas em situação de vulnerabilidade e risco social.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O SUAS funciona por meio da articulação entre diferentes entidades e níveis de governo (federal, estadual e municipal).</p><br><p>Ele estabelece diretrizes e normas para a organização, execução e financiamento das ações socioassistenciais, garantindo a oferta de serviços e benefícios que visam promover a inclusão social, a autonomia e o fortalecimento dos indivíduos e famílias.</p><br><p>O SUAS organiza os serviços socioassistenciais em três níveis de proteção:</p><br><p><strong>Proteção Social Básica: </strong>Oferece serviços de caráter preventivo e proativo, buscando fortalecer os vínculos familiares e comunitários. Exemplos de serviços são os Centros de Referência de Assistência Social (CRAS), que realizam atendimentos e ações socioeducativas junto às famílias e comunidades.</p><br><p><strong>Proteção Social Especial de Média Complexidade: </strong>Oferece serviços de apoio, orientação e acompanhamento mais intensivo para situações de vulnerabilidade e risco social moderado. Exemplos de serviços são os Centros de Referência Especializados de Assistência Social (CREAS), que atendem famílias e indivíduos em situação de violação de direitos.</p><br><p><strong>Proteção Social Especial de Alta Complexidade: </strong>Oferece serviços de acolhimento e atenção integral a indivíduos e famílias em situação de alta vulnerabilidade, com necessidade de cuidados especiais. Exemplos de serviços são os abrigos e casas de acolhida para crianças, adolescentes, idosos e pessoas em situação de rua.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>O SUAS é destinado a todas as pessoas que se encontram em situação de vulnerabilidade e risco social, independentemente de idade, gênero, etnia ou qualquer outra característica.</p><br><p>O sistema atende desde crianças e adolescentes até idosos, pessoas com deficiência, mulheres em situação de violência, pessoas em situação de rua, migrantes, entre outros.</p><br><p>As pessoas podem participar do SUAS ao buscar os serviços socio-assistenciais disponibilizados pelos órgãos responsáveis, como CRAS, CREAS, abrigos, centros de convivência, entre outros.</p><br><p>O acesso aos serviços é realizado de forma gratuita e, em alguns casos, pode ser necessário realizar um cadastro e atender aos critérios de elegibilidade estabelecidos pelos serviços.</p><br><p>O SUAS é financiado por recursos dos três níveis de governo (federal, estadual e municipal) e conta com a participação de profissionais da assistência social, gestores públicos, trabalhadores sociais e da sociedade civil organizada para a efetivação das ações socio-assistenciais.</p><br><p>O SUAS desempenha um papel essencial na promoção da proteção social e no combate às desigualdades sociais no Brasil.</p><br><p>Por meio de sua estrutura organizada e integrada, busca garantir o acesso a serviços e benefícios que visam a melhoria das condições de vida das pessoas em situação de vulnerabilidade, promovendo a inclusão social e o exercício pleno da cidadania.</p>"
              }
          ]
      },

      {
          "titulo": "Programa Bolsa Verde",
          "subTitulo": "Conservação e preservação ambiental",
          "topicos": [
              {
                  "titulo": "O que é?",
                  "imagem": "o-que-e.png",
                  "texto": "<p>O Programa Bolsa Verde é uma iniciativa do governo brasileiro que busca promover a conservação ambiental e a melhoria das condições de vida de famílias em situação de extrema pobreza que vivem em áreas de preservação ambiental ou de influência de unidades de conservação.</p><br><p>O programa oferece um benefício financeiro mensal para incentivar ações de conservação e preservação ambiental realizadas por essas famílias.</p>"
              },
              {
                  "titulo": "Como funciona",
                  "imagem": "como-funciona.png",
                  "texto": "<p>O Programa Bolsa Verde funciona por meio da transferência de recursos financeiros diretamente para as famílias beneficiárias.</p><br><p>Essas famílias são selecionadas com base em critérios socioeconômicos e pelo local onde residem, em áreas de preservação ambiental ou influência de unidades de conservação.</p><br><p>O benefício financeiro, conhecido como Bolsa Verde, é concedido mensalmente às famílias selecionadas e serve como um estímulo para que elas adotem práticas de conservação e preservação ambiental, como a proteção de nascentes, a recuperação de áreas degradadas, o manejo sustentável de recursos naturais, entre outras ações que contribuam para a proteção do meio ambiente.</p><br><p>Além do benefício financeiro, o programa também oferece apoio técnico e capacitação para as famílias, visando fortalecer suas práticas de conservação ambiental e promover o desenvolvimento sustentável das comunidades.</p>"
              },
              {
                  "titulo": "Quem pode participar?",
                  "imagem": "quem-pode-participar.png",
                  "texto": "<p>Podem participar do Programa Bolsa Verde as famílias em situação de extrema pobreza que residem em áreas de preservação ambiental ou em locais próximos a unidades de conservação.</p><br><p>A seleção das famílias é feita com base em critérios socioeconômicos estabelecidos pelo programa.</p><br><p>O critério principal é o enquadramento no perfil de extrema pobreza, levando em consideração a renda per capita da família.</p><br><p>Além disso, é necessário que a família esteja em conformidade com as condicionalidades estabelecidas pelo programa, como o cumprimento da frequência escolar obrigatória para as crianças e adolescentes.</p><br><p>A seleção das famílias é realizada pelos órgãos responsáveis pelo programa, como o Ministério do Meio Ambiente e os órgãos estaduais e municipais de meio ambiente, em parceria com o Ministério da Cidadania.</p><br><p>O Programa Bolsa Verde é uma iniciativa que busca conciliar a conservação ambiental com a promoção da inclusão social e redução da pobreza.</p><br><p>Ao incentivar a adoção de práticas sustentáveis pelas famílias beneficiárias, o programa contribui para a proteção do meio ambiente e o fortalecimento das comunidades que vivem em áreas de preservação ambiental ou influência de unidades de conservação.</p>"
              }
          ]
      }

  ]
  ''';

  dynamic jsonData = jsonDecode(jsonString);

  return jsonData;
}

List<String> setCalendarioGeral(
  String mes,
  String tipoDado,
) {
  List<String> dados = [];

  switch (mes) {
    case 'Janeiro':
      if (tipoDado == 'datas') {
        dados = [
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4'
        ];
      } else {
        dados = [
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          'xxx',
          'xxx',
          'xxx',
          'xxx'
        ];
      }
      return dados;

    case 'Fevereiro':
      if (tipoDado == 'datas') {
        dados = [
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '1',
          '2',
          '3',
          '4',
          '5'
        ];
      } else {
        dados = [
          'xxx',
          'xxx',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx'
        ];
      }
      return dados;

    case 'Março':
      if (tipoDado == 'datas') {
        dados = [
          '26',
          '27',
          '28',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1'
        ];
      } else {
        dados = [
          'xxx',
          'xxx',
          'xxx',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          'xxx'
        ];
      }
      return dados;

    case 'Abril':
      if (tipoDado == 'datas') {
        dados = [
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6'
        ];
      } else {
        dados = [
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          '',
          '',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx'
        ];
      }
      return dados;

    case 'Maio':
      if (tipoDado == 'datas') {
        dados = [
          '30',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3'
        ];
      } else {
        dados = [
          'xxx',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          'xxx',
          'xxx',
          'xxx'
        ];
      }
      return dados;

    case 'Junho':
      if (tipoDado == 'datas') {
        dados = [
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '1'
        ];
      } else {
        dados = [
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          '',
          '',
          '',
          '',
          'Início das inscrições para o Enem 2023',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Último dia das inscrições para o Enem 2023',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          'xxx'
        ];
      }
      return dados;

    case 'Julho':
      if (tipoDado == 'datas') {
        dados = [
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5'
        ];
      } else {
        dados = [
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx'
        ];
      }
      return dados;

    case 'Agosto':
      if (tipoDado == 'datas') {
        dados = [
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2'
        ];
      } else {
        dados = [
          'xxx',
          'xxx',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          'xxx',
          'xxx'
        ];
      }
      return dados;

    case 'Setembro':
      if (tipoDado == 'datas') {
        dados = [
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30'
        ];
      } else {
        dados = [
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          ''
        ];
      }
      return dados;

    case 'Outubro':
      if (tipoDado == 'datas') {
        dados = [
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4'
        ];
      } else {
        dados = [
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          'xxx',
          'xxx',
          'xxx',
          'xxx'
        ];
      }
      return dados;

    case 'Novembro':
      if (tipoDado == 'datas') {
        dados = [
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '1',
          '2'
        ];
      } else {
        dados = [
          'xxx',
          'xxx',
          'xxx',
          '',
          '',
          '',
          '',
          'Primeiro dia de aplicação da prova do Enem 2023',
          '',
          '',
          '',
          '',
          '',
          '',
          'Segundo dia de aplicação da prova do Enem 2023',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          'xxx',
          'xxx'
        ];
      }
      return dados;

    case 'Dezembro':
      if (tipoDado == 'datas') {
        dados = [
          '26',
          '27',
          '28',
          '29',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
          '11',
          '12',
          '13',
          '14',
          '15',
          '16',
          '17',
          '18',
          '19',
          '20',
          '21',
          '22',
          '23',
          '24',
          '25',
          '26',
          '27',
          '28',
          '29',
          '30',
          '31',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6'
        ];
      } else {
        dados = [
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 1',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 2',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 3',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 4',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 5',
          '',
          '',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 6',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 7',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 8',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 9',
          'Saque do Bolsa Família para aqueles com o NIS de final n° 0',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx',
          'xxx'
        ];
      }
      return dados;

    default:
      return dados;
  }
}

String getMesAtual() {
  // DateTime now = DateTime.now();
  // String monthName = DateFormat('MMMM', 'pt_BR')
  //     .format(now); // 'pt_BR' for Portuguese language
  // return monthName;

  final now = DateTime.now().toUtc().subtract(Duration(hours: 3));
  final formatter = DateFormat.MMMM('pt_BR');
  return formatter.format(now);
}

int getIndexList(
  List<String> lista,
  String item,
) {
  return lista.indexOf(item);
}

String getMascara(String text) {
  return text.replaceAll(
      RegExp(r'[^\d]'), ''); // Remove todos os caracteres que não são dígitos
}

String getProximoPagamento() {
  final now = DateTime.now();
  final proximoMes = DateTime(now.year, now.month + 1);
  //return DateFormat('MMMM "de" y (MM/yyyy)').format(proximoMes);

  return DateFormat('MMMM').format(proximoMes) +
      ' de ' +
      DateFormat('y').format(proximoMes) +
      ' (' +
      DateFormat('MM/yyyy').format(proximoMes) +
      ')';
}

String formataDataParcela(String data) {
  String ano = data.substring(0, 4);
  String mes = data.substring(4);

  String nomeMes;
  switch (mes) {
    case "01":
      nomeMes = "Janeiro";
      break;
    case "02":
      nomeMes = "Fevereiro";
      break;
    case "03":
      nomeMes = "Março";
      break;
    case "04":
      nomeMes = "Abril";
      break;
    case "05":
      nomeMes = "Maio";
      break;
    case "06":
      nomeMes = "Junho";
      break;
    case "07":
      nomeMes = "Julho";
      break;
    case "08":
      nomeMes = "Agosto";
      break;
    case "09":
      nomeMes = "Setembro";
      break;
    case "10":
      nomeMes = "Outubro";
      break;
    case "11":
      nomeMes = "Novembro";
      break;
    case "12":
      nomeMes = "Dezembro";
      break;
    default:
      nomeMes = "Mês inválido";
  }

  return nomeMes + " de " + ano;
}

double formataValorParcela(String valor) {
  double valorDouble = double.parse(valor);
  return valorDouble;
}

List<int> calculoBolsa(
  String sMembros,
  int renda,
  String sMembros7,
  String sMembros18,
  String gravida,
) {
  int membros = int.parse(sMembros);
  int membros7 = int.parse(sMembros7);
  int membros18 = int.parse(sMembros18);

  int rendaPerCapita = (renda / membros).toInt();
  int beneficioTotal = 0;

  // retorna 0 se a renda per capta for maior que 218
  if (rendaPerCapita > 218) {
    List<int> l = [0];
    return l;
  }

  // primeira infancia
  // pago 150 por crianca de ate 7 anos
  int primeiraInfancia = 0;
  if (membros7 > 0) {
    primeiraInfancia = primeiraInfancia + (membros7 * 150);
  }

  // renda cidadania
  // pago para todos integrantes da familia 142 por membro
  int cidadania = 0;
  if (membros > 0) {
    cidadania = cidadania + (membros * 142);
  }

  // varivel familia
  // pago 50 por integrante de 7 ate 18 anos, ou gravidas
  int variavelFamilia = 0;
  if ((gravida == 'Sim') && (membros18 > 0)) {
    if (gravida == 'Sim') {
      membros18 = membros18 + 1;
    }
    variavelFamilia = variavelFamilia + (membros18 * 50);
  }

  // calcula o beneficio total
  beneficioTotal = primeiraInfancia + cidadania + variavelFamilia;

  // se o beneficio nao atingir 600, vai ser completado ate 600
  if (beneficioTotal < 600) {
    beneficioTotal = 600;
  }

  List<int> l = [beneficioTotal, cidadania, primeiraInfancia, variavelFamilia];

  return l;
}
