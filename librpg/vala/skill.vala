namespace RPG {
		
		//[SimpleType] public struct Skill : uint { }
		
		
		public enum SkillGroup {
			NONE=-1,
			COMBAT_SWORD=0,
			COMBAT_AXE,
			COMBAT_BOW,
			COMBAT_SHIELD,
			PLAY_INSTRUMENT_WIND,
			PLAY_INSTRUMENT_STRING,
			KNOWLEDGE_PHYSICS,
			KNOWLEDGE_BIOLOGICAL,
			KNOWLEDGE_HUMAN,
			RESISTANCE
		}
		
		private struct SkillInfo {
			Ability first;
			Ability second;
			SkillGroup group;
		}
		
		private SkillInfo[] SKILLS_INFO;
		
		void skill_stuff_load() {
		
			/* ------------------- We may want to pass this to some kind of storage system later ------ */
			/* abilities - skills matching: */
			
			
			/*This is necessary to get number of elements in e num till a patch gets in new vala */
			EnumClass cls = (EnumClass) typeof(Skill).class_ref();
			
			//const uint N_SKILLS = cls.n_values;
			
			SKILLS_INFO = new SkillInfo[cls.n_values];
			
			
			/*TODO: PUT CORRECT ABILITIES IN EACH SKILL */
			//SWORD COMBAT CATEGORY:
			SKILLS_INFO[Skill.COMBAT_SHORT_SWORD] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.COMBAT_LONG_SWORD] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.COMBAT_GREAT_SWORD] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			
			//AXE COMBAT CATEGORY:
			SKILLS_INFO[Skill.COMBAT_HAND_AXE] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.COMBAT_WAR_AXE] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.COMBAT_BIG_AXE] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			
			//BOW COMBAT CATEGORY:
			SKILLS_INFO[Skill.COMBAT_SHORT_BOW] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.COMBAT_LONG_BOW] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			
			//SHIELD COMBAT CATEGORY:
			SKILLS_INFO[Skill.COMBAT_SHIELD] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			
			SKILLS_INFO[Skill.OPEN_LOCKS] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.SET_REMOVE_TRAPS] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.TIE_KNOT] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			
			SKILLS_INFO[Skill.POTTERY] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.FORGE] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.JEWERLLY] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.QUARRY] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.CARPENTRY] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.FUR] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.TAILORING] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			
			//PLAY WIND INSTRUMENTS CATEGORY:
			SKILLS_INFO[Skill.PLAY_FLUTE] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.PLAY_OCARINA] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.PLAY_HORN] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			
			//PLAY STRING INSTRUMENTS CATEGORY:
			SKILLS_INFO[Skill.PLAY_HARP] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.PLAY_GUITAR] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.PLAY_LUTE] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
		
			//PHYSICS KNOWLEDGE CATEGORY:
			SKILLS_INFO[Skill.KNOWLEDGE_SKY] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.KNOWLDGE_GEOGRAPHY] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
		
			//BIOLOGICAL KNOWLEDGE CATEGORY:
			SKILLS_INFO[Skill.KNOWLEDGE_BOTANY] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.KNOWLEDGE_ZOOLOGY] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.KNOWLEDGE_VENOMS] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			
			//HUMAN KNOWLEDGE CATEGORY:
			SKILLS_INFO[Skill.KNOWLEDGE_HISTORY] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.KNOWLEDGE_POLITICS]= {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.KNOWLEDGE_TRADE] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.KNOWLEDGE_NAVIGATION] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			
			//RESISTANCE:
			SKILLS_INFO[Skill.RESISTANCE_COLD] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.RESISTANCE_HOT] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.RESISTANCE_TORTURE] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			SKILLS_INFO[Skill.RESISTANCE_VENOMS] = {Ability.STRENGTH, Ability.CHARISMA, SkillGroup.NONE};
			//...
			
			
			/*-------------------------------------------*/
		
	}

		
		
		public Ability skill_get_1st_ability_based_on(Skill skill) {
			return SKILLS_INFO[skill].first;
		}
		
		public Ability skill_get_2nd_ability_based_on(Skill skill) {
			return SKILLS_INFO[skill].second;
		}
		
		public SkillGroup skill_get_group(Skill skill) {
			return SKILLS_INFO[skill].group;
		}
		

		public class SkillList : Object {
				
				private uint[] list;
				
				
				public uint get_base(Skill skill) {
					return list[skill];
				}
				public void set_base(Skill skill, uint n) {
					list[skill] = n;
				}
				
				
				public SkillList () {
					EnumClass cls = (EnumClass) typeof(Skill).class_ref();
					list = new uint[cls.n_values];
				}
				
			
		}
		
		
				/* methods available for classes with SkillList */
		public interface iSkillList : Object, iAbilityList {
			
				protected abstract SkillList sl {get; set;}

				public uint get_skill_base(Skill skill) {
					return sl.get_base(skill);
				}
				public void set_skill_base(Skill skill, uint n) {
					sl.set_base(skill, n);
				}
				
				
				public uint get_skill_ab_mod(Skill skill) {
						return this.get_ability_mod20(skill_get_1st_ability_based_on(skill)) 
							+  this.get_ability_mod20(skill_get_2nd_ability_based_on(skill));		
				}
				
				
				public int get_skill_group_mod(Skill skill) {
					SkillGroup cat = skill_get_group(skill);
					
					uint max=0;
					/* foreach still not implemented in enums. I've opened a bug myself:
					foreach (var skill in Skill.values) {
							if(SKILLS_INFO[skill].category == cat && sl.get_base()>max)
								max = sl.get_base();	
					}*/
					for(int i=0; i<SKILLS_INFO.length; i++) {
							if(SKILLS_INFO[i].group == cat && sl.get_base((Skill) i)>max)
								max = sl.get_base((Skill) i);
					}
					return ((int) max - 50)*20 / 100;
				}
				
				public uint get_skill_total(Skill skill) {
					int sbase = (int) this.get_skill_base(skill);
					int scat = this.get_skill_group_mod(skill);
					
					return scat.max(scat, sbase) + this.get_skill_ab_mod(skill);

				}
				
		
		
		}
		
			
}
