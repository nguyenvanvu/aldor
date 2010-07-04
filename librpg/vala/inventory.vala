namespace LibRPG {
    namespace DD {
		
		
		struct InventoryCoord {
			int x;
			int y;
			bool valid;
		}
		
		struct InventorySlot {
			Item item;
			bool occupied;
		}
		
		//in slots
		const uint INVENTORY_WIDTH = 20;
		const uint INVENTORY_HEIGHT = 8;
		
		
		public class Inventory : Object {
			
			
			/*Inventory is a matrix of slots. each object in the inventory may occupy 1 or more slots.
			 * Slot on the top-left corner has the Item information and occupied set to true. 
			 * Other slots occupied by the object has Item=null and occupied set to true.
			 * Free slots has Item=null and occupied set to false 
			 */ 
			
			
			private InventorySlot[,] table = new InventorySlot[INVENTORY_HEIGHT,INVENTORY_WIDTH];
			
			
			private void Inventory() {
					//set all slots initially to null
					foreach(var slot in table) {
						slot.item = null;
						slot.occupied = false;
					}
			}
			
			
			//coord.valid=false if there's no place
			private InventoryCoord find_place_for_item(Item item) {
				
				int horiz = 0;
				var coord = InventoryCoord();
				
				for(int j = 0; j<=INVENTORY_HEIGHT-item.height; j++) {
					for(int i = 0; i<=INVENTORY_WIDTH-item.width; i++) {
						
						
						if(table[j,i].occupied==false) {
							
							horiz++;	
							
							//enoguh horiz space, now we look vert:
							if(horiz==item.width) {
								
								bool ok=true;
								for(int k = i-horiz; k<=item.width && ok; k++) {
									
									for(uint z = j; z-j<item.height && ok; z++) {
											if(table[z,k].occupied) {
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
			
			private void put_item_in_coords(Item item, InventoryCoord coord) {
				
				for(int j = coord.y; j <=coord.y+item.height; j++) {
					
						for(int i = coord.x; i<=coord.x+item.width; i++) {
							
								table[j,i].item = null;
								table[j,i].occupied = true;  
								
						}
					
				}
				
				table[coord.y,coord.x].item = item;
				table[coord.y,coord.x].occupied = true;	
				
			}
			
			
			
			public bool put_item(Item item) {
					InventoryCoord coord = this.find_place_for_item(item);
					if(coord.valid) {
						this.put_item_in_coords(item, coord);
						return true;
					}
					else return false;
			}
		
			
		}
		
		
		
	}	
}
