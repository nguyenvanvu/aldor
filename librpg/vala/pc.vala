namespace RPG {
		
		
		public class PC : Creature {
			
			public Player player {get; set;}
			
			public PC() {
				
				base();
				
				player = new Player();
				
			}
			
			
			
			
			/*overrides from creature: */
			
			protected override void save_xml_info(Xml.TextWriter writer) {
				writer.write_element ("player", this.player.username);
				base.save_xml_info(writer);
			}
			
			
			
			protected override bool parse_XmlElement(XmlElement elem) {
				
				bool found=true;
					
					switch(elem.name) {
							case "player":
								player.username = elem.text;
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
