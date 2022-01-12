class GerenciaDeEstado<T> {
  T _state;
  final List<Function(T state)> _onChanges = [];
  GerenciaDeEstado(this._state);
  T get state => _state;
  void modify(T state) {
    _state = state;
    _update();
    listen((state) => state);
  }

  _update() {
    for (int i = 0; i < _onChanges.length; i++) {
      _onChanges[i](_state);
    }
  }

  void listen(Function(T state) onChange) {
    _onChanges.add(onChange);
  }
}
