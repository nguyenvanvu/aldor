
using RPG;
using DD;


int main(string[] args) {
        
        if(args.length<2) {
				stdout.printf("Please, pass the path to the xml file as 2nd param\n");
				return 1;
		}
		
		rpg_init();
		
		var pc = new Creature.from_file(args[1]);
		
		stdout.printf("\n\n\n\nCharacter "+pc.name+" "+pc.surname+" has "+pc.age.to_string()+" years\n");
		
		
        return 0;
    }

