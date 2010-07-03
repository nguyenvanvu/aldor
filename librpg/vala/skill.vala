namespace LibRPG {
    namespace DD {
		
		[SimpleType] public struct Skill : uint { }
		
		enum SKILL {
			DODGE=0,
			RIDE,
			SWIM,
			HIDE
		}
		
		uint SKILL_MAX_NUM = 4;
		
		
		
		/* ------------------- We may want to pass this to some kind of storage system later ------ */
		/* abilities - skills matching: */
		private Ability[] SKILLS_ABILITY = new Ability[SKILL_MAX_NUM];
		SKILLS_ABILITY[SKILL.DODGE] = ABILITY_DEXTERITY;
		SKILLS_ABILITY[SKILL.SWIM] = ABILITY_STRENGTH;
		//...
		
		
		
		/* skill names: */
		private string[] SKILL_NAMES = new string[SKILL_MAX_NUM];
		SKILL_NAMES[SKILL.DODGE] = "esquiva";
		SKILL_NAMES[SKILL.SWIM] = "nadar";
		//...
		
		/*-------------------------------------------*/
		
		
		

		public class SkillList {
				
				private Skill[] list = new Skill[SKILL_MAX_NUM];
				
				
				public uint get_by_id(Skill skill_id) {
					return list[skill_id];
				}
				public void set_by_id(Skill skill_id, uint n) {
					list[skill_id] = n;
				}
				
			
		}
		
	}	
}
