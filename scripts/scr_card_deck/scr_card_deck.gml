// Script assets have changed for v2.3.0 see
function Card(_rank = noone, _suit = noone) constructor {
	get_rank_name = function() {
		if (rank >= 2 && rank <= 10) {
			return string(rank);	
		} else if (rank == 11) {
			return "Jack";	
		} else if (rank == 12) {
			return "Queen";	
		} else if (rank == 13) {
			return "King";	
		} else if (rank == 14) {
			return "Ace";	
		} else if (rank == 15) {
			return "Joker";	
		}
		
		return "Error";
	}
	
	get_suit_name = function() {
		if (rank < 15) {
			var _suits = ["Clubs", "Diamonds", "Hearts", "Spades"];
			return _suits[suit];
		} else if (suit == 1) {
			return "Black";
		} else if (suit == 2) {
			return "Red";	
		}
		
		return "Error";
	}
	
	get_card_name = function() {
		if (rank < 15) {
			return 	get_rank_name() + " of " + get_suit_name();
		} else {
			return get_suit_name() + " " + get_rank_name();	
		}
	}
	
	rank = _rank;
	suit = _suit;
	name = get_card_name();
}

function CardDeck() constructor {
	deck = [];
	
	reset = function() {
		deck = [];
		
		var _ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14];
		var _suits = [0,1,2,3];
		
		for (var _suit_index=0; _suit_index<array_length(_suits); _suit_index++) {
			for (var _rank_index=0; _rank_index<array_length(_ranks); _rank_index++) {
				var _card = new Card(_ranks[_rank_index],  _suits[_suit_index]);
				array_push(deck, _card);
			}
		}
		
		var _black_joker = new Card(15, 1);
		array_push(deck, _black_joker);
		
		var _red_joker = new Card(15, 2);
		array_push(deck, _red_joker);
	}
	
	shuffle = function() {
		deck = array_shuffle(deck);	
	}
	
	compare_cards_asc = function(_card1, _card2) {
		if (_card1.rank != _card2.rank) {
			return _card1.rank - _card2.rank;	
		} else {
			return _card1.suit - _card2.suit;	
		}
	}
	
	sort_asc = function() {
		array_sort(deck, compare_cards_asc);
	}
	
	compare_cards_desc = function(_card1, _card2) {
		return -compare_cards_asc(_card1, _card2);
	}
	
	sort_desc = function() {
		array_sort(deck, compare_cards_desc);
	}
	
	reset();
}