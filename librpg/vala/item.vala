namespace LibRPG {
    namespace DD {
		
		
		public enum ItemType {
			ARMOR,
			HELMET,
			SHIELD,
			WEAPON,
			RANGED_WEAPON,
			MISC
		}
		
		
		public enum ItemSize {
			SMALL,
			MEDIUM,
			BIG
		}
		
		
		public class Item : Object {
				public string name { get; set; default="unknown";}
				public uint height { get; set; }
				public uint width { get; set; }
				public uint texture_path { get; set; }
				public string description  { get; set; }
				public ItemType typee { get; set; }
				public ItemSize size { get; set; }
		}
		
	}	
}
