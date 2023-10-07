/*Importing datasets*/
proc import datafile="C:\Users\user\Google Drive\School\Master of Analytics\161.777 Practical Data Mining\Final Project\Dry_Bean.csv"
out=drybean dbms=csv replace; getnames=yes; run;

/*Draftsman plot - post outliers removed*/
ods graphics / reset width=12in height=10in;
title 'Draftsman Plot of Key Continuous Variables ';
proc sgscatter data=drybean;
matrix Area	Perimeter	MajorAxisLength	MinorAxisLength	AspectRation	Eccentricity	ConvexArea	EquivDiameter	Extent	Solidity	roundness	Compactness	ShapeFactor1	ShapeFactor2	ShapeFactor3	ShapeFactor4
 / diagonal=(histogram normal);
run;
title;

proc means data=drybean chartype sum mean min max n nmiss vardef=df;
var Area	Perimeter	MajorAxisLength	MinorAxisLength	AspectRation	Eccentricity	ConvexArea	EquivDiameter	Extent	Solidity	roundness	Compactness	ShapeFactor1	ShapeFactor2	ShapeFactor3	ShapeFactor4
;
run;

ods graphics / reset;
proc univariate data=drybean;
hist;
run;

ods graphics / reset width=12in height=10in;
proc sgscatter data=drybean;
matrix Extent	Solidity	roundness	Compactness	ShapeFactor1	ShapeFactor2	ShapeFactor3	ShapeFactor4
 / diagonal=(histogram normal);
run;
title;