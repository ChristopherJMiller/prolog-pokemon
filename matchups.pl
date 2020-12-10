:- ensure_loaded(types).

/* Super Effective Matchups */

superEffective(fighting, normal).

superEffective(water, fire).
superEffective(ground, fire).
superEffective(rock, fire).

superEffective(electric, water).
superEffective(grass, water).

superEffective(ground, electric).

superEffective(fire, grass).
superEffective(poison, grass).
superEffective(flying, grass).
superEffective(bug, grass).
superEffective(ice, grass).

superEffective(fire, ice).
superEffective(fighting, ice).
superEffective(rock, ice).
superEffective(steel, ice).

superEffective(flying, fighting).
superEffective(psyhic, fighting).
superEffective(fairy, fighting).

superEffective(grass, poison).
superEffective(ice, poison).

superEffective(grass, ground).
superEffective(bug, ground).

superEffective(electric, flying).
superEffective(ice, flying).
superEffective(rock, flying).

superEffective(bug, psychic).
superEffective(ghost, psychic).
superEffective(dark, psychic).

superEffective(fire, bug).
superEffective(ground, bug).
superEffective(steel, bug).

superEffective(water, rock).
superEffective(grass, rock).
superEffective(fighting, rock).
superEffective(ground, rock).
superEffective(steel, rock).

superEffective(dark, ghost).
superEffective(ghost, ghost).

superEffective(ice, dragon).
superEffective(dragon, dragon).
superEffective(fairy, dragon).

superEffective(fighting, dark).
superEffective(fairy, dark).
superEffective(bug, dark).

superEffective(fire, steel).
superEffective(fighting, steel).
superEffective(ground, steel).

superEffective(poison, fairy).
superEffective(steel, fairy).

superEffective(steel, fairy).

/* No Effect */

noEffect(normal, ghost).
noEffect(electric, ground).
noEffect(fighting, ghost).
noEffect(poison, steel).
noEffect(ground, flying).
noEffect(psychic, dark).
noEffect(ghost, normal).
noEffect(dragon, fairy).

/* Not Every Effective */

notEffective(normal, rock).
notEffective(normal, steel).

notEffective(fire, fire).
notEffective(fire, water).
notEffective(fire, rock).
notEffective(fire, dragon).

notEffective(water, water).
notEffective(water, grass).
notEffective(water, dragon).

notEffective(electric, electric).
notEffective(electric, grass).
notEffective(electric, dragon).

notEffective(grass, fire).
notEffective(grass, grass).
notEffective(grass, poison).
notEffective(grass, flying).
notEffective(grass, bug).
notEffective(grass, dragon).
notEffective(grass, steel).

notEffective(ice, fire).
notEffective(ice, water).
notEffective(ice, ice).
notEffective(ice, steel).

notEffective(fighting, poison).
notEffective(fighting, psychic).
notEffective(fighting, bug).
notEffective(fighting, fairy).
notEffective(fighting, flying).

notEffective(poison, poison).
notEffective(poison, ground).
notEffective(poison, rock).
notEffective(poison, ghost).

notEffective(ground, grass).
notEffective(ground, bug).

notEffective(flying, electric).
notEffective(flying, rock).
notEffective(flying, steel).

notEffective(psychic, psychic).
notEffective(psychic, steel).

notEffective(bug, fire).
notEffective(bug, fighting).
notEffective(bug, poison).
notEffective(bug, flying).
notEffective(bug, ghost).
notEffective(bug, steel).
notEffective(bug, fairy).

notEffective(rock, fighting).
notEffective(rock, ground).
notEffective(rock, steel).

notEffective(ghost, dark).

notEffective(dragon, steel).

notEffective(dark, fighting).
notEffective(dark, dark).
notEffective(dark, fairy).

notEffective(steel, fire).
notEffective(steel, water).
notEffective(steel, electric).
notEffective(steel, steel).

notEffective(fairy, fire).
notEffective(fairy, poison).
notEffective(fairy, steel).

resists(X, Y) :- notEffective(X, Y).
resists(X, Y) :- noEffect(X, Y).

effective(X, Y) :-
  \+ superEffective(Y, X),
  \+ noEffect(X, Y),
  \+ notEffective(X, Y).

typeWeakTo(T, W) :-
  type(T),
  findall(X, superEffective(X, T), W).

typeResists(T, W) :-
  type(T),
  findall(X, resists(X, T), W).

cWR(R, W, L) :-
  type(R),
  \+ member(R, W),
  append([], [R], L).
cWR(_R, _W, []).

cancelWeaknessResists([], _W, []).
cancelWeaknessResists([R|TR], W, L) :-
  is_list(TR),
  is_list(W),
  cancelWeaknessResists(TR, W, TailL),
  cWR(R, W, WRList),
  append(WRList, TailL, L).
