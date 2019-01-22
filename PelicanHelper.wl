(* ::Subsection::Closed:: *)
(*Temp Loading Flag Code*)


Temp`PackageScope`PelicanHelperLoading`Private`$PackageLoadData=
  If[#===None, <||>, Replace[Quiet@Get@#, Except[_?OptionQ]-><||>]]&@
    Append[
      FileNames[
        "LoadInfo."~~"m"|"wl",
        FileNameJoin@{DirectoryName@$InputFileName, "Config"}
        ],
      None
      ][[1]];
Temp`PackageScope`PelicanHelperLoading`Private`$PackageLoadMode=
  Lookup[Temp`PackageScope`PelicanHelperLoading`Private`$PackageLoadData, "Mode", "Primary"];
Temp`PackageScope`PelicanHelperLoading`Private`$DependencyLoad=
  TrueQ[Temp`PackageScope`PelicanHelperLoading`Private`$PackageLoadMode==="Dependency"];


(* ::Subsection:: *)
(*Main*)


If[Temp`PackageScope`PelicanHelperLoading`Private`$DependencyLoad,
  If[!TrueQ[Evaluate[Symbol["`PelicanHelper`PackageScope`Private`$LoadCompleted"]]],
    Get@FileNameJoin@{DirectoryName@$InputFileName, "PelicanHelperLoader.wl"}
    ],
  If[!TrueQ[Evaluate[Symbol["PelicanHelper`PackageScope`Private`$LoadCompleted"]]],
    <<PelicanHelper`PelicanHelperLoader`,
   BeginPackage["PelicanHelper`"];
   EndPackage[];
   ]
  ]