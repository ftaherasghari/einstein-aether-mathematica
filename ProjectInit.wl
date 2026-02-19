(* src/ProjectInit.wl
   Common initialization for all notebooks/scripts.
*)
BeginPackage["src`ProjectInit`"];

ProjectInit::usage = "ProjectInit[] loads xAct/xTras and sets global options used across the project.";

Begin["`Private`"];

ProjectInit[] := Module[{},
  $DefInfoQ = False;
  Block[{Print}, Needs["xAct`xTras`"]];
  (* You can add shared assumptions here *)
  (* $Assumptions = ...; *)
];

(* Auto-run on load *)
ProjectInit[];

End[];
EndPackage[];
