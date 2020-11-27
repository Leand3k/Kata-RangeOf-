import 'dart:io';
import '../UnitTesting/unittesting.dart';
import 'package:testingdart/testingdart.dart' as testingdart;
import 'package:test/test.dart';
import 'dart:convert';

//always use "dart" and then file to run it!!!

void main(List<String> arguments) {
  Range rango = new Range();

  String inter = '[2,5)';
  String another = '[2,5)';
  List f = (rango.AddRange(inter));

  print('Equals: ${rango.Equals(f, rango.AddRange(another))}');

  if (inter[0] == '(') {
    f.first += 1;
  }
  if (inter[inter.length - 1] == ')') {
    // f.removeLast();
    f.last -= 1;
  }
  // print('getAllPoints: ');
  print('AddRange: ${rango.AddRange(inter)}');
  print('getAllpoints: ${(rango.getAllPoints(f))}');
  print('endPoints: ${rango.endPoints(inter)}');
  print('containsRange: ${rango.ContainsRange(f, rango.AddRange(another))}');
  print('overlapsRange: ${rango.overlapsRange(f, rango.AddRange(another))}');
}

class Range {
  List AddRange(String Interval) {
    var x = Interval.split(',');
    var i;
    var p = new List();

    for (int o = 0; o < x.length; o++) {
      i = x[o]
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll('(', '')
          .replaceAll(')', '');
      p.add(int.parse(i));
    }

    return p;
  }

  List getAllPoints(List v) {
    //[3,8)  = {3,4,5,6,7}
    var x = new List();

    for (int i = v.first; i <= v.last; i++) {
      x.add(i);
    }

    return x;
  }

  String ContainsRange(List base, List nuevo) {
    String respuesta;
    if (base.first <= nuevo.first && nuevo.last <= base.last) {
      respuesta = 'Si lo contiene!';
    } else {
      respuesta = 'No lo contiene, tio!';
    }
    return respuesta;
  }

  String endPoints(String Interval) {
    var x = Interval.split(',');
    var i;
    var p = new List();

    for (int o = 0; o < x.length; o++) {
      i = x[o]
          .replaceAll('[', '{')
          .replaceAll(']', '}')
          .replaceAll('(', '{')
          .replaceAll(')', '}');
      p.add(i);
    }

    return p.toString().replaceAll('[', '').replaceAll(']', '');
  }

  String overlapsRange(List base, List nuevo) {
    String respuesta;
    if (base.first > nuevo.first && nuevo.last < base.last) {
      respuesta = 'Si lo solapa!';
    } else {
      respuesta = 'No lo solapa, tio!';
    }
    return respuesta;
  }

  String Equals(List base, List nuevo) {
    String respuesta;
    if (base.first == nuevo.first && nuevo.last == base.last) {
      respuesta = 'Si son iguales!';
    } else {
      respuesta = 'No son iguales, tio!';
    }
    return respuesta;
  }
}
