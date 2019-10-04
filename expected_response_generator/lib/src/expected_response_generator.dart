import 'dart:async';

import 'package:expected_response/expected_response.dart';

import './entry_function_creator.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class ExpectResponseGenerator extends GeneratorForAnnotation<ExpectedResponse> {
  
  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      final name = element.name;
      throw InvalidGenerationSourceError('Generator cannot target `$name`.',
          todo: 'Remove the HttpResponse annotation from `$name`.',
          element: element);
    }
    final ClassElement classElement = element;
    final DartObject obj = annotation.objectValue;
    return EntryFunctionCreator(classElement).generate(obj);
  }
}