namespace RPG {
		
		public enum Ability {
			NONE=-1,
			STRENGTH=0,
			AGILITY,
			CONSTITUTION,
			INTELLIGENCE,
			DEXTERITY,
			CHARISMA,
			APPEARENCE
		}

		
		public class AbilityList {
			
				private uint[] list;
				
				
				public uint get_base(Ability ab) {
					return list[ab];
				}
				
				public void set_base(Ability ab, uint n) {
					list[ab] = n;
				}
				
				public int get_mod(Ability ab) {
					return ((int) list[ab] - 50)*40 / 100 ;
				}
				
				
				public AbilityList () {
					EnumClass cls = (EnumClass) typeof(Ability).class_ref();
					list = new uint[cls.n_values-1]; //NONE doesn't need mem space
					
				}
			
		}
		
		public interface iAbilityList : Object {
			
				private abstract AbilityList al {get; set;}
		
				public uint ability_base_get(Ability id) {
					return al.get_base(id);
				}
				
				public int ability_mod_get(Ability id) {
					return al.get_mod(id);
				}
		}
		

}
