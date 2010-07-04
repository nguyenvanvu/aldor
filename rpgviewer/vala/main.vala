
using RPG;
using DD;


int main(string[] args) {
        
        if(args.length<2) {
				stdout.printf("Please, pass the path to the xml file as 2nd param\n");
				return 1;
		}
		
		var pc = new Creature.from_file(args[1]);
		
		
		
		
        return 0;
    }

