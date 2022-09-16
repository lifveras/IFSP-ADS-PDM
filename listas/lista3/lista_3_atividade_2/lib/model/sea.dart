class Sea {
  final String _name;
  final String _description;
  final String _picture;
  bool _favorite;

  Sea(this._name, this._description, this._picture) : this._favorite = false;

  String get name => _name;
  String get description => _description;
  String get picture => _picture;
  bool get favorite => _favorite;
  void set favorite(bool favorite) {
    _favorite = favorite;
  }
}
