#!/bin/bash
#===================================================================================
#
#	 FILE:	mdgecd2mid+svg.sh
#
#	USAGE:	mdgecd2mid+svg.sh n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16
#
#		where n1-n16 are any of the 11 possible outcomes of a toss of
#		two ordinary six-sided dice, e.g., n1-n16 are 16 integers, not necessarily 
#		unique, chosen from the set {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}
#
# DESCRIPTION:	Used for generating ABC and MIDI files 
#		of a particular Musical Dice Game (MDG) English Country Dance based on the rules given in 
#		K.Anh.C 30.01 (1792/93 publication attributed to W.A. Mozart 
#		by his publisher, Nikolaus Simrock).
#
#      AUTHOR:	J.L.A. Uro (justineuro@gmail.com)
#     VERSION:	0.0.0
#     LICENSE:	Creative Commons Attribution 4.0 International License (CC-BY)
#     CREATED:	2025/05/19 11:26:51
#    REVISION:	
#==================================================================================

#----------------------------------------------------------------------------------
# declare the variables "diceS" and "measNR" as arrays
# diceS - array containing the 16 outcomes from input line
# measNR - array of all possible measure notes for a specific outcome
#----------------------------------------------------------------------------------
declare -a diceS measNR  

#----------------------------------------------------------------------------------
# input 16-sequence of tosses as given in the command line
#----------------------------------------------------------------------------------
diceS=($1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16})

#----------------------------------------------------------------------------------
# input rule table to determine corresponding G/F measures for each toss outcome
#----------------------------------------------------------------------------------
ruletab() {
	case $1 in
	2) measNR=( 70  14 164 122  25 153  18 167 155   3 162 170  13 166  95   5);;
	3) measNR=( 10  64 100  12 149  30 161  11 148  28 135 173 169 174   2  20);;
	4) measNR=( 33   1 160 163  77 156 168 172  22 176  62 126  31  24 159  41);;
	5) measNR=( 36 114   8  35 111  39 137  44   4 157  38   9 151  32  17 171);;
	6) measNR=(105 150  57  71 117  52 132 130 136  91 138  19 134 101 154 146);;
	7) measNR=(165 152 112  15 147  27  73 102 144 104  87 107 128  48 109  74);;
	8) measNR=(  7  81 131  37  21 125  49 115 116 133  72 141  94  80 129  65);;
	9) measNR=(142 106  40  69  43 140  23  89  66 124  26  84  75 103  96 127);;
	10) measNR=( 99  68  86 139 120  92 143  83  93  55  29  51  42 110 108 98);;
	11) measNR=( 85  45  90 158  82 123  78  58  61  34 119  46  59  54  60  47);;
	12) measNR=(145  97   6 121  56  67  63  16  50  79 175  76 113  88  53 118);;
	esac
}

#----------------------------------------------------------------------------------
# input notes
# declare variables "notesG" and "notesF" as arrays
# notesG - array that contains the possible treble clef notes per measure
# notesF - array that contains the possible bass clef notes per measure
#----------------------------------------------------------------------------------
declare -a notesG notesF

