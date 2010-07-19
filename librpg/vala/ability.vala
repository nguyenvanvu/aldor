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
				
				public int get_mod40(Ability ab) {
					return ((int) list[ab] - 50)*40 / 100 ;
				}
				
				public int get_mod20(Ability ab) {
					return ((int) list[ab] - 50)*20 / 100 ;
				}
				
				
				public AbilityList () {
					EnumClass cls = (EnumClass) typeof(Ability).class_ref();
					list = new uint[cls.n_values-1]; //NONE doesn't need mem space
					
				}
			
		}
		
		public interface iAbilityList : Object {
			
				protected abstract AbilityList al {get; set;}
		
				public uint get_ability_base(Ability ab) {
					return al.get_base(ab);
				}
				
				public void set_ability_base(Ability ab, uint n) {
					al.set_base(ab, n);
				}
				
				public int get_ability_mod20(Ability ab) {
					return al.get_mod20(ab);
				}
				
				public int get_ability_mod40(Ability ab) {
					return al.get_mod40(ab);
				}
		}
		

}
