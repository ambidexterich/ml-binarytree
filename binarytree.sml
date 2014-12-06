(* Establish our tree structure*)
datatype 'a tree = empty | bTree of 'a * 'a tree * 'a tree;

(*** Tree Traversal ***)
(* Display the root, visit the left subtree then the right subtree *)
fun preOrder empty = []
 |  preOrder (bTree(v, l, r)) = v::(preOrder l)@(preOrder r);

(* Visit the left subtree, display the root then visit the right subtree *)
fun inOrder empty = []
 |  inOrder (bTree(v, l, r)) = (inOrder l)@v::(inOrder r);

(* Visit the left subtree, the right subtree then display the root *)
fun postOrder empty = []
 |  postOrder (bTree(v, l, r)) = (postOrder l)@(postOrder r)@[v];

(* The amount to indent each level in relation to the previous level *)
val indentSize = 2;
(* The character to display when the left or right node is empty *)
val emptynodechar = "-";

(* Print a string made up of level * indentSize spaces *)
fun indent(level) = let
                        fun pad(0) = []
                        |  pad(i) = #" "::pad(i-1);
                     in
                        print(implode(pad(indentSize*level)))
                     end;

(*
    Display the root node value padded with the appropriate number of spaces
    followed by a newline.
*)
fun displaynode(level, v, printfn) = (indent level; printfn v; print "\n")

(*
    Display and empty node character padded with the appropriate number of spaces
    followed by a newline.
*)
fun emptynode(level) = (indent level; print(emptynodechar^"\n"));

(* Display the tree in the appropriate format. A tree with 2 empty nodes
    should display nothing but a tree with 1 empty node should display
    the empty node character in place of the value

    Use an internal function to allow for manipulation of recursive parameters
    without mucking up the public function.
*)
fun displayTree (T, prn) = let
                                 fun display(empty, level) = emptynode(level)
                                 |   display(bTree(v, empty, empty), level) = displaynode(level, v, prn)
                                 |   display(bTree(v,l,r), level) = (displaynode(level, v, prn);
                                                                      display(l, level+1);
                                                                      display(r, level+1))
                             in
                                 display(T, 0)
                             end;