#----------------------------------------------------------------------------------
# define notesG, array of 176 possible treble clef notes
#----------------------------------------------------------------------------------
notesG=("ggec" "dfBd" "{a}gbgd" "Dd^fa" "c2C2" "dd/B/ GA/B/" "ccee" "dfBd" "dB G2" "gecc" "[GBg]2z2" "c/B/c/d/ cc" "cege" "gecc" "c/e/g/e/ cc" "[GBg]2z2" "d/e/f/e/ f/d/c/B/" "ecBA" "d/B/c/A/ G/g/f/d/" "c2C2" "D^F/A/ d/f/a/f/" "a/b/a/g/ {g/}^fe/d/" "e/c/e/c/ A^f" "c'/b/a/g/ f/e/d/c/" "d^faf" "ecge" "{a/}g^f/g/ d/g/d/B/" "g/^f/e/d/ c/B/A/G/" "e/c/G/c/ e/c/g/e/" "gdd^d" "cc/e/ g/e/g/e/" "cgec" "c/C/E/G/ c/e/g/c'/" "g/b/g/d/ B/g/d/B/" "c/d/e/d/ c/E/G/c/" "cC/E/ Gc/e/" "ceG2" "c/c'/g/e/ c/g/e/c/" "g/^f/e/d/ c/B/A/G/" "f/e/d/c/ B/c/d/B/" "c2C2" "cc/e/ gg/e/" "d/^c/d/e/ ^f/g/a/f/" "[GBg]2z2" "gc'ge" "dBG2" "c2C2" "cc/e/ gg/e/" "e/c/B/A/ G/B/^F/A/" "D/^F/A/d/ ^f/a/f/d/" "G/g/d/B/G2" "gbgd" "gfdB" "ceee" "ggbg" "dd^ff" "ffdd" "[GBg]2z2" "c2cc" "ffdd" "dd^fa" "eege" "eag^f" "g/e/f/d/ c/g/e/c/" "ccc2" "^ff/a/ d'a/f/" "gb/g/ dg/d/" "gg/e/ cc/e/" "cG/E/ CC" "c2cc" "[Ec][Ec][Ec]2" "e2cc" "eg^fa" "c2C2" "c2cc" "d/c/B/A/G2" "D^F/A/ d^f" "ee/g/ ^ff/a/" "gb/g/ dg/d/" "ceee" "cGce" "d2dd" "[GBg]2z2" "dBG2" "gg/e/ cc/e/" "ff/d/ BB/d/" "ec/e/ ge/c/" "ce/g/ c'/g/e/c/" "[GBg]2z2" "dBGB" "g2bg" "gdBG" "d2a^f" "cege" "fdge" "ddBB" "cGce" "c2C2" "Gc2e" "B/A/G/A/ B/c/d/B/" "ge2c" "[GBg]2z2" "g/c'/g/f/ e/c/e/g/" "gd'/b/g2" "c/B/c/d/ e/d/e/f/" "ge2c" "dB2G" "f/a/f/d/ B/d/B/G/" "de2B" "cecG" "D^F/A/ d^f" "fdBG" "cGEC" "ga/g/ f/e/d/c/" "[GBg]2z2" "d^f2a" "a^f2d" "c2C2" "gc'ge" "d/e/^f/g/ a/b/c'/a/" "ce/c/G2" "cG EC" "gd BG" "Bdgb" "b/d'/c'/b/ a/g/^f/g/" "BdG2" "c2C2" "Gc2e" "fd BG" "[GBg]2z2" "fd2B" "ec2A/^F/" "dg2b" "c/e/g/e/ c/G/c/e/" "eg =f/e/d/c/" "d^f/a/ d'd'" "ec' b/a/g/^f/" "ge2c" "ce G2" "gd2B" "dBGB" "cGce" "ec A^F" "D/^F/A df" "[G,Ec]2c/d/e/f/" "c2C2" "d/e/^f/g/ a/f/e/d/" "a/g/a/^f/ de/f/" "Dd2^f/a/" "ge c/e/g/e/" "c2eg" "gc'/g/ ec" "g/a/b/c'/ d'/b/a/g/" "fdcB" "a2g/^f/e/d/" "gb2g/d/" "g/a/b/c'/ d'2" "c/d/e/f/ g/e/d/c/" "df2d/B/" "dB G/B/d/B/" "e/g/e/c/ B/A/G/^F/" "gc' {f/}ed/c/" "c/B/c/d/ cc" "BB GG" "ce/c/ GG" "g/a/g/f/ ee" "[GBg]2z2" "ec2A/^F/" "c/B/c/d/ ee" "B/G/B/d/g2" "c2C2" "[GBg]2z2" "B/G/D/B,/ G,/G/B/d/" "c2eg" "c'gec" "gbg2")

