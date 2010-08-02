namespace RPG {
		
		
		public enum Alignment {
			LAWFUL_GOOD,
			NEUTRAL_GOOD,
			CHAOTIC_GOOD,
			LAWFUL_NEUTRAL,
			NEUTRAL,
			CHAOTIC_NEUTRAL,		
			LAWFUL_EVIL,
			NEUTRAL_EVIL,
			CHAOTIC_EVIL;
		
		
		/* law - chaos */
		
		public bool is_lawful() {
			return this==LAWFUL_GOOD || this==LAWFUL_NEUTRAL || this==LAWFUL_EVIL;
		}
		
		public bool is_chaotic() {
			return this==CHAOTIC_GOOD || this==CHAOTIC_NEUTRAL || this==CHAOTIC_EVIL;
		}
		
		public bool is_neutral_lawchaos() {
			return this==NEUTRAL_GOOD || this==NEUTRAL || this==NEUTRAL_EVIL;
		}
		
		/* good -evil */
		
		public bool is_good() {
			return this==LAWFUL_GOOD || this==NEUTRAL_GOOD || this==CHAOTIC_GOOD;
		}
		
		public bool is_evil() {
			return this==LAWFUL_EVIL || this==NEUTRAL_EVIL || this==CHAOTIC_EVIL;
		}
		
		public bool is_neutral_goodevil() {
			return this==LAWFUL_NEUTRAL || this==NEUTRAL || this==CHAOTIC_NEUTRAL;
		}
			
		}
		
			
}


