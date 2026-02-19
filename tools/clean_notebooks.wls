(* tools/clean_notebooks.wls
   Remove Output/Print/Message cells from notebooks for clean Git commits.

   Example:
     wolframscript -file tools/clean_notebooks.wls --in notebooks --out notebooks_clean
*)

args = Association @ Partition[$ScriptCommandLine[[2 ;;]], 2];

inDir  = Lookup[args, "--in",  "notebooks"];
outDir = Lookup[args, "--out", "notebooks_clean"];

If[!DirectoryQ[outDir], CreateDirectory[outDir, CreateIntermediateDirectories -> True]];

nbs = FileNames["*.nb", inDir];

cleanOne[file_] := Module[{nb, cleaned, out},
  nb = NotebookOpen[file, Visible -> False];
  cleaned = NotebookGet[nb] /. Cell[_, style_, opts___] /;
      MemberQ[{style}, "Output" | "Print" | "Message"] :> Sequence[];
  NotebookClose[nb];
  out = FileNameJoin[{outDir, FileNameTake[file]}];
  Export[out, cleaned];
  out
];

Print /@ (cleanOne /@ nbs);
