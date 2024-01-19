has_cycle([A|Path]):-Path\=[],(member(A,Path);has_cycle(Path)).


can_be_installed(Software):-
    requires(Software,SoftwareList),
    (has_installed(SoftwareList);SoftwareList=[]).

has_installed([A|Tail]):-
    installed(List),
    member(A,List),
   (has_installed(Tail);Tail=[]).

inorder(leaf(N),[N]).
inorder(tree(N,L,R),T):-
    inorder(L,LT),
    append(LT,[N],LTN),
    inorder(R,RT),
    append(LTN,RT,T).


leaves(tree(C),L):-leaves(C,L).
leaves([A],[A]):-atom(A).
leaves([A|List],L):-
    (leaves([A],AL),
    leaves(List,TL),
    append(AL,TL,Leaves));
    L=[A],List= [].

not_in(A,[]).
not_in(A,[B|List]):-A\=B,not_in(A,List).
all_distinct(List):-List=[].
all_distinct([A|List]):-all_distinct(List),not_in(A,List).

even_length(List):-List=[].
even_length([A,B|List]):-even_length(List).


same_evens(List):-
    List=[];
    List=[_,_|[]];
    (List=[_,Z,_,Z|_],List=[_,_|Rest],same_evens(Rest)).


test_answer :-
    \+ same_evens([2]),
    \+ same_evens(this_is_not_a_list),
    \+ same_evens([a, b, a, c]),
    writeln('OK').

test_answer :-
    writeln('Wrong!').

noas(List):-
    List=[];
    (List=[b|Rest],noas(Rest)).
asbs(List):-
    List=[];
    (List=[a|Rest],asbs(Rest));
    (List=[b|Rest],noas(Rest)).

