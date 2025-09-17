import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/card_model.dart';
import 'add_card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardState(cards: [])) {
    _loadCards();
  }

  static const _storageKey = 'saved_cards';

  void addCard(CreditCard card) async {
    final updatedList = [...state.cards, card];
    emit(CardState(cards: updatedList));
    await _saveCards(updatedList);
  }

  void removeCard(CreditCard card) async {
    final updatedList = [...state.cards]..remove(card);
    emit(CardState(cards: updatedList));
    await _saveCards(updatedList);
  }

  Future<void> _saveCards(List<CreditCard> cards) async {
    final prefs = await SharedPreferences.getInstance();
    final cardListJson =
        cards.map((card) => jsonEncode(card.toJson())).toList();
    await prefs.setStringList(_storageKey, cardListJson);
  }

  Future<void> _loadCards() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCardsJson = prefs.getStringList(_storageKey);
    if (savedCardsJson != null) {
      final loadedCards =
          savedCardsJson
              .map((jsonCard) => CreditCard.fromJson(jsonDecode(jsonCard)))
              .toList();
      emit(CardState(cards: loadedCards));
    }
  }
}
