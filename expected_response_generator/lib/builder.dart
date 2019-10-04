library http_response.builder;

import 'package:build/build.dart';
import 'package:expected_response_generator/src/expected_response_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateHttpResponder(BuilderOptions options) => SharedPartBuilder([ExpectResponseGenerator()], 'expect_response');