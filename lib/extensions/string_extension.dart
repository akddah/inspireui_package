import '../utils/colors.dart';
import '../utils/regex_utils.dart';

extension StringExtensions on String {
  bool get hasOnlyWhitespaces => trim().isEmpty && isNotEmpty;

  bool get isListView => this != 'horizontal';

  String toSpaceSeparated() {
    final value =
        replaceAllMapped(RegExp(r'.{4}'), (match) => '${match.group(0)} ');
    return value;
  }

  String formatCopy() {
    return replaceAll('},', '\n},\n')
        .replaceAll('[{', '[\n{\n')
        .replaceAll(',"', ',\n"')
        .replaceAll('{"', '{\n"')
        .replaceAll('}]', '\n}\n]');
  }

  bool get isNoInternetError => contains('SocketException: Failed host lookup');

  Uri? toUri() => Uri.tryParse(this);

  String capitalize() {
    if (length <= 1) {
      return toUpperCase();
    }

    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String upperCaseFirstChar() {
    if (length <= 1) {
      return toUpperCase();
    }

    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String toTitleCase() =>
      split(' ').map((str) => str.upperCaseFirstChar()).join(' ');

  RoutingData get getRoutingData {
    final uriData = Uri.parse(this);
    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }

  bool get isEmail => validateEmail();

  String removeLeadingZeros() {
    for (var i = 0; i < length; i++) {
      if (this[i] != '0') {
        return substring(i);
      }
    }
    return '0';
  }

  String clearExceptionKey() {
    return replaceAll('Exception: ', '');
  }
}

extension NullableStringExtensions on String? {
  bool get isEmptyOrNull {
    return this?.isEmpty ?? true;
  }

  bool get isNotNullAndNotEmpty => !isEmptyOrNull;

  bool get isURL {
    final url = this;
    if (url == null) {
      return false;
    }
    return url.startsWith('http') || url.startsWith('https');
  }

  HexColor? toColor() {
    if (isEmptyOrNull) {
      return null;
    }

    return HexColor(this);
  }

  bool validateEmail() {
    final copy = this;
    if (copy == null || copy.isEmpty || copy.contains(' ')) {
      return false;
    }
    return RegexUtils.check(copy, RegexUtils.email, caseSensitive: false);
  }
}

class RoutingData {
  final String? route;
  final Map<String, String>? _queryParameters;

  RoutingData({
    this.route,
    Map<String, String>? queryParameters,
  }) : _queryParameters = queryParameters;

  String? getPram(String key) => _queryParameters![key];
}
