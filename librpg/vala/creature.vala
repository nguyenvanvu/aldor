namespace RPG {
		
		public class Creature : Object, iAbilityList, iSkillList, iInventory {
		
			/* Private elements */
			
				//private ClassInfo _classes;
				protected SkillList sl {get; set;}
				protected AbilityList al {get; set;}
				protected Inventory inventory { get; set; }
				
			/* Standard getters/setters */
				public uint uid { get; private set; default = 0; }
				public string sheet_path{get; private set; default = "unknown"; }
				public string name { get; set; default = "unknown"; }
				public string surname { get; set; default = "unknown"; }
				public uint age { get; set; default = 0; }
				public double height { get; set; }
				public double weight { get; set; }
				public Race race { get; set; default = 0; }
				public Gender gender { get; set; default = Gender.UNKNOWN; }
				public Alignment alignment { get; set; }
				public Equipment equipment { get; set; }
				
			/* Non-Standard getters/setters */
			
				
				
				
				/* Constructors */
			
			public Creature() {
				
				sl = new SkillList();
				al = new AbilityList();
				inventory = new Inventory();
				
			}
			
			public void load_from_file(string path) {
				this.sheet_path = path;
				var reader = new Xml.TextReader.filename(this.sheet_path);
				
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
						this.parse_XmlElement(elem);
					
					}
					
					
					
				}
				
				reader.close();
				
			}
			
			public void load() {
					this.load_from_file(this.sheet_path);
			}
			
			
			public void save_to_file(string file_path) {
				
				var writer = new Xml.TextWriter.filename (file_path);
				writer.set_indent (true);
				writer.set_indent_string ("\t");
	
				writer.start_document();
				writer.start_element("sheet");
				
				this.save_xml_info(writer);

				writer.end_element();
				
				sheet_path = file_path;
				
			}
			
			public void save() {
					this.save_to_file(this.sheet_path);
			}
			
			
			
			
			protected virtual void save_xml_info(Xml.TextWriter writer) {
				writer.write_element ("name", this.name);
				writer.write_element ("surname", this.surname);
				
			}
			
			
			
			protected virtual bool parse_XmlElement(XmlElement elem) {
				bool found = true;
				
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
							found=false;
							break;
					}
				return found;
				
			}

			
								
		} 	
}
