
using RPG;


int main(string[] args) {
        
        if(args.length<2) {
				stdout.printf("Please, pass the path to the xml file as 2nd param\n");
				return 1;
		}
		
		rpg_init();
		
		var pc = new PC.from_file(args[1]);
		/*GENERAL INFO*/
		stdout.printf("\n\n\n\nCharacter "+pc.name+" "+pc.surname+" has "+pc.age.to_string()+" years\n");
		if(pc.gender!=Gender.FEMALE)
			stdout.printf("He");
		else
			stdout.printf("She");
		stdout.printf(" is "+pc.height.to_string()+" meters tall and has race_id="+pc.race.to_string()+"\n");
		
		
		
		/*DICE*/
		stdout.printf("\n\n\n\n");
		
		var d100 = new Dice();
		
		stdout.printf("Tiro un dado de "+d100.faces.to_string()+" y saco un "+d100.throw().to_string()+"\n");
		
		
		
		/*SKILLS & ABILITIES*/
		stdout.printf("\n\n\n\n");
		
		pc.set_skill_base(Skill.COMBAT_SHORT_SWORD, 30);
		pc.set_ability_base(Ability.DEXTERITY, 50);
		pc.set_ability_base(Ability.CHARISMA, 70);
		pc.set_ability_base(Ability.STRENGTH, 20);
		stdout.printf("Modificador 20% de carisma: "+pc.get_ability_mod20(Ability.CHARISMA).to_string()+"\n");
		
		stdout.printf(Skill.COMBAT_SHORT_SWORD.to_string()+" name="+
						skill_get_name(Skill.COMBAT_SHORT_SWORD)+" group="+
						skill_get_group(Skill.COMBAT_SHORT_SWORD).to_string()+"\n");
						
						
		//pc.player.username = "usuario cualquiera";				
		pc.save_to_file("example_generated.xml");
		
        return 0;
    }

