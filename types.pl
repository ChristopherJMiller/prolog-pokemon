/* Possible Types */
type(normal).
type(fire).
type(water).
type(electric).
type(grass).
type(ice).
type(fighting).
type(poison).
type(ground).
type(flying).
type(psychic).
type(bug).
type(rock).
type(ghost).
type(dragon).
type(dark).
type(steel).
type(fairy).

validDuo(normal, flying).
validDuo(bug, flying).
validDuo(grass, poison).
validDuo(bug, poison).
validDuo(rock, water).
validDuo(rock, ground).
validDuo(water, ground).
validDuo(steel, psychic).
validDuo(water, flying).
validDuo(psychic, flying).
validDuo(psychic, fairy).
validDuo(steel, rock).
validDuo(water, ice).
validDuo(grass, flying).
validDuo(ground, ghost).
validDuo(ground, dragon).
validDuo(bug, steel).
validDuo(bug, grass).
validDuo(ghost, grass).
validDuo(fire, fighting).
validDuo(fire, flying).
validDuo(water, poison).
validDuo(dragon, flying).
validDuo(dark, flying).
validDuo(normal, fairy).
validDuo(poison, dark).
validDuo(bug, rock).
validDuo(bug, water).
validDuo(ghost, fire).
validDuo(steel, ground).
validDuo(water, psychic).
validDuo(water, dark).
validDuo(grass, dragon).
validDuo(grass, fairy).
validDuo(electric, flying).
validDuo(ice, psychic).
validDuo(dark, normal).
validDuo(normal, fighting).
validDuo(normal, psychic).
validDuo(fighting, psychic).
validDuo(rock, flying).
validDuo(bug, electric).
validDuo(ghost, dragon).
validDuo(steel, fairy).
validDuo(water, fairy).
validDuo(grass, psychic).
validDuo(grass, dark).
validDuo(electric, steel).
validDuo(psychic, ghost).
validDuo(dark, dragon).
validDuo(dark, fighting).
validDuo(fighting, steel).
validDuo(poison, flying).
validDuo(poison, dragon).
validDuo(ground, flying).
validDuo(ground, dark).
validDuo(rock, electric).
validDuo(bug, fighting).
validDuo(ghost, flying).
validDuo(ghost, poison).
validDuo(steel, flying).
validDuo(steel, ghost).
validDuo(fire, ground).
validDuo(fire, rock).
validDuo(water, fighting).
validDuo(water, grass).
validDuo(water, electric).
validDuo(water, dragon).
validDuo(grass, fighting).
validDuo(grass, steel).
validDuo(psychic, fire).
validDuo(ice, ground).
validDuo(dragon, fire).
validDuo(dragon, electric).
validDuo(dragon, psychic).
validDuo(dark, fire).
validDuo(dark, psychic).
validDuo(dark, fairy).
validDuo(normal, grass).
validDuo(fighting, flying).
validDuo(poison, fighting).
validDuo(poison, ground).
validDuo(poison, fire).
validDuo(poison, psychic).
validDuo(ground, psychic).
validDuo(rock, grass).
validDuo(rock, psychic).
validDuo(rock, ice).
validDuo(rock, dragon).
validDuo(rock, fairy).
validDuo(bug, ground).
validDuo(bug, psychic).
validDuo(bug, fairy).
validDuo(steel, dragon).
validDuo(fire, normal).
validDuo(water, ghost).
validDuo(grass, ice).
validDuo(electric, normal).
validDuo(electric, poison).
validDuo(electric, ice).
validDuo(electric, fairy).
validDuo(ice, flying).
validDuo(ice, bug).
validDuo(ice, steel).
validDuo(dragon, fighting).
validDuo(dark, ghost).
validDuo(dark, steel).
validDuo(dark, ice).
validDuo(fairy, flying).
validDuo(normal, grass).
validDuo(normal, water).
validDuo(normal, dragon).
validDuo(fighting, ghost).
validDuo(fighting, ice).
validDuo(poison, fairy).
validDuo(ground, electric).
validDuo(rock, fighting).
validDuo(rock, poison).
validDuo(rock, dark).
validDuo(bug, ghost).
validDuo(fairy, ghost).
validDuo(fire, steel).
validDuo(fire, water).
validDuo(steel, water).
validDuo(grass, ground).
validDuo(electric, ghost).
validDuo(electric, fire).
validDuo(electric, grass).
validDuo(electric, psychic).
validDuo(electric, dark).
validDuo(ice, ghost).
validDuo(ice, fire).
validDuo(ice, fairy).
validDuo(ice, dragon).
validDuo(dragon, fairy).
validDuo(X, X) :- type(X).

pair(X, Y) :- validDuo(X, Y).
pair(Y, X) :- validDuo(X, Y).