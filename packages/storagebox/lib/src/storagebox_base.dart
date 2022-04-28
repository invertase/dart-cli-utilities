/*
 * Copyright (c) 2020-present Invertase Limited & Contributors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this library except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import 'package:collection/collection.dart' as collection;

class StorageBoxImplementationBase<K, T>
    implements collection.DelegatingMap<K, T> {
  StorageBoxImplementationBase(
    this.id, {
    Map<K, T>? defaults,
  }) {
    this.defaults = defaults ?? <K, T>{};
  }

  final String id;

  late Map<K, T> defaults;

  Map<K, T> get delegate {
    throw UnimplementedError();
  }

  set delegate(Map<K, T> updatedMap) {
    throw UnimplementedError();
  }

  @override
  T? operator [](Object? key) {
    return delegate[key];
  }

  @override
  void operator []=(K key, T value) {
    delegate = {
      ...delegate,
      key: value,
    };
  }

  @override
  void addAll(Map<K, T> other) {
    delegate = Map<K, T>.from(delegate)..addAll(other);
  }

  @override
  void addEntries(Iterable<MapEntry<K, T>> entries) {
    delegate = Map<K, T>.from(delegate)..addEntries(entries);
  }

  @override
  Map<K2, V2> cast<K2, V2>() {
    return delegate.cast<K2, V2>();
  }

  @override
  void clear() {
    delegate = {};
  }

  @override
  bool containsKey(Object? key) {
    return delegate.containsKey(key);
  }

  @override
  bool containsValue(Object? value) {
    return delegate.containsValue(value);
  }

  @override
  Iterable<MapEntry<K, T>> get entries => delegate.entries;

  @override
  void forEach(void Function(K key, T value) f) {
    delegate.forEach(f);
  }

  @override
  bool get isEmpty => delegate.isEmpty;

  @override
  bool get isNotEmpty => delegate.isNotEmpty;

  @override
  Iterable<K> get keys => delegate.keys;

  @override
  int get length => delegate.length;

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K key, T value) transform) {
    return delegate.map<K2, V2>(transform);
  }

  @override
  T putIfAbsent(K key, T Function() ifAbsent) {
    final updatedMap = {
      ...delegate,
    };
    final returnedValue = updatedMap.putIfAbsent(
      key,
      ifAbsent,
    );
    delegate = updatedMap;
    return returnedValue;
  }

  @override
  T? remove(Object? key) {
    final updatedMap = {
      ...delegate,
    };
    final removedValue = updatedMap.remove(
      key,
    );
    delegate = updatedMap;
    return removedValue;
  }

  @override
  void removeWhere(bool Function(K key, T value) test) {
    delegate = delegate..removeWhere(test);
  }

  @override
  Map<K2, V2> retype<K2, V2>() {
    return cast<K2, V2>();
  }

  @override
  T update(K key, T Function(T value) update, {T Function()? ifAbsent}) {
    final updatedMap = {
      ...delegate,
    };
    final updatedValue = updatedMap.update(
      key,
      update,
      ifAbsent: ifAbsent,
    );
    delegate = updatedMap;
    return updatedValue;
  }

  @override
  void updateAll(T Function(K key, T value) update) {
    delegate = delegate..updateAll(update);
  }

  @override
  Iterable<T> get values => delegate.values;

  @override
  String toString() {
    return delegate.toString();
  }

  @override
  bool operator ==(Object other) {
    return other is StorageBoxImplementationBase && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
