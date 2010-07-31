namespace RPG {
	
		
		public class Player : Object {
				
				public string username { get; set; default = "unknown"; }
				public string ip { get; set; default = "0.0.0.0"; }
				public uint status { get; set; }
				
				public Player() {
					stdout.printf("I'm inside the player constructor!\n");	
				}
				
				~Player() {
					stdout.printf("I'm inside the player destructor!\n");
				}
				/*TODO: methods to get character info */
				
		} 
		
		
			
}
		
