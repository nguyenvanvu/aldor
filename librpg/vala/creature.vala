namespace LibRPG {
    namespace DD {
		
		class Creature : Object {
		
			/* Private elements */
			
				//private ClassInfo _classes;
				private SkillList sl;
				private AbilityList al;
				
			/* Standard getters/setters */
				public uint uid { get; private set; default = 0; }
				public string name { get; set; default = "unknown"; }
				public uint age { get; set; default = 0; }
				public Race race { get; set; default = 0; }
				public Gender gender { get; set; default = GENDER_UNKNOWN; }
			
			/* Non-Standard getters/setters */
				public uint skill_base_get(Skill id) {
					return sl.get_base_by_id(id);
				}
				public void skill_base_set(Skill id, uint n) {
					sl.set_base_by_id(id, n);
				}
				
				public uint skill_ab_mod_get(Skill id) {
					Ability ab = SKILLS_ABILITY[id];
					return al.get_mod_by_id(ab);
				}
				
				public uint skill_total_get(Skill id) {
					return this.skill_base_get(id) + this.skill_ab_mod_get(id);
				}
				
				public uint ability_base_get(Ability id) {
					return al.get_base_by_id(id);
				}
				
				public uint ability_mod_get(Ability id) {
					return al.get_mod_by_id(id);
				}
				
		} 
	}	
}
