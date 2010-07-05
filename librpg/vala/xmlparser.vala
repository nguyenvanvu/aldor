namespace RPG {

	public struct XmlAttribute {
		string name;
		string value;	
	}


	public class XmlElement : Object {
		
			public string name { get; set; default = "unknown"; }
			public string text { get; set; default = null; }
			public XmlAttribute[] attlist{ get; set; }
			
			private int att_count;
			
			
			public XmlElement() { }
			
			public void read_from_TextReader(Xml.TextReader reader) {
				
				//stdout.printf("holaaa\n");
				
				this.att_count = reader.attribute_count();
				attlist = new XmlAttribute[this.att_count];
				
				
				this.name = reader.name();
				//stdout.printf(this.name+" has "+this.att_count.to_string()+" attributes:\n");
				
				for(int i=0; i<this.att_count; i++) {
					reader.move_to_attribute_no(i);
					attlist[i].name = reader.name();
					attlist[i].value = reader.value();
					//stdout.printf("\tattribute: "+reader.name()+"="+reader.value()+"\n");
				}
				reader.read();
				//stdout.printf("\t\t"+reader.node_type().to_string()+" has value? "+reader.has_value().to_string()+"  "+reader.value()+"\n");
				if(reader.node_type()==Xml.ElementType.TEXT_NODE) {
					this.text = reader.value();
					//stdout.printf("\tvalue: "+this.text+"\n");
					
				}
				
			}
			
			public int get_att_amount() {
					return this.att_count;
			}
			
			public string get_att_name(uint index) {
					return attlist[index].name;
			}
			public string get_att_value(uint index) {
					return attlist[index].value;
			}
			
			
			public string lookup_att_value(string name) {
					foreach(var att in attlist) {
							if(att.name==name)
								return att.value;
					}
					return "not found";
			}
			
			public bool has_att_name(string name) {
					foreach(var att in attlist) {
							if(att.name==name)
								return true;
					}
					return false;
			}
			
			public bool has_attributes() {
					return att_count>0;
			}
			
			public bool has_text() {
					return this.text!=null;
			}
			
	}
}
