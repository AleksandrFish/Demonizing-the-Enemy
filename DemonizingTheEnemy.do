*Models for Disseration Chapter

use "/Users/Alex2/Desktop/Documents/GW Fall 2016/R Stuff/russiaukraine.dta", clear

*Chapter 5: Figure #1
reg fav_ukraine i.treatments if pass==1, robust
margins, dydx(treatments) vsquish 
mplotoffset,  recast(scatter)  horiz ///
title("Ukraine",  margin(20 0 5 0) size(medium)  position(12) span) ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel( `=-0.5' "-0.5" `=0' "0" `=0.5' "0.5", labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel( `=1' "Information" `=2' "Source" `=3' "Intention", ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
saving(favukraine, replace) legend(off)
 

reg ukrfp i.treatments if pass==1, robust
margins, dydx(treatments) vsquish 
mplotoffset,  recast(scatter)  horiz ///
title("Ukraine's Foreign Policy", margin(20 0 5 0) size(medium)  position(12) span) ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel( `=-0.5' "-0.5" `=0' "0" `=0.5' "0.5", labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel( `=1' "Information" `=2' "Source" `=3' "Intention", ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
saving(favukrainefp, replace) legend(off)

reg poro i.treatments if pass==1, robust
margins, dydx(treatments) vsquish 
mplotoffset,  recast(scatter)  horiz ///
title("Poroshenko", margin(20 0 5 0) size(medium)  position(12) span)  ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel( `=-0.5' "-0.5" `=0' "0" `=0.5' "0.5", labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel( `=1' "Information" `=2' "Source" `=3' "Intention", ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
saving(favporo, replace) legend(off)

reg fav_russia i.treatments if pass==1, robust
margins, dydx(treatments) vsquish 
mplotoffset,  recast(scatter)  horiz ///
title("Russia", margin(20 0 5 0) size(medium)  position(12) span)  ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel( `=-0.5' "-0.5" `=0' "0" `=0.5' "0.5", labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel( `=1' "Information" `=2' "Source" `=3' "Intention", ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
saving(favrussia, replace) legend(off)


reg rusfp i.treatments if pass==1, robust
margins, dydx(treatments) vsquish 
mplotoffset,  recast(scatter)  horiz ///
title("Russia's Foreign Policy", margin(20 0 5 0) size(medium)  position(12) span)  ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel( `=-0.5' "-0.5" `=0' "0" `=0.5' "0.5", labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel( `=1' "Information" `=2' "Source" `=3' "Intention", ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
saving(favrussiafp, replace) legend(off)

reg putin i.treatments if pass==1, robust
margins, dydx(treatments) vsquish 
mplotoffset,  recast(scatter)  horiz ///
title("Putin", margin(20 0 5 0) size(medium)  position(12) span) ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel( `=-0.5' "-0.5" `=0' "0" `=0.5' "0.5", labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel( `=1' "Information" `=2' "Source" `=3' "Intention", ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
saving(favputin, replace) legend(off)

gr combine favukraine.gph favukrainefp.gph favporo.gph ///
favrussia.gph favrussiafp.gph favputin.gph, row(2) xcommon ///
title("{bf:Influence of Russian Propaganda on Views toward Ukraine and Russia}", margin(10 0 5 0)) ///
b1("Treatment effect")
graph export "diss_chapter4_1", as(eps) replace

*Chapter 5: Figure #2
reg sanctions i.treatments if pass==1, robust
margins, dydx(treatments) vsquish 
mplotoffset,  recast(scatter)  horiz ///
title("Sanctions", margin(20 0 5 0) size(medium)  position(12) span)  ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel( `=-0.5' "-0.5" `=0' "0" `=0.5' "0.5", labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel( `=1' "Information" `=2' "Source" `=3' "Intention", ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
saving(sanctions, replace) legend(off)

reg arms i.treatments if pass==1, robust
margins, dydx(treatments) vsquish 
mplotoffset,  recast(scatter)  horiz ///
title("Arms", margin(20 0 5 0) size(medium)  position(12) span)  ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel( `=-0.5' "-0.5" `=0' "0" `=0.5' "0.5", labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel( `=1' "Information" `=2' "Source" `=3' "Intention", ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
saving(arms, replace) legend(off)

gr combine sanctions.gph arms.gph, row(1) xcommon ///
title("{bf:Influence of Russian Propaganda on Policy Attitudes}", margin(10 0 5 0)) ///
b1("Treatment effect")
graph export "diss_chapter5_2", as(eps) replace

*Chapter 5: Figure #3 Party Interaction
reg fav_ukraine i.treatments##i.par i.female i.gen3 i.white i.education ukr_know if pass==1, robust
margins par , dydx(treatments)
mplotoffset,  offset(0.1) xline(0, lcolor(black) lpattern(dash) lwidth(medthick))  recast(scatter) ///
title("Ukraine", margin(20 0 5 0) size(medium)  position(12) span)  ///
horiz ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel(, labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel(, ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
plot( , label("Information" "Source" "Intention")) legend(pos(5) row(3) ring(0)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
name(par_ukraine, replace) 


reg fav_russia i.treatments##i.par i.female i.gen3 i.white i.education ukr_know if pass==1, robust
margins par , dydx(treatments)
mplotoffset,  offset(0.1) xline(0, lcolor(black) lpattern(dash) lwidth(medthick))  recast(scatter) ///
title("Russia", margin(20 0 5 0) size(medium)  position(12) span)  ///
horiz ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel(, labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel(, ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
plot( , label("Information" "Source" "Intention")) legend(pos(5) row(3) ring(0)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
name(par_russia, replace)  

gr combine par_ukraine par_russia, row(1) xcommon ///
title("{bf:Influence of Russian Propaganda on Views toward Ukraine and Russia}" "{bf: Political Party Interaction}", margin(10 0 5 0)) ///
b1("Treatment effect")
graph export "diss_chapter5_3", as(eps) replace


*Political Priors Interaction
reg fav_ukraine i.treatments##c.prior_ukr i.education i.ideo3 i.female i.gen3 i.white  if pass==1, robust
margins, dydx(treatments) at(prior_ukr=(1(1)4))
mplotoffset,  offset(0.1) xline(0, lcolor(black) lpattern(dash) lwidth(medthick))  recast(scatter) ///
title("Ukraine", margin(20 0 5 0) size(medium)  position(12) span)  ///
horiz ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel(, labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel(, ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
plot( , label("Information" "Source" "Intention")) legend(pos(11) row(3) ring(0)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
name(prior_ukraine, replace)  

reg fav_russia i.treatments##c.prior_ukr i.education i.ideo3 i.female i.gen3 i.white if pass==1, robust
margins, dydx(treatments) at(prior_ukr=(1(1)4))
mplotoffset,  offset(0.1) xline(0, lcolor(black) lpattern(dash) lwidth(medthick))  recast(scatter) ///
title("Russia", margin(20 0 5 0) size(medium)  position(12) span)  ///
horiz ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel(, labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel(, ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("", color(black)) ///
ytitle("", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
plot( , label("Information" "Source" "Intention")) legend(pos(11) row(3) ring(0)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
name(prior_russia, replace)  

gr combine prior_ukraine prior_russia, row(1) xcommon ///
title("{bf:Influence of Russian Propaganda on Views toward Ukraine and Russia}" "{bf:By Prior Level of Knowledge}", margin(10 0 5 0)) ///
l1("How much do you know about the conflict in Ukraine?", size(small)) ///
b1("Treatment effect", size(small)) 

graph export "diss_chapter5_4", as(eps) replace


*Attitudes toward Russia
reg fav_ukraine i.treatments##fav_russia_3 if pass==1, robust
margins fav_russia_3 , dydx(treatments)
mplotoffset,  offset(0.1) xline(0, lcolor(black) lpattern(dash) lwidth(medthick))  recast(scatter) ///
title("{bf:Influence of Russian Propaganda on Views toward Ukraine}", margin(20 0 5 0) size(medium)  position(12) span)  ///
horiz ///
plotregion(fcolor(white) lcolor(gs10) lwidth(medium)) ///
xlabel(, labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
ylabel(, ///
labcolor(gs4) tlcolor() tlwidth(thin) labsize(small) nogrid) ///
xtitle("Treatment effect", color(black)) ///
ytitle("Attitudes toward Russia", color(black)) ///
recastci(rspike) ciopts(lwidth(thick)) plotopt(msym(O) msize(large)) ///
plot1opts(mcolor(white) mlcolor(black) lcolor(black)) ///
plot( , label("Information" "Source" "Intention")) legend(pos(5) row(3) ring(0)) ///
xline(0, lcolor(gs7) lpattern(dash) lwidth(medthick)) ///
name(rus_ukraine, replace)  
graph export "russia-ukraine-int", as(eps) replace