#----------------------------------------------------------------------------------
# define notesF, array of 176 possible bass clef notes
#----------------------------------------------------------------------------------
notesF=("C,2z2" "G,,2G,,2" "[B,,G,]2G,,2" "D,2[D,C,]2" "C,2C,,2" "G,2G,,2" "C,2C,2" "G,,2G,,2" "G,,2 G,/F,/E,/D,/" "C,2z2" "G,,2G,/F,/E,/D,/" "C,2z2" "C,2C,2" "C,2z2" "C,2C,,2" "G,,2G,/F,/E,/D,/" "G,,2G,,2" "C,2D,2" "G,,2z2" "C,2C,,2" "D,2[D,C,]2" "D,2[D,C,]2" "C,2D,2" "C,2z2" "D,2[D,C,]2" "C,2C,2" "[B,,G,]2B,,2" "[B,,G,]2z2" "C,2C,2" "[B,,G,]2B,,2" "C,C,C,C," "C,2z2" "C,2C,2" "G,z G,,z" "C,2C,,2" "C,2C,2" "C,/C/B,/C/C,2" "C,z C,z" "[B,,G,]2z2" "G,G,,G,,G,," "C,2C,,2" "C,2z2" "D,2[D,C,]2" "G,,2G,/F,/E,/D,/" "C,/D,/C,/B,,/ C,/D,/E,/C,/" "G,/G,,/B,,/D,/ G,/F,/E,/D,/" "C,2C,,2" "C,2z2" "C,2D,D,," "D,z [C,D,]z" "G,,2G,/F,/E/D/" "B,,/G,,/B,,/D,/ G,/D,/B,,/G,,/" "G,,/B,,/D,/B,,/ F,/D,/B,,/G,,/" "C,/E,/G,/E,/ C,/E,/G,/E,/" "B,,/D,/G,/D,/ B,,B,," "D,^F,/A,/ D/A,/F,/D,/" "G,G,,/A,,/ B,,/C,/D,/B,,/" "G,,2G,/F,/E,/D,/" "C,/E,/G,/E,/ C,/E,/G,/E,/" "G,G,,/A,,/ B,,/C,/D,/B,,/" "D,/^F,/A,/F,/ D,C," "C,/G,,/E,/C,/ C/G,/E,/C,/" "C,/B,,/C,/A,,/ D,/^C,/D,/D,,/" "C,zz2" "C,2C,,2" "D,2D,2" "G,2B,,2" "C,2z2" "C,2z2" "C,/G,,/A,,/B,,/ C,/G,,/A,,/B,,/" "C,/C,,/E,,/G,,/ C,/E,/G,/E,/" "C,/E,/G,/E,/ C,/G,/E,/C,/" "C,2D,2" "C,2C,,2" "C,/G,,/A,,/B,,/ C,/G,,/A,,/B,,/" "G,,2 G,/F,/E,/D,/" "D,2D,2" " C,2D,2" "[B,,G,]2G,,2" "C,2z2" "C,2z2" "D,/^F,/A,/G,/ F,/D,/E,/F,/" "G,,2G,/F,/E,/D,/" "G,,/B,,/D,/G,/ G,,/=F,/E,/D,/" "C,2z2" "G,,2G,,2" "C,2z2" "C,2z2" "G,,2G,/F,/E,/D,/" "G,G,,/A,,/ B,,/A,,/B,,/G,,/" "B,,/D,/G,/D,/ B,,/G,,/A,,/B,,/" "G,2z2" "D,/^F,/A,/F,/ C,/F,/A,/C,/" "C,/E,/G,/E,/ C,/E,/G,/E,/" "G,2G,,2" "G,/D,/B,,/G,,/ G,/D,/B,,/G,,/" "E,E,/E,/ E,C," "C,2C,,2" "C,/G,/E,/G,/ G,/F,/G,/A,/" "G,,2G,,2" "C,/G,/E,/G,/ C,/G,/E,/G,/" "B,,/G,,/B,,/D,/ G,/F,/E,/D,/" "C,2z2" "G,2G,,2" "C,2C,2" "C,/E,/G,/E,/ C,/E,/G,/E,/" "B,,/D,/G,/D,/ G,/F,/E,/D,/" "G,2G,,2" "G,,/D,/B,,/D,/ G,,/D,/B,,/D,/" "E,E,/E,/ E,C," "D,2D,2" "G,2G,,2" "C,C,/C,/ C,C," "C,2z2" "G,,2G,/F,/E,/D,/" "D,^C,/D,/ =C,/D,/C,/D,/" "D,/A,/^F,/A,/ D,/A,/^F,/A,/" "C,2C,,2" "C,2C,2" "D,2^F,2" "C,2G,,2" "C,2C,,2" "G,2G,,2" "G,2G,,2" "G,2B,,2" "G,,2G,/F,/E,/D,/" "C,2C,,2" "C,/G,/E,/G,/ C,/G,/E,/G,/" "G,2G,,2" "G,,2G,/F,/E,/D,/" "G,,/D,/B,,/D,/ G,,/D,/B,,/D,/" "C,/A,/^F,/A,/ A,,/D,/C,/D,/" "B,,/D,/G,/D,/ B,,/D,/G,/D,/" "C,2z2" "C,2C,2" "D,2^F,2" "C,2D,2" "C,/E,/G,/E,/ C,/E,/G,/E,/" "C,/G,/E,/G,/ C,/G,/E,/G,/" "D,/B,/G,/B,/ D,/B,/G,/B,/" "G,2G,,2" "C,C,/C,/ C,G,," "C,2D,2" "D,2D,2" "C,/E,/G,/E,/C,2" "C,2C,,2" "D,2^F,2" "D,2^F,2" "D,2z2" "C,/E,/G,/E,/C,2" "C,/E,/G,/E,/C,2" "C,2z2" "G,2B,,2" "G,2G,,2" "D,/^F,/A,/F,/ D,C," "G,2z2" "G,2G,,2" "C,2C,,2" "G,2G,,2" "G,,/B,,/D,/B,,/G,,2" "C,2D,2" "C,2C,2" "C,2C,2" "G,,/A,,/B,,/C,/ D,/E,/F,/D,/" "C,2z2" "C,2E,/G,/E,/C,/" "G,,2G,/F,/E,/D,/" "C,2D,2" "C,2C,/E,/G,/E,/" "G,,2G,/F,/E,/D,/" "C,2C,,2" "G,,2G,/F,/E,/D,/" "G,,2z2" "C,/E,/G,/E,/C,2" "C,2C,2" "B,,/G,,/B,,/D,/ G,/D,/B,,/G,,/")

