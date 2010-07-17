namespace RPG {
		
		//[SimpleType] public struct Skill : uint { }
		
		public enum Skill {
			DODGE=0,
			RIDE,
			SWIM,
			HIDE
		}
		
		uint SKILL_MAX_NUM = 4;
		
		public Ability[] SKILLS_ABILITY;
		private string[] SKILL_NAMES;
		
		void skill_stuff_load() {
		
			/* ------------------- We may want to pass this to some kind of storage system later ------ */
			/* abilities - skills matching: */
			SKILLS_ABILITY = new Ability[SKILL_MAX_NUM];
			SKILLS_ABILITY[Skill.DODGE] = Ability.DEXTERITY;
			SKILLS_ABILITY[Skill.SWIM] = Ability.STRENGTH;
			//...
			
			
			
			/* skill names: */
			SKILL_NAMES = new string[SKILL_MAX_NUM];
			SKILL_NAMES[Skill.DODGE] = "esquiva";
			SKILL_NAMES[Skill.SWIM] = "nadar";
			//...
			
			/*-------------------------------------------*/
		
	}
		

		public class SkillList {
				
				private uint[] list = new uint[SKILL_MAX_NUM];
				
				
				public uint get_base_by_id(Skill skill_id) {
					return list[skill_id];
				}
				public void set_base_by_id(Skill skill_id, uint n) {
					list[skill_id] = n;
				}
				
			
		}
			
}
