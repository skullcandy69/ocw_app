// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TransactionState extends TransactionState {
  @override
  final BuiltMap<String, Transaction> transactions;
  @override
  final bool isLoading;

  factory _$TransactionState(
          [void Function(TransactionStateBuilder) updates]) =>
      (new TransactionStateBuilder()..update(updates)).build();

  _$TransactionState._({this.transactions, this.isLoading}) : super._();

  @override
  TransactionState rebuild(void Function(TransactionStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionStateBuilder toBuilder() =>
      new TransactionStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionState &&
        transactions == other.transactions &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, transactions.hashCode), isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransactionState')
          ..add('transactions', transactions)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class TransactionStateBuilder
    implements Builder<TransactionState, TransactionStateBuilder> {
  _$TransactionState _$v;

  MapBuilder<String, Transaction> _transactions;
  MapBuilder<String, Transaction> get transactions =>
      _$this._transactions ??= new MapBuilder<String, Transaction>();
  set transactions(MapBuilder<String, Transaction> transactions) =>
      _$this._transactions = transactions;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  TransactionStateBuilder();

  TransactionStateBuilder get _$this {
    if (_$v != null) {
      _transactions = _$v.transactions?.toBuilder();
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TransactionState;
  }

  @override
  void update(void Function(TransactionStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransactionState build() {
    _$TransactionState _$result;
    try {
      _$result = _$v ??
          new _$TransactionState._(
              transactions: _transactions?.build(), isLoading: isLoading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'transactions';
        _transactions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TransactionState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
