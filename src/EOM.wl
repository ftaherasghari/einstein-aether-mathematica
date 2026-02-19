(* src/EOM.wl
   EOM checks / regression tests.
*)
BeginPackage["src`EOM`"];

RunChecks::usage = "RunChecks[assoc] runs symbolic consistency checks and returns an association of test results.";

Begin["`Private`"];
Needs["src`ProjectInit`"];

RunChecks[params_Association : <||>] := Module[{checks},
  (* TODO: fill with your actual checks.
     Good examples:
       - symmetry checks
       - limits (e.g. GR limit)
       - compare two independent derivations
       - verify that a residual simplifies to 0 under assumptions
  *)
  checks = <|
    "ExampleZeroCheck" -> True
  |>;
  Print /@ (KeyValueMap[Row[{#1, ": ", #2}] &, checks]);
  checks
];

End[];
EndPackage[];
