namespace RPG {
    namespace DD {
		
		public class Creature : Object {
		
			/* Private elements */
			
				//private ClassInfo _classes;
				private SkillList sl;
				private AbilityList al;
				private string sheet_path;
				
			/* Standard getters/setters */
				public uint uid { get; private set; default = 0; }
				public string name { get; set; default = "unknown"; }
				public string surname { get; set; default = "unknown"; }
				public uint age { get; set; default = 0; }
				public uint height { get; set; }
				public uint weight { get; set; }
				public Race race { get; set; default = 0; }
				public Gender gender { get; set; default = Gender.UNKNOWN; }
				public Alignment alignment { get; set; }
				public Inventory inventory { get; set; }
				public Equipment equipment { get; set; }
				
			/* Non-Standard getters/setters */
				public uint skill_base_get(Skill id) {
					return sl.get_base_by_id(id);
				}
				public void skill_base_set(Skill id, uint n) {
					sl.set_base_by_id(id, n);
				}
				
				public uint skill_ab_mod_get(Skill id) {
					Ability ab = SKILLS_ABILITY[id];
					return al.get_mod_by_id(ab);
				}
				
				public uint skill_total_get(Skill id) {
					return this.skill_base_get(id) + this.skill_ab_mod_get(id);
				}
				
				public uint ability_base_get(Ability id) {
					return al.get_base_by_id(id);
				}
				
				public uint ability_mod_get(Ability id) {
					return al.get_mod_by_id(id);
				}
				
				
				/* Constructors */
				
				/* ejemplo basico para ver como funciona la clase TextReader : */
				/*
				public Creature.from_file(string path) {
					sheet_path = path;
					var reader = new Xml.TextReader.filename(path);
					reader.read();
					//reader.move_to_element ();
					stdout.printf("holaa\n");
					stdout.printf(reader.name()+"\n");
					
					int n = reader.attribute_count();
					stdout.printf("Nombre d'atributs: "+n.to_string()+"\n");
					
					reader.move_to_first_attribute();
					stdout.printf(reader.name()+"\n"); 
					reader.read_attribute_value();
					stdout.printf(reader.value()+"\n");
					
					reader.read();
					reader.read();
					stdout.printf(reader.name()+"\n");
					reader.read();
					stdout.printf(reader.value()+"\n");
					reader.close();
					
				}*/
				
			public Creature.from_file(string path) {
				sheet_path = path;
				var reader = new Xml.TextReader.filename(path);
				
				string name, val;
				//foreach element:
				while(reader.read()==1) {
					name = reader.name();
					stdout.printf(name+"\n");
					
					reader.read();
					if(reader.has_value()==1) {
						val = reader.value();
						stdout.printf(val+"\n");
						

						
						switch(name) {
							
						case "name":
								this.name=val;
								reader.read();
								reader.read();
								break;
						case "surname":
								this.surname=val;
								reader.read();
								reader.read();
								break;
						case "age":
								this.age=(uint) val.to_int;
								reader.read();
								reader.read();
								break;
						default:
								stdout.printf("UNKNOWN OPTION: "+name+"\n");
								break;
						}
						
						
					} else stdout.printf("<No Value>\n");
					
					
				}
				
				reader.close();
				
			}
								
		} 
	}	
}