#----------------------------------------------------------------------------------
# create cat-to-output-file function
#----------------------------------------------------------------------------------
catToFile(){
	cat >> $filen << EOT
$1
EOT
}

#----------------------------------------------------------------------------------
# create empty ABC file
# set header info: generic index number, filename
#----------------------------------------------------------------------------------
fileInd=$1-$2-$3-$4-$5-$6-$7-$8-$9-${10}-${11}-${12}-${13}-${14}-${15}-${16}
filen="KAnhC30-$fileInd.abc"
# adjust count for bar 5 as notes for rolls 4 and 5 are identical (only 10 unique bars);
# notes for measures 77 (for roll 4) and 111 (roll 5) are the same
if [ "${diceS[4]}" -gt "4" ]; then diceS4=${diceS[4]}-1; else diceS4=${diceS[4]}; fi
# adjust count for bar 8 for rolls other than 7 (only 2 unique bars);
# if roll is 7 for bar 8, only measure 102 is different from the other 10 measures for bar 8
if [ "${diceS[7]}" = "7" ]; then diceS7="3"; else diceS7="2"; fi
# adjust count for bar 16 for rolls other than 8 (only 2 unique bars);
# if roll is 8 for measure 16, only measure 65 is different from the other 10 measures for bar 8
if [ "${diceS[15]}" = "8" ]; then diceS15="3"; else diceS15="2"; fi
# compute generic index number (permutation: 1 to 11^14*2 = 759 499 667 166 482)
dbNum=$(( ${diceS[0]}-1 +(${diceS[1]}-2)*11 +(${diceS[2]}-2)*11**2 +(${diceS[3]}-2)*11**3 +($diceS4-2)*11**4 +(${diceS[5]}-2)*10*11**4 +(${diceS[6]}-2)*10*11**5 +($diceS7-2)*10*11**6 +(${diceS[8]}-2)*2*10*11**6 +(${diceS[9]}-2)*2*10*11**7 +(${diceS[10]}-2)*2*10*11**8 +(${diceS[11]}-2)*2*10*11**9 +(${diceS[12]}-2)*2*10*11**10 +(${diceS[13]}-2)*2*10*11**11 +(${diceS[14]}-2)*2*10*11**12 +($diceS15-2)*2*10*11**13 ))
# ALTERNATIVELY, comment out the conditionals above and dbNum formula then use:
#if [ "${diceS[4]}" = "5" ]; then diceS[4]="4"; fi
#if [ "${diceS[4]}" -gt "5" ]; then diceS[4]=${diceS[4]-1}; fi
#if [ "${diceS[7]}" = "7" ]; then diceS[7]="3"; else diceS[7]="2"; fi
#if [ "${diceS[15]}" = "8" ]; then diceS[15]="3"; else diceS[15]="2"; fi
#dbNum=$(( ${diceS[0]}-1 +(${diceS[1]}-2)*11 +(${diceS[2]}-2)*11**2 +(${diceS[3]}-2)*11**3 +(${diceS[4]}-2)*11**4 +(${diceS[5]}-2)*11**5 +(${diceS[6]}-2)*11**6 +(${diceS[7]}-2)*11**7+(${diceS[8]}-2)*2*11**7 +(${diceS[9]}-2)*2*11**8 +(${diceS[10]}-2)*2*11**9 +(${diceS[11]}-2)*2*11**10 +(${diceS[12]}-2)*2*11**11 +(${diceS[13]}-2)*2*11**12 +(${diceS[14]}-2)*2*11**13 +(${diceS[15]}-2)*2*11**14 ))
#
# re-assign the rolls its original values
#diceS[4]=$5;diceS[7]=$8; diceS[15]=${16}



