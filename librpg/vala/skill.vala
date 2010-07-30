
namespace RPG {
		
		//[SimpleType] public struct Skill : uint { }
		
		
		private struct SkillInfo {
			string name;
			Ability first;
			Ability second;
			SkillGroup group;
		}
		
		private SkillInfo[] SKILLS_INFO;
		
		void skill_stuff_load() {
			
			
			/*This is necessary to get number of elements in e num till a patch gets in new vala */
			EnumClass cls = (EnumClass) typeof(Skill).class_ref();
			
			SKILLS_INFO = new SkillInfo[cls.n_values];
			
			Sqlite.Database db;
			string[] res;
			int rc, nrow, ncol;
			string err, sql;
			
			rc = Sqlite.Database.open(DB_SKILLS_PATH, out db); 
			if (rc != Sqlite.OK) {
				stderr.printf ("ERR: Can't open database: %d, %s\n", rc, db.errmsg ());
				return;
			}
			
			sql = "SELECT id,name,ability_first,ability_second,[group] FROM skills;";
			rc = db.get_table (sql, out res, out nrow, out ncol, out err); 
			if( rc != Sqlite.OK) {
				stderr.printf ("ERR: Can't retrieve skills from database: %d, %s\n", rc, err);
				return;
			}
			
			for(int i = ncol; i<nrow*ncol; i+=ncol) {
				int index = res[i].to_int();
				SKILLS_INFO[index].name = 	res[i+1];
				SKILLS_INFO[index].first = 	(Ability) res[i+2].to_int();
				SKILLS_INFO[index].second =	(Ability) res[i+3].to_int();
				SKILLS_INFO[index].group =	(SkillGroup) res[i+4].to_int();
			}
			
			stdout.printf("INFO: Skills loaded successfully\n");
			
		
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
		public string skill_get_name(Skill skill) {
			return SKILLS_INFO[skill].name;
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
