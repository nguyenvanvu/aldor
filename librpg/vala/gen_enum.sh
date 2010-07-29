#!/bin/bash
#CONFIG

SKILLS_DB_PATH="../data"
SKILLS_DB_FILE_NAME="skills.sqlite"
SKILLS_DB="$SKILLS_DB_PATH/$SKILLS_DB_FILE_NAME"

SRC_PATH="."
FILE_NAME="skill_list.vala"
FILE="$SRC_PATH/$FILE_NAME"

echo "/* File generated automatically, please don't modify it. Run gen_enum.sh instead */


namespace RPG { "> $FILE



########################
#	SKILLS
########################

echo "
		public enum Skill {
" >> $FILE


IDs=`sqlite3 $SKILLS_DB "SELECT id FROM skills;"`

for row in $IDs; do
	CNAME=(`sqlite3 $SKILLS_DB "SELECT cname FROM skills WHERE id=$row;"`)
	echo "			$CNAME=$row," >> $FILE
done;

sed '$s/,$//' -i $FILE


echo "
		} " >> $FILE



########################
#	SKILL GROUPS
########################
echo "

		public enum SkillGroup {
" >> $FILE


IDs=`sqlite3 $SKILLS_DB "SELECT id FROM groups;"`

for row in $IDs; do
	CNAME=(`sqlite3 $SKILLS_DB "SELECT cname FROM groups WHERE id=$row;"`)
	echo "			$CNAME=$row," >> $FILE
done;

sed '$s/,$//' -i $FILE


echo "
		} " >> $FILE
		
		
########################
#	SKILL GROUPS
########################
echo "

		public enum SkillCategory {
" >> $FILE


IDs=`sqlite3 $SKILLS_DB "SELECT id FROM categories;"`

for row in $IDs; do
	CNAME=(`sqlite3 $SKILLS_DB "SELECT cname FROM categories WHERE id=$row;"`)
	echo "			$CNAME=$row," >> $FILE
done;

sed '$s/,$//' -i $FILE


echo "
		} " >> $FILE



####################
#LAST BRACE
####################
echo "
}" >> $FILE
