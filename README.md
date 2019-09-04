# Volatile-organic-compounds
Processing &amp; visualisation of VOC analysis results

Assumes data takes colnames: "Location" (char), "Compound" (char), "Indicator" (char), "Reporting limit" (num), "Detected concentration" (num), "Below limit" (bool), "Trace" (bool)

"Location" is the sampling location
"Compound" is the chemical name of the compound
"Indicator" denotes whether the compound is a primary or secondary fire/smoke residue indicator
"Reporting limit" is the limit below which the detected concentration of that compound cannot be quantified, per the original report, in units of µg/m3.
"Detected concentration" is the concentration detected of the given compound in the given area during analysis, in units of µg/m3. This is never reported as any value below the reporting limit. If there is a trace amount detected below the reporting limit, this denoted by a 1 in the "Below limit" column and a 1 in the "Trace" column. If the compound is not detected, this is denoted by a 1 in the "Below limit" column and a 0 in the "Trace" column. In both cases, "Detected Concentration" will be reported as the detection limit.
