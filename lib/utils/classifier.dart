import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  final _modelFile = 'model.tflite';
  final _vocabFile = 'vocab.txt';

  final int _sentenceLen = 256;

  final String start = '<START>';
  final String pad = '<PAD>';
  final String unk = '<UNKNOWN>';

  late Map<String, int> _dict;
  late Interpreter _interpreter;

  Classifier() {
    _loadModel();
    _loadDictionary();
  }

  void _loadModel() async {
    _interpreter = await Interpreter.fromAsset(_modelFile);
  }

  void _loadDictionary() async {
    final vocab = await rootBundle.loadString('assets/$_vocabFile');
    var dict = <String, int>{};
    final vocabList = vocab.split('\n');
    for (var i = 0; i < vocabList.length; i++) {
      var entry = vocabList[i].trim().split(' ');
      dict[entry[0]] = int.parse(entry[1]);
    }
    _dict = dict;
  }

  List<double> classify(String rawText) {
    List<List<int>> input = tokenizeInputText(rawText);
    var output = List<int>.filled(2, 0).reshape([1, 2]);
    _interpreter.run(input, output);

    return [output[0][0], output[0][1]];
  }

  List<List<int>> tokenizeInputText(String text) {
    final tokens = text.split(' ');
    var vec = List<int>.filled(_sentenceLen, _dict[pad]!.toInt());

    var index = 0;
    if (_dict.containsKey(start)) {
      vec[index++] = _dict[start]!.toInt();
    }

    for (var tok in tokens) {
      if (index > _sentenceLen) {
        break;
      }
      vec[index++] = _dict.containsKey(tok)
          ? _dict[tok]!.toInt()
          : _dict[unk]!.toInt();
    }

    return [vec];
  }
}