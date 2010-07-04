namespace RPG {
    namespace DD {
		
		
		public enum Alignment {
			LAWFUL_GOOD,
			NEUTRAL_GOOD,
			CHAOTIC_GOOD,
			LAWFUL_NEUTRAL,
			NEUTRAL,
			CHAOTIC_NEUTRAL,		
			LAWFUL_EVIL,
			NEUTRAL_EVIL,
			CHAOTIC_EVIL
		}
		
		
		/* law - chaos */
		
		public bool is_lawful(Alignment a) {
			return a==Alignment.LAWFUL_GOOD || a==Alignment.LAWFUL_NEUTRAL || a==Alignment.LAWFUL_EVIL;
		}
		
		public bool is_chaotic(Alignment a) {
			return a==Alignment.CHAOTIC_GOOD || a==Alignment.CHAOTIC_NEUTRAL || a==Alignment.CHAOTIC_EVIL;
		}
		
		public bool is_neutral_lawchaos(Alignment a) {
			return a==Alignment.NEUTRAL_GOOD || a==Alignment.NEUTRAL || a==Alignment.NEUTRAL_EVIL;
		}
		
		/* good -evil */
		
		public bool is_good(Alignment a) {
			return a==Alignment.LAWFUL_GOOD || a==Alignment.NEUTRAL_GOOD || a==Alignment.CHAOTIC_GOOD;
		}
		
		public bool is_evil(Alignment a) {
			return a==Alignment.LAWFUL_EVIL || a==Alignment.NEUTRAL_EVIL || a==Alignment.CHAOTIC_EVIL;
		}
		
		public bool is_neutral_goodevil(Alignment a) {
			return a==Alignment.LAWFUL_NEUTRAL || a==Alignment.NEUTRAL || a==Alignment.CHAOTIC_NEUTRAL;
		}
		
		
	}	
}


