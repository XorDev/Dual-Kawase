///@desc power_of_2()
///@arg val - Input value
function power_of_2() {

	/// Dual-Kawase blur implementation by @XorDev
	/*	
		Returns the value round up to the next power of 2 number (e.g. 20 => 32).
		Read about the technique here: https://graphics.stanford.edu/~seander/bithacks.html#RoundUpPowerOf2
	*/

	var val = argument[0]-1;

	//Fill bits to the right.
	val |= val >> 1;
	val |= val >> 2;
	val |= val >> 4;
	val |= val >> 8;
	val |= val >> 16;
	return val+1;


}
