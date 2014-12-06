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
(* t1 *)
print "Expect: [1,2,3,4,5,6,7]\n";
preOrder t1;
print "Expect: [3,2,4,1,6,5,7]\n";
inOrder t1;
print "Expect: [3,4,2,6,7,5,1]\n";
postOrder t1;
displayTree(t1, printInt);

(* t2 *)
print "Expect: [A,B,D,E,C,F,G]\n";
preOrder t2;
print "Expect: [D,B,E,A,F,C,G]\n";
inOrder t2;
print "Expect: [D,E,B,F,G,C,A]\n";
postOrder t2;
displayTree(t2, printX);

(* t3 *)
print "Expect: [1.22,2.33,3.44]\n";
preOrder t3;
print "Expect: [2.33,1.22,3.44]\n";
inOrder t3;
print "Expect: [2.33,3.44,1.22]\n";
postOrder t3;
displayTree(t3, printReal);

(* t4 *)
print "Expect: ['A','B','C','E','D','F','G','H','I','J','K','L','M']\n";
preOrder t4;
print "Expect: ['E','C','B','F','D','H','G','A','J','L','K','M','I']\n";
inOrder t4;
print "Expect: ['E','C','F','H','G','D','B','L','M','K','J','I','A']\n";
postOrder t4;
displayTree(t4, print);
(* END *)
