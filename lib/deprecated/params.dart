class Params {
  final String api_key;
  final String base;
  final String symbols;
  final String date;
  final bool show_alternative;
  final bool prettyprint;
  final bool show_inactive;

  Params(
      {this.api_key = null,
      this.base = null,
      this.symbols = null,
      this.date = null,
      this.show_alternative = null,
      this.prettyprint = null,
      this.show_inactive = null});
}
