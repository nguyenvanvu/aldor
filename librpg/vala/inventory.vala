namespace RPG {
		
		
		struct InventoryCoord {
			int x;
			int y;
			bool valid;
		}
		
		struct InventorySlot {
			int id; //id is -1 if slot is empty
		}
		
		
		private struct InventoryItem {
				Item item;
				InventoryCoord coord;
				bool occupied;
		}
		
		//in slots
		const uint DEFAULT_INVENTORY_WIDTH = 20;
		const uint DEFAULT_INVENTORY_HEIGHT = 8;
		
		
		public class Inventory : Object {
			
			
			/*
			 * Each object inside the inventory has a unique ID representing it.
			 * This ID can change with time though.
			 * 
			 *Inventory consists on 2 structures: 
			 * 1- Slot matrix (inverted axes!) which has slots, each one 
			 * 	  having ID set to -1 if there's no item, and to some ID
			 * 	  if there's some item.
			 * 2- A vector of InvItem, where the ID of an item is the index 
			 *    inside this vector.
			 * 
			 */
			
			
			public uint width { get; private set; default = DEFAULT_INVENTORY_WIDTH; }
			public uint height { get; private set; default = DEFAULT_INVENTORY_HEIGHT; }
			
			
			private InventorySlot[,] table;
			private InventoryItem[] ilist;
			
			public Inventory() {
				
					table = new InventorySlot[DEFAULT_INVENTORY_HEIGHT, DEFAULT_INVENTORY_WIDTH];
					ilist = new InventoryItem[DEFAULT_INVENTORY_WIDTH*DEFAULT_INVENTORY_HEIGHT];
					
					//set all slots initially marked as free
					foreach(var slot in table) {
						slot.id = -1;
					}
					
					foreach (var invitem in ilist) {
							invitem.occupied=false;
					}
			}
			
			public Item? get_item_by_name(string name) {
				foreach(var invit in ilist) {
					if(invit.occupied && invit.item.name==name) return invit.item;
				}
				return null;
			}
			
			public Item? get_item_by_tag(string tag) {
				foreach(var invit in ilist) {
					if(invit.occupied && invit.item.tag==tag) return invit.item;
				}
				return null;
			}
			
			public bool has_item(Item item) {
				foreach(var invit in ilist) {
					if(invit.occupied && invit.item==item) return true;
				}
				return false;
			}
			
			
			//coord.valid=false if there's no place
			private InventoryCoord find_place_for_item(Item item) {
				
				int horiz = 0;
				var coord = InventoryCoord();
				
				for(int j = 0; j<=this.height-item.height; j++) {
					for(int i = 0; i<=this.width-item.width; i++) {
						
						
						if(table[j,i].id!=-1) { //free slot
							
							horiz++;	
							
							//enoguh horiz space, now we look vert:
							if(horiz==item.width) {
								
								bool ok=true;
								for(int k = i-horiz; k<=item.width && ok; k++) {
									
									for(uint z = j; z-j<item.height && ok; z++) {
											if(table[z,k].id!=-1) {
												ok=false; 
												horiz=0;
											}
									}
									
								}
								
								if(ok) {
										coord.x = i-horiz;
										coord.y = j;
										coord.valid=true;
										return coord;
								}
								
							}
						
						} else {
							//reset counter and jump till the end of the actual object
							horiz = 0;
							i += (int) item.width - 1;
						
						}
					}
				}
				
				coord.valid=false;
				return coord;
			}
			
			private int lookup_new_item_id() {
					for(int i=0; i<this.height*this.width; i++)
						if(ilist[i].occupied==false) return i;
					return -1;
			}
			
			
			private void add_item_at_coords(Item item, InventoryCoord coord) {
				
				int id = lookup_new_item_id();
				
				for(int j = coord.y; j <=coord.y+item.height; j++) {
					
						for(int i = coord.x; i<=coord.x+item.width; i++) {
							
								table[j,i].id = id;
						}
					
				}
				
				ilist[id].coord = coord;
				ilist[id].item = item;	
				ilist[id].occupied = true;
				
			}
			
			
			
			public bool add_item(Item item) {
					InventoryCoord coord = this.find_place_for_item(item);
					if(coord.valid) {
						this.add_item_at_coords(item, coord);
						return true;
					}
					return false;
			}
		
			
		}
		
}
