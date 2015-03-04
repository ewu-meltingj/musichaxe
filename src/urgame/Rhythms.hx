package urgame;


class Rhythms {
	public static function one_4 (from:Int) : Bool {
		if (from%4 == 0) 
			return true;
		return false;
	}

	public static function twoAndFour_4 (from:Int) : Bool {
		if (from%4 != 0 && from%4 != 2)
			return true;
		return false;
	}

	public static function seventeen_32 (from:Int) : Bool {
		if (from%16 == 0 && from != 0)
			return true;
		return false;
	}

	public static function one_16 (from:Int) : Bool {
		if (from == 0)
			return true;
		return false;
	}

	public static function three_4 (from:Int) : Bool {
		if (from%4 == 2)
			return true;
		return false;
	}
}