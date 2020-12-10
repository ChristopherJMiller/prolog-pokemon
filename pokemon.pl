:- ensure_loaded(types).
:- ensure_loaded(matchups).

pokemon(T) :-
  is_list(T),
  length(T, 2),
  T = [T1, T2],
  type(T1),
  type(T2),
  pair(T1, T2).
pokemon(T) :-
  is_list(T),
  length(T, 1),
  T = [Type],
  type(Type),
  pair(Type, Type).

team([]).
team([F|B]) :-
  is_list(B),
  pokemon(F),
  team(B).

pokemonResistsAndWeaknesses([], [], []).
pokemonResistsAndWeaknesses(T, R, W) :-
  pokemon(T),
  T = [F|B],
  !,
  typeResists(F, Resists),
  typeWeakTo(F, Weaknesses),
  pokemonResistsAndWeaknesses(B, TR, TW),
  !,
  append(Resists, TR, FullRList),
  append(Weaknesses, TW, FullWList),
  sort(FullRList, RSet),
  sort(FullWList, WSet),
  !,
  cancelWeaknessResists(RSet, WSet, R),
  cancelWeaknessResists(WSet, RSet, W),
  !.
pokemonResistsAndWeaknesses(T, R, W) :-
  \+ is_list(T),
  pokemon(T),
  !,
  pokemonResistsAndWeaknesses([T], R, W).

teamResistsAndWeaknesses([], [], []).
teamResistsAndWeaknesses(T, R, W) :-
  team(T),
  T = [F|B],
  pokemonResistsAndWeaknesses(F, PR, PW),
  teamResistsAndWeaknesses(B, TR, TW),
  append(PR, TR, R),
  append(PW, TW, W).

teamTypeCovered(T) :-
  teamResistsAndWeaknesses(T, R, _W),
  member(normal, R),
  member(fire, R),
  member(water, R),
  member(electric, R),
  member(grass, R),
  member(ice, R),
  member(fighting, R),
  member(poison, R),
  member(ground, R),
  member(flying, R),
  member(psychic, R),
  member(bug, R),
  member(rock, R),
  member(ghost, R),
  member(dragon, R),
  member(dark, R),
  member(steel, R),
  member(fairy, R).