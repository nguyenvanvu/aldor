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
			
			
			public Creature.from_file(string path) {
				
				sheet_path = path;
				var reader = new Xml.TextReader.filename(path);
				
				while (reader.read()==1) {
					// parse based on NodeType
					
					if(reader.node_type()==Xml.ElementType.ELEMENT_NODE) {
						
						int n = reader.attribute_count();
						stdout.printf(reader.name()+" has "+n.to_string()+" attributes:\n");
						//stdout.printf("\t\t"+reader.read_string()+"\n");
						
						for(int i=0; i<n; i++) {
							reader.move_to_attribute_no(i);
							stdout.printf("\tattribute: "+reader.name()+"="+reader.value()+"\n");
						}
						reader.read();
						//stdout.printf("\t\t"+reader.node_type().to_string()+" has value? "+reader.has_value().to_string()+"  "+reader.value()+"\n");
						if(reader.node_type()==Xml.ElementType.TEXT_NODE) {
							stdout.printf("\tvalue: "+reader.value()+"\n");
						} 
						
							  
						
					
					}
					
					
					
				}

				
				
				reader.close();
				
			}
			
								
		} 
	}	
}
