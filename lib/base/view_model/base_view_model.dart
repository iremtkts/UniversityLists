import 'dart:async';

import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool _isDisposed = false;
  bool _isInitializedDone = false;

  FutureOr<void> _initState;
  FutureOr<void> init();

  BaseViewModel() {
    _init();
  }

  void _init() async {
    _isLoading = true;
    _initState = init();
    await _initState;
    _isInitializedDone = true;
    _isLoading = false;
  }

  void changeStatus() => isLoading = !isLoading;

  void reloadState() {
    if (!isLoading) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  FutureOr<void> get initState => _initState;


  bool get isLoading => _isLoading;
  bool get isDisposed => _isDisposed;
  bool get isInitialized => _isInitializedDone;

  set isLoading(bool value) {
    _isLoading = value;
    scheduleMicrotask(() {
      if (!_isDisposed) notifyListeners();
    });
  }
}
