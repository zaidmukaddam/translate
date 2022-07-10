import 'dart:convert';

import 'package:arna/arna.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '/db/history_db.dart';
import '/providers.dart';
import '/strings.dart';

Future<void> translate(
  BuildContext context,
  String sourceKey,
  String targetKey,
  String query,
  WidgetRef ref,
) async {
  if (query.isEmpty) {
    return;
  }

  ref.read(outputProvider.notifier).state = null;
  try {
    final http.Response response = await http.get(
      Uri.https('lingva.ml', '/api/v1/$sourceKey/$targetKey/$query'),
    );

    if (response.statusCode != 200) {
      showArnaSnackbar(
        context: context,
        message: '${Strings.error} Error code: ${response.statusCode}',
      );
      ref.read(outputProvider.notifier).state = '';
      return;
    }

    final String? translation =
        // ignore: avoid_dynamic_calls
        json.decode(response.body)['translation'] as String?;

    if (translation == null) {
      showArnaSnackbar(
        context: context,
        message: Strings.error,
      );
      ref.read(outputProvider.notifier).state = '';
      return;
    }

    HistoryDB.instance.add(query, translation);
    ref.read(outputProvider.notifier).state = translation;
  } catch (_) {}
}
