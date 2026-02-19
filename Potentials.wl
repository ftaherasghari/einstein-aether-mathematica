(* src/Potentials.wl
   Put reusable definitions here (instead of duplicating them across notebooks).
*)
BeginPackage["src`Potentials`"];

ComputeAll::usage = "ComputeAll[assoc] computes (and optionally caches) PN potentials.";

Begin["`Private`"];
Needs["src`ProjectInit`"];

cacheDir[] := (CreateDirectory["cache", CreateIntermediateDirectories -> True]; "cache");

Cached[ key_String, expr_] := Module[{f = FileNameJoin[{cacheDir[], key <> ".mx"}]},
  If[FileExistsQ[f],
    Import[f, "MX"],
    With[{res = expr},
      Export[f, res, "MX"];
      res
    ]
  ]
];

ComputeAll[params_Association : <||>] := Module[{res},
  (* TODO: replace with your actual definitions *)
  res = <|
    "U" -> Cached["U", 1],
    "Vj" -> Cached["Vj", 2]
  |>;
  res
];

End[];
EndPackage[];
