namespace RPG {
		
		public class Dice : Object {
				
				public uint faces {get; set; default=100;}
				
				public Dice.n_faces(uint n) {
						TimeVal seeed = TimeVal();
						seeed.get_current_time();
						
						Random.set_seed((uint32) seeed.tv_sec);
						faces = n;
				}
				
				public Dice () {
						this.n_faces(100);	
				}
				
				
				public uint throw () {
						return (uint) Random.int_range(1,(int32) faces+1);
				}
			
			
		}
		
		
}
