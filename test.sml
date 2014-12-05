Control.Print.printDepth := 200;
Control.Print.printLength := 200;

use "binarytree.sml";

datatype X = A | B | C | D | E | F | G | H;

(* Print Functions *)
fun printInt n = print(Int.toString n);
fun printReal n = print(Real.toString n);
fun printX A = print "A"
|   printX B = print "B"
|   printX C = print "C"
|   printX D = print "D"
|   printX E = print "E"
|   printX F = print "F"
|   printX G = print "G"
|   printX H = print "H";

(*  TEST DATA - BINARY TREES   *)

(*
       1
     /  \
   2      5
 /  \   /  \
3    4 6    7
*)
val t1 =  bTree(1,
              bTree(2,
                  bTree(3, empty, empty),
                  bTree(4, empty, empty)),
              bTree(5,
                  bTree(6, empty, empty),
                  bTree(7, empty, empty)));

(*
       A
     /  \
   B     C
 /  \   / \
D    E F   G
*)
val t2 =  bTree(A,
              bTree(B,
                  bTree(D,empty, empty),
                  bTree(E,empty, empty)),
              bTree(C,
                  bTree(F,empty, empty),
                  bTree(G,empty, empty)));

(*
    1.22
  /      \
2.33    3.44
*)
val t3 =  bTree(1.22,
              bTree(2.33,empty, empty),
              bTree(3.44, empty,empty));

(*
E    -    F    G
*)
val t4 =  bTree("A",
              bTree("B",
                  bTree("C",
                      bTree("E",empty,empty),
                      empty),
                  bTree("D",
                      bTree("F",empty,empty),
                      bTree("G",
                          bTree("H",empty,empty),
                          empty))),
              bTree("I",
                  bTree("J",
                      empty,
                      bTree("K",
                          bTree("L",empty, empty),
                          bTree("M",empty, empty))),
                  empty));

(* END END *)

(* START TESTS*)
preOrder t1;
inOrder t1;
postOrder t1;
displayTree(t1, printInt);

preOrder t2;
inOrder t2;
postOrder t2;
displayTree(t2, printX);

preOrder t3;
inOrder t3;
postOrder t3;
displayTree(t3, printReal);

preOrder t4;
inOrder t4;
postOrder t4;
displayTree(t4, print);
(* END *)
