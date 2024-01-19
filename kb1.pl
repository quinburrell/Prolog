tree(leaf(nil),leaf(nil)):-leaf(Label),Label\=nil.
mirror(leaf(A),leaf(A)).
mirror(Left,Right):-Left=tree(Left1,Right1),
    Right=tree(Right2,Left2),
    mirror(Left1,Left2),
    mirror(Right1,Right2).

test_answer :-
    mirror(tree(tree(leaf(1),  leaf(2)),  tree(leaf(3), leaf(4))), T),
    write(T).

test_answer :-
    write('Wrong answer!').