#----------------------------------------------------------------------------------
# calculate permutation number for the current dice toss 
# (from 10 * 2 * 2 * 11^13 =1,380,908,485,757,240 possibilities)
#----------------------------------------------------------------------------------
currMeas=0
for measj in ${diceS[*]} ; do
	currMeas=`expr $currMeas + 1`
	ruletab $measj
	measPerm="$measPerm${measNR[$currMeas-1]}:"
done
measPerm="$measPerm:"

#----------------------------------------------------------------------------------
# if output abc file already exists, then make a back-up copy
#----------------------------------------------------------------------------------
if [ -f $filen ]; then 
	mv $filen $filen."bak"
fi


#----------------------------------------------------------------------------------
# generate the header of the ABC file
#----------------------------------------------------------------------------------
catToFile "%%scale 0.65
%%pagewidth 21.10cm
%%bgcolor white
%%topspace 0
%%composerspace 0
%%leftmargin 0.80cm
%%rightmargin 0.80cm
X:$dbNum
T:$fileInd
%%setfont-1 Courier-Bold 8
T:\$1K.AnhC30::$measPerm\$0
T:\$1Perm. No.: $dbNum\$0
M:2/4
L:1/8
Q:1/8=128
%%staves [1 2]
V:1 clef=treble
V:2 clef=bass
K:C"

#----------------------------------------------------------------------------------
# write the notes of the ABC file
#----------------------------------------------------------------------------------
currMeas=0
for measj in ${diceS[*]} ; do
	currMeas=`expr $currMeas + 1`
	ruletab $measj
	measN=${measNR[$currMeas-1]}
	phrG=${notesG[$measN-1]}
	phrF=${notesF[$measN-1]}
	if [ "${currMeas}" == "1" ]; then
		catToFile "%1
[V:1]|: $phrG | \\
[V:2]|: $phrF | \\"
		continue
	elif [ "$currMeas" = "7" ]; then 
		catToFile "%7
[V:1] $phrG \\
[V:2] $phrF \\"
		continue
	elif [ "$currMeas" = "8" ]; then
		if [ "$measN" = "102" ]; then
			catToFile "%8a
[V:1]|1 $phrG :|2
[V:2]|1 $phrF :|2
%8b
[V:1] $phrG |: \\
[V:2] B,,/G,,/B,,/D,/ G,,/A,,/B,,/C,/ |: \\"
		else
			catToFile "%8a
[V:1]|1 $phrG :|2
[V:2]|1 $phrF :|2
%8b
[V:1] $phrG |: \\
[V:2] G,,2G,,/A,,/B,,/C,/ |: \\"
		fi
		continue
	elif [ "$currMeas" = "16" ]; then
		catToFile "%16
[V:1] $phrG :|]
[V:2] $phrF :|]"
		continue
	else
		catToFile "%$currMeas
[V:1] $phrG | \\
[V:2] $phrF | \\"
	fi
done

# create SVG
abcm2ps ./$filen -O ./"KAnhC30-$fileInd.svg" -g

# create MIDI
abc2midi ./$filen -quiet -silent -o ./"KAnhC30-$fileInd.mid"
#
##
###
