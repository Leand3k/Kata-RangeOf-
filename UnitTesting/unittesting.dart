import 'dart:io';
import 'package:test/test.dart';

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

void main(List<String> args) {
  Range rango = new Range();
  List resultado = new List();
  String inter = '[2,5)';
  String another = '[2,5)';
  List f = (rango.AddRange(inter));
  if (inter[0] == '(') {
    f.first += 1;
  }
  if (inter[inter.length - 1] == ')') {
    // f.removeLast();
    f.last -= 1;
  }

  test('Testing AddRange', () {
    resultado.add(2);
    resultado.add(5);

    String expected = '[2,5)';

    var actual = rango.AddRange(expected);

    expect(actual, resultado);
  });

  test('Testing getAllPoints', () {
    var expected = [2, 3, 4];
    var actual = rango.getAllPoints(f);

    expect(actual, expected);
  });

  test('Testing ContainsRange', () {
    var expected = 'No lo contiene, tio!';
    var actual = rango.ContainsRange(f, rango.AddRange((another)));

    expect(actual, expected);
  });

  test('Testing endPoints', () {
    var expected = '{2, 5}';
    var actual = rango.endPoints(inter);

    expect(actual, expected);
  });

  test('Testing overlapsRange', () {
    var expected = 'No lo solapa, tio!';
    var actual = rango.overlapsRange(f, rango.AddRange(another));

    expect(actual, expected);
  });

  test('Testing Equals', () {
    var expected = 'No son iguales, tio!';
    var actual = rango.Equals(f, rango.AddRange(another));

    expect(actual, expected);
  });
}
