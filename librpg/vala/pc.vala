namespace RPG {
		
		
		public class PC : Creature {
			
			public Player player {get; set;}
			
			public PC.from_file(string path) {
				
				stdout.printf("HELLOOO!\n");
				
				//player = new Player();
				
				
				stdout.printf("HELLOOO2!\n");
				
				base.from_file(path);
				
			}
			
			
			public void save_to_file(string file_path) {
				var writer = new Xml.TextWriter.filename (file_path);
				writer.set_indent (true);
				writer.set_indent_string ("\t");
	
				writer.start_document();
				writer.start_element("sheet");
				
				//writer.write_element ("player", this.player.username);
				writer.write_element ("name", this.name);
				writer.write_element ("surname", this.surname);

				writer.end_element();
				
			}
			
			
			protected override bool parse_XmlElement(XmlElement elem) {
				
				bool found=true;
					
					switch(elem.name) {
							case "player":
								stdout.printf("HELLOO! PLAYED FOUND WITH NAME="+elem.text+";\n");
								//player.username = elem.text;
								stdout.printf("AFTER ASSIGNMENT! NAME="+elem.text+";\n");
								break;
							default:
								found=false;
								break;
						}
				
				if(!found) return base.parse_XmlElement(elem);
				
				return found;
				
			}
			
			
		}
	
}
