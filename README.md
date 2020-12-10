# Pokemon Types in Prolog

This project utilizes Prolog's powerful predicate matching to form strong pokemon teams.

A team is considered "strong" if all types are resisted by the team. As in, for a given attack type, your team would have a pokemon that would result in that attack being "not very effective" or "no effect".

The tool also produces only ["legal type combindations"](https://bulbapedia.bulbagarden.net/wiki/List_of_type_combinations_by_abundance)

## Requirements

- [swi-prolog](https://www.swi-prolog.org/)

## Usage

When in the project directory,

```
# Enter a prolog REPL with pokemon.pl loaded

$ swipl -s pokemon.pl

# Enter your team (use atoms for types for the function to determine)

?- teamTypeCovered([[electric, water], [fighting, fire], [A, B], [C, D]]).

A = grass,
B = poison,
C = dark,
D = steel

# For single-typed pokemon, use the same type twice.

?- pokemonResistsAndWeaknesses([flying, flying], R, W).
R = [bug, fighting, grass, ground],
W = [electric, ice, rock].
```

## Limitations

`teamTypeCovered` does not minimize type weaknesses, leading to team compositions that may be overly weak to a certain type, except for a single pokemon.

## Future Work

Produce a function to minize the number of weaknesses a team has.

## References

[jakerodulius's pokemon calculator was used for the math behind multi-type pokemon resistances](http://jakerodelius.com/web/pokemon-calc/index.html)
