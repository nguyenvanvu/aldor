namespace RPG {
		
		//[SimpleType] public struct Skill : uint { }
		
		public enum Skill {
			//SWORD COMBAT CATEGORY:
			COMBAT_SHORT_SWORD=0,
			COMBAT_LONG_SWORD,
			COMBAT_GREAT_SWORD,
			
			//AXE COMBAT CATEGORY:
			COMBAT_HAND_AXE,
			COMBAT_WAR_AXE,
			COMBAT_BIG_AXE,
			
			//BOW COMBAT CATEGORY:
			COMBAT_SHORT_BOW,
			COMBAT_LONG_BOW,
			
			//SHIELD COMBAT CATEGORY:
			COMBAT_SHIELD,
			
			OPEN_LOCKS,
			SET_REMOVE_TRAPS,
			TIE_KNOT,
			
			POTTERY,
			FORGE,
			JEWERLLY,
			QUARRY,
			CARPENTRY,
			FUR,
			TAILORING,
			
			//PLAY WIND INSTRUMENTS CATEGORY:
			PLAY_FLUTE,
			PLAY_OCARINA,
			PLAY_HORN,
			
			//PLAY STRING INSTRUMENTS CATEGORY:
			PLAY_HARP,
			PLAY_GUITAR,
			PLAY_LUTE,
			
			//PHYSICS KNOWLEDGE CATEGORY:
			KNOWLEDGE_SKY,
			KNOWLDGE_GEOGRAPHY,
			
			//BIOLOGICAL KNOWLEDGE CATEGORY:
			KNOWLEDGE_BOTANY,
			KNOWLEDGE_ZOOLOGY,
			KNOWLEDGE_VENOMS,
			
			//HUMAN KNOWLEDGE CATEGORY:
			KNOWLEDGE_HISTORY,
			KNOWLEDGE_POLITICS,
			KNOWLEDGE_TRADE,
			KNOWLEDGE_NAVIGATION,
			
			//RESISTANCE:
			RESISTANCE_COLD,
			RESISTANCE_HOT,
			RESISTANCE_TORTURE,
			RESISTANCE_VENOMS
			
		}
		
		//static const uint N_SKILLS;
		
		public enum SkillCategory {
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
			SkillCategory category;
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
			SKILLS_INFO[Skill.COMBAT_SHORT_SWORD] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.COMBAT_LONG_SWORD] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.COMBAT_GREAT_SWORD] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			
			//AXE COMBAT CATEGORY:
			SKILLS_INFO[Skill.COMBAT_HAND_AXE] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.COMBAT_WAR_AXE] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.COMBAT_BIG_AXE] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			
			//BOW COMBAT CATEGORY:
			SKILLS_INFO[Skill.COMBAT_SHORT_BOW] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.COMBAT_LONG_BOW] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			
			//SHIELD COMBAT CATEGORY:
			SKILLS_INFO[Skill.COMBAT_SHIELD] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			
			SKILLS_INFO[Skill.OPEN_LOCKS] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.SET_REMOVE_TRAPS] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.TIE_KNOT] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			
			SKILLS_INFO[Skill.POTTERY] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.FORGE] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.JEWERLLY] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.QUARRY] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.CARPENTRY] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.FUR] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.TAILORING] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			
			//PLAY WIND INSTRUMENTS CATEGORY:
			SKILLS_INFO[Skill.PLAY_FLUTE] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.PLAY_OCARINA] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.PLAY_HORN] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			
			//PLAY STRING INSTRUMENTS CATEGORY:
			SKILLS_INFO[Skill.PLAY_HARP] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.PLAY_GUITAR] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.PLAY_LUTE] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
		
			//PHYSICS KNOWLEDGE CATEGORY:
			SKILLS_INFO[Skill.KNOWLEDGE_SKY] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.KNOWLDGE_GEOGRAPHY] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
		
			//BIOLOGICAL KNOWLEDGE CATEGORY:
			SKILLS_INFO[Skill.KNOWLEDGE_BOTANY] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.KNOWLEDGE_ZOOLOGY] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.KNOWLEDGE_VENOMS] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			
			//HUMAN KNOWLEDGE CATEGORY:
			SKILLS_INFO[Skill.KNOWLEDGE_HISTORY] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.KNOWLEDGE_POLITICS]= {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.KNOWLEDGE_TRADE] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.KNOWLEDGE_NAVIGATION] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			
			//RESISTANCE:
			SKILLS_INFO[Skill.RESISTANCE_COLD] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.RESISTANCE_HOT] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.RESISTANCE_TORTURE] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			SKILLS_INFO[Skill.RESISTANCE_VENOMS] = {Ability.STRENGTH, Ability.NONE, SkillCategory.NONE};
			//...
			
			
			/*-------------------------------------------*/
		
	}

		
		
		public Ability skill_get_1st_ability_based_on(Skill skill) {
			return SKILLS_INFO[skill].first;
		}
		
		public Ability skill_get_2nd_ability_based_on(Skill skill) {
			return SKILLS_INFO[skill].second;
		}
		
		public SkillCategory skill_get_category(Skill skill) {
			return SKILLS_INFO[skill].category;
		}
		

		public class SkillList : Object {
				
				private uint[] list;
				
				
				public uint get_base(Skill skill) {
					return list[skill];
				}
				public void set_base(Skill skill, uint n) {
					stdout.printf("HELLOOOO2!\n");
					list[skill] = n;
					stdout.printf("HELLOOOO3!\n");
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
					if(skill_get_2nd_ability_based_on(skill)==Ability.NONE) 
						return this.get_ability_mod40(skill_get_1st_ability_based_on(skill));
					 else 
						return this.get_ability_mod20(skill_get_1st_ability_based_on(skill)) 
							+  this.get_ability_mod20(skill_get_2nd_ability_based_on(skill));	
					
				}
				
				
				public int get_skill_category_mod(Skill skill) {
					SkillCategory cat = skill_get_category(skill);
					
					uint max=0;
					/* foreach still not implemented in enums. I've opened a bug myself:
					foreach (var skill in Skill.values) {
							if(SKILLS_INFO[skill].category == cat && sl.get_base()>max)
								max = sl.get_base();	
					}*/
					for(int i=0; i<SKILLS_INFO.length; i++) {
							if(SKILLS_INFO[i].category == cat && sl.get_base((Skill) i)>max)
								max = sl.get_base((Skill) i);
					}
					return ((int) max - 50)*20 / 100;
				}
				
				public uint get_skill_total(Skill skill) {
					int sbase = (int) this.get_skill_base(skill);
					int scat = this.get_skill_category_mod(skill);
					
					return scat.max(scat, sbase) + this.get_skill_ab_mod(skill);

				}
				
		
		
		}
		
			
}
