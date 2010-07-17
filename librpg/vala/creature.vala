namespace RPG {
		
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
				public double height { get; set; }
				public double weight { get; set; }
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
						
						var elem = new XmlElement();
						elem.read_from_TextReader(reader); 	
						
						/* DEBUG */
						if(elem.has_text())
							stdout.printf(elem.name+" => "+elem.text+"\n");
						else
							stdout.printf("\n["+elem.name+"]\n");
						if(elem.has_attributes()) {
							stdout.printf("\tAttributes:\n");
							for(int i=0; i<elem.get_att_amount(); i++) {
								stdout.printf("\t"+i.to_string()+". "+elem.get_att_name(i)+" = "+elem.get_att_value(i)+"\n");
							}
						}
						
						/* PARSING */
						switch(elem.name) {
							case "uid":
								uid = elem.text.to_int();
								break;
							
							case "name":
								name = elem.text;
								break;
							
							case "surname":
								surname = elem.text;
								break;
							
							case "age":
								age = elem.text.to_int();
								break;
							
							case "race":
								race = (Race) elem.text.to_int();
								break;
							
							case "height":
								string measure = elem.lookup_att_value("measure");
								if(measure!=null && measure=="feet")
									height = feet_to_m(elem.text.to_double());
								else //default=meters
									height = elem.text.to_double();
								break;
							
							case "weight":
								weight = elem.text.to_int();
								break;
							
							case "gender":
								gender = (Gender) elem.text.to_int();
								break;
							
							default:
								stdout.printf("XmlParser: unknown option "+elem.name+", ommiting it\n");
								break;
						}
					
					}
					
					
					
				}

				
				
				reader.close();
				
			}
			
								
		} 	
}
