#!/bin/bash
#CONFIG

SKILLS_DB_PATH="../data"
SKILLS_DB_FILE_NAME="skills.sqlite"
SKILLS_DB="$SKILLS_DB_PATH/$SKILLS_DB_FILE_NAME"

SRC_PATH="."
PRE_FILE_NAME="skill.pre.vala"
POST_FILE_NAME="skill.post.vala"
TMP_FILE="/tmp/gen_enum_tmp.txt";


SEPARATOR="|"


#DON'T TOUCH BELOW THIS LINE!

#---------------------------------------------------------------------

PRE_FILE="$SRC_PATH/$PRE_FILE_NAME"
POST_FILE="$SRC_PATH/$POST_FILE_NAME"

cp $PRE_FILE $POST_FILE


##################################
#FUNCTIONS:
##################################
function change_last_char_in_doc {
	sed '$s/,$/;/' -i $1
}

function generate_enum_from_bd {
	
	echo "" > $1

	IDs=`sqlite3 $SKILLS_DB "SELECT id FROM $2;"`

	#guardamos el enum en un archivo temporal...
	for row in $IDs; do
		CNAME=(`sqlite3 $SKILLS_DB "SELECT cname FROM $2 WHERE id=$row;"`)
		echo "			$CNAME=$row," >> $1
	done;
	
	#el ultimo elemento debe llevar ';' y no ','
	change_last_char_in_doc $1
	
	
}


function replace_pattern_with_file {
	#Sacamos linebreaks para el sed:
ENUM=`cat $TMP_FILE | tr "\n" $SEPARATOR`

#Cambiamos la pattern por el enum:
sed "s#$3#$ENUM#" -i $2

#Volvemos a poner los linebreak donde haga falta:
cat $2 | tr "|" "\n" > $1
cat $1 > $2
	
}


#---------------------------------------------------------------------


########################
#	SKILLS
########################

generate_enum_from_bd $TMP_FILE "skills"


replace_pattern_with_file $TMP_FILE $POST_FILE "GEN_ENUM_SKILL"



########################
#	SKILL GROUPS
########################

generate_enum_from_bd $TMP_FILE "groups"


replace_pattern_with_file $TMP_FILE $POST_FILE "GEN_ENUM_GROUP"



########################
#	SKILL CATEGORY
########################

generate_enum_from_bd $TMP_FILE "categories"


replace_pattern_with_file $TMP_FILE $POST_FILE "GEN_ENUM_CATEGORY"

