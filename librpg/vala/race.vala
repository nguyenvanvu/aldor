namespace LibRPG {
    namespace DD {
		
		[SimpleType] public struct Race : uint { }
		
		
		enum RACE {
			DWARF,
			ELF,
			HUMAN,
			ORC,
			BADGER,
			LION,
		}
		
		uint RACE_MAX_NUM = 6;

	}	
}
