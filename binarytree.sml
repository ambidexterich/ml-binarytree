datatype 'a tree = empty | bTree of 'a * 'a tree * 'a tree;

(* (bTree -> 'a list) *)
fun preOrder empty = []
 |  preOrder (bTree(v, l, r)) = v::(preOrder l)@(preOrder r);

fun inOrder empty = []
 |  inOrder (bTree(v, l, r)) = (inOrder l)@v::(inOrder r);

 fun postOrder empty = []
 |  postOrder (bTree(v, l, r)) = (postOrder l)@(postOrder r)@[v];

val indentSize = 2;
fun indent(level) = let
                        fun pad(0) = []
                        |  pad(i) = #" "::pad(i-1);
                     in
                        print(implode(pad(indentSize*level)))
                     end;
fun displaynode(level, v, printfn) = (indent level; printfn v; print "\n")
fun emptynode(level) = (indent level ; print("-\n"));

fun displayTree (T, prn) = let
                                 fun display(empty, level) = emptynode(level)
                                 |   display(bTree(v, empty, empty), level) = displaynode(level, v, prn)
                                 |   display(bTree(v,l,r), level) = (displaynode(level, v, prn);
                                                                      display(l, level+1);
                                                                      display(r, level+1))
                             in
                                 display(T, 0)
                             end;
