namespace RPG {
		
		public enum Ability {
			NONE=-1,
			STRENGTH=0,
			DEXTERITY,
			CONSTITUTION,
			INTELLIGENCE,
			WISDOM,
			CHARISMA
		}

		
		public class AbilityList {
			
				private uint[] list;
				
				
				public uint get_base_by_id(Ability ability_id) {
					return list[ability_id];
				}
				
				public void set_base_by_id(Ability ability_id, uint n) {
					list[ability_id] = n;
				}
				
				public uint get_mod_by_id(Ability ability_id) {
					return (list[ability_id] - 10) / 2 ;
				}
				
				
				public AbilityList () {
					EnumClass cls = (EnumClass) typeof(Ability).class_ref();
					list = new uint[cls.n_values]; //NONE doesn't need mem space
					
				}
			
		}
		
		public interface iAbilityList : Object {
			
				private abstract AbilityList al {get; set;}
		
				public uint ability_base_get(Ability id) {
					return al.get_base_by_id(id);
				}
				
				public uint ability_mod_get(Ability id) {
					return al.get_mod_by_id(id);
				}
		}
		

}
