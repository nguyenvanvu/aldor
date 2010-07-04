namespace LibRPG {
    namespace DD {
		
		public enum Ability {
			STRENGTH=0,
			DEXTERITY,
			CONSTITUTION,
			INTELLIGENCE,
			WISDOM,
			CHARISMA
		}
		
		uint ABILITY_MAX_NUM = 6;
		
		string[] ABILITY_NAMES;
		
		
		
		
		
		public void ability_stuff_load() {
			ABILITY_NAMES = new string[ABILITY_MAX_NUM];
			/* ------------------- We may want to pass this to some kind of storage system later ------ */
		
			/* skill names: */
			string[] ABILITY_NAMES = new string[SKILL_MAX_NUM];
			ABILITY_NAMES[Ability.STRENGTH] = "fuerza";
			ABILITY_NAMES[Ability.DEXTERITY] = "destreza";
			//...
			
			/*-------------------------------------------*/
		
			
		}

		
		public class AbilityList {
				
				private uint[] list = new uint[ABILITY_MAX_NUM];
				
				
				public uint get_base_by_id(Ability ability_id) {
					return list[ability_id];
				}
				
				public void set_base_by_id(Ability ability_id, uint n) {
					list[ability_id] = n;
				}
				
				public uint get_mod_by_id(Ability ability_id) {
					return (list[ability_id] - 10) / 2 ;
				}
			
		}

	}	
}
