namespace RPG {
    namespace DD {
		
		
		public enum EquipmentPlace {
			HEAD=0,
			CHEST,
			HANDS,
			RIGHT_HAND,
			LEFT_HAND,
			FEET,
			WAIST,
			NECK
		}
		
		
		uint EQUIPMENT_MAX_NUM = 8;
		
		
		public class Equipment {
				
				private Item[] list = new Item[EQUIPMENT_MAX_NUM];
				
				
				public Item get_item_in_place(EquipmentPlace place) {
					return list[place];
				}
				
				public bool set_item_in_place(Item item, EquipmentPlace place) {
					list[place] = item;
					
					/*TODO:
					 * - Check if there's alreay an object and exchange it. 
					 * - Check if the object can go there.
					 * - Check if character can wear that object
					 * - Apply modifications given by the object
					 * */ 
					return true;
				}
				
		}
		
		
		
	}	
}
