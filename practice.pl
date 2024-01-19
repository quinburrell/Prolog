reversed([],[]).
reversed([X|Li1],L2):-append(Li2,[X],L2),reversed(Li1,Li2).

new_append([X|[]],L2,[X|L2]).
new_append([X|L1],L2,[X|Res]):-new_append(L1,L2,Res).

binary_number([A,B|Bi]):-A=0,B=b,bin_check(Bi).
bin_check([X|Bi]):-(X=1;X=0),(bin_check(Bi);Bi=[]).

dna([X|L],[Y|R]):-((X=a,Y=t);(X=t,Y=a);(X=c,Y=g);(X=g,Y=c)),(dna(L,R);(L=[],R=[])).

max(X,Y,M):-(X>=Y,X=M);(Y>=X,Y=M).
max([H|List],M):-List=[_|_],max(List,LM),max(H,LM,M).
max([X],X).

postorder(leaf(X),[X]).
postorder(tree(N,L,R),T):-postorder(L,LT),postorder(R,RT),append(LT,RT,LRT),append(LRT,[N],T).

unique([X|List],Set):-member(X,Set),(unique(List,Set);List=[]),noreps(Set).
noreps([A|Tail]):-Tail=[];(not(isin(A,Tail)),noreps(Tail)).

mege(L1,[],L1).
mege([],L2,L2).
mege([H1|L1],[H2|L2],[R1|R]):-
    (H1=<H2,H1=R1,mege(L1,[H2|L2],R));
    (H1>H2,H2=R1,mege([H1|L1],L2,R)).
test_answer :-
    mege([3, 6, 7], [1, 2, 3, 5, 8], L),
    writeln(L).
