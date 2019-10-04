import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';

class EntryFunctionCreator {
  EntryFunctionCreator(this.classObject);

  final ClassElement classObject;

  String generate(DartObject annotation) {
    final List<DartObject> allowedCodes = annotation.getField('allowedCodes').toListValue();
    StringBuffer stringFunc = StringBuffer();
    final MethodElement entryFunction = findFunction('EntryFunction');
    if (entryFunction != null) {
      stringFunc.write('void _buildResponse(${classObject.displayName} me, ${entryFunction.parameters[0].type} params) async {\n');
      final MethodElement requestFunction = findFunction('Request');
      stringFunc.write('try {\n');
      stringFunc.write('final ServerResponse response = await me.${requestFunction.displayName}(params);\n');
      stringFunc.write('switch(response.statusCode) {\n');
      stringFunc.write(createCases(allowedCodes));
      stringFunc.write('}\n');
      stringFunc.write('} catch(e) {\n');
      stringFunc.write('me.defaultError(e);\n');
      stringFunc.write('}\n');
      stringFunc.write('return null;');
      stringFunc.write('}');
    }
    return stringFunc.toString();
  }

  MethodElement findFunction(String name) {
    MethodElement method;
    for (method in classObject.methods) {
      if (method.metadata.any((ElementAnnotation annotation) {
          DartObject obj = annotation.computeConstantValue();
          return obj.type.toString() == name;
        })
      ) {
          return method;
      }
    }
    return null;
  }

  MethodElement findFunctionForCode(int code) {
    MethodElement method;
    for (method in classObject.methods) {
      if (method.metadata.any((ElementAnnotation annotation) {
          DartObject obj = annotation.computeConstantValue();
          return obj.type.toString() == 'Response' && obj.getField('code').toIntValue() == code;
        })
      ) {
        return method;
      }
    }
    return null;
  }

  String createCases(List<DartObject> codes) {
    StringBuffer buffer = StringBuffer();
    DartObject code;
    for (code in codes) {
      int intCode = code.toIntValue();
      MethodElement method = findFunctionForCode(intCode);
      if (method != null) {
        buffer.write('case $intCode:\n');
        buffer.write('me.${method.displayName}(response, params);\n');
        buffer.write('break;\n');
      } else {
        buffer.write('case $intCode:\n');
        buffer.write('me.response$intCode(response, params);\n');
        buffer.write('break;\n');
      }
    }
    buffer.write('default:\n');
    buffer.write('me.defaultResponse(response, params);\n');
    buffer.write('break;\n');
    return buffer.toString();
  }
}