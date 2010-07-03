namespace LibRPG {
    namespace DD {
		
		[SimpleType] public struct Ability : uint { }
		
		enum ABILITY {
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
			ABILITY_NAMES = new string[SKILL_MAX_NUM];
			/* ------------------- We may want to pass this to some kind of storage system later ------ */
		
			/* skill names: */
			string[] ABILITY_NAMES = new string[SKILL_MAX_NUM];
			ABILITY_NAMES[ABILITY.STRENGTH] = "fuerza";
			ABILITY_NAMES[ABILITY.DEXTERITY] = "destreza";
			//...
			
			/*-------------------------------------------*/
		
			
		}

		
	/*	
		enum Whatever {
			A=0,
			B,
			C,
			D,
			E
		}
		
		uint NUM = 5;
		
		string[] Ar = new string[NUM];
		Ar[Whatever.B] = "fuerza";
		*/
		
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
