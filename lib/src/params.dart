class Params {
  final String api_key;
  final String base;
  final String symbols;
  final bool show_alternative;
  final bool pretty_print;
  Params({this.api_key=null,
    this.base='USD',
    this.symbols='JPY,TWD',
    this.show_alternative=false,
    this.pretty_print=false});

}