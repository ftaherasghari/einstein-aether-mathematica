(* scripts/run.wls
   Command-line entry point.
   Example:
     wolframscript -file scripts/run.wls --task checkEOM
*)

args = Association @ Partition[$ScriptCommandLine[[2 ;;]], 2];

task = Lookup[args, "--task", "checkEOM"];

root = DirectoryName[$InputFileName];
SetDirectory[root];

Get[FileNameJoin[{root, "src", "ProjectInit.wl"}]];

If[NameQ["ProjectInit`ProjectInit"],
  ProjectInit`ProjectInit[],
  Print["ProjectInit[] not found. Check src/ProjectInit.wl."]
];

Switch[task,
  "checkEOM",
    If[FileExistsQ[FileNameJoin[{root, "src", "EOM.wl"}]],
      Get[FileNameJoin[{root, "src", "EOM.wl"}]];
      If[NameQ["EOM`RunChecks"],
        Print[EOM`RunChecks[]],
        Print["EOM`RunChecks[] not found. Add it to src/EOM.wl."]
      ],
      Print["src/EOM.wl not found."]
    ],
  "potentials",
    If[FileExistsQ[FileNameJoin[{root, "src", "Potentials.wl"}]],
      Get[FileNameJoin[{root, "src", "Potentials.wl"}]];
      If[NameQ["Potentials`BuildAll"],
        Print[Potentials`BuildAll[]],
        Print["Potentials`BuildAll[] not found. Add it to src/Potentials.wl."]
      ],
      Print["src/Potentials.wl not found."]
    ],
  _,
    Print["Unknown task: ", task, ". Try --task checkEOM or --task potentials."]
];
