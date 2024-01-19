preorder(leaf(X),[X|[]]).
preorder(tree(S,L,R),[S|Traversal]):-
    preorder(L,L1),preorder(R,R1),append(L1,R1,Traversal).

inorder(leaf(N),[N]).
inorder(tree(N,L,R),T):-
    inorder(L,LT),
    append(LT,[N],LTN),
    inorder(R,RT),
    append(LTN,RT,T).

postorder(leaf(X), [X|[]]).
postorder(tree(X,L,R),Traversal):-
    postorder(L,L1),postorder(R,R1),append(R1,[X|L1],Traversal).


test_answer :-
    postorder(tree(a, tree(b, leaf(c), leaf(d)), leaf(e)), T),
    writeln(T).
