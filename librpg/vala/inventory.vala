namespace LibRPG {
    namespace DD {
		
		
		struct InventoryCoord {
			int x;
			int y;
		}
		
		//in slots
		const uint INVENTORY_WIDTH = 20;
		const uint INVENTORY_HEIGHT = 8;
		
		
		public class Inventory : Object {
			
			private Item[,] table = new Item[INVENTORY_HEIGHT,INVENTORY_WIDTH];
			
			
			private void Inventory() {
					//set all slots initially to null
					foreach(var slot in table) {
						slot = null;
					}
			}
			
			
			//x=-1 if there's no place
			private InventoryCoord find_place_for_item(Item item) {
				
				int horiz = 0;
				var coord = InventoryCoord();
				
				for(int j = 0; j<=INVENTORY_HEIGHT-item.height; j++) {
					for(int i = 0; i<=INVENTORY_WIDTH-item.width; i++) {
						
						
						if(table[j,i]==null) {
							
							horiz++;	
							
							//enoguh horiz space, now we look vert:
							if(horiz==item.width) {
								
								bool ok=true;
								for(int k = i-horiz; k<=item.width && ok; k++) {
									
									for(uint z = j; z-j<item.height && ok; z++) {
											if(table[z,k]!=null) {
												ok=false; 
												horiz=0;
											}
									}
									
								}
								
								if(ok) {
										coord.x = i-horiz;
										coord.y = j;
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
				
				coord.x = -1;
				return coord;
			}
			
			
			
			public bool put_item(Item item) {
					InventoryCoord coord = this.find_place_for_item(item);
					if(coord.x!=-1) {
						table[coord.y,coord.x] = item;
						return true;
					}
					else return false;
			}
		
			
		}
		
		
		
	}	
}
