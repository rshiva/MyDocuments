/*
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
http://www.liquidjourney.com     ::     source@liquidjourney.com
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
a setup class that creates 3 movie clips ::: bk : mask : ele
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*/
dynamic class CreateBackground {
	//
	public var clipPath:MovieClip;
	public var lf:Number;
	public var rt:Number;
	public var tp:Number;
	public var bm:Number;
	public var color_array:Array;
	public var alpha_array:Array;
	public var ratio_array:Array;
	public var rot:Number;
	public var mType:String;
	public var mShape:String;
	//
	function CreateBackground(clipPath:MovieClip, lf:Number, rt:Number, tp:Number, bm:Number, color_array:Array, alpha_array:Array, ratio_array:Array, rot:Number, mType:String, mShape:String) {
		// create a background
		clipPath.createEmptyMovieClip("bk", clipPath.getNextHighestDepth());
		var bk:MovieClip = clipPath["bk"];
		var matrix_obj:Object = {matrixType:mType, x:lf, y:tp, w:rt-lf, h:bm-tp, r:rot};
		bk.beginGradientFill(mShape, color_array, alpha_array, ratio_array, matrix_obj);
		bk.moveTo(lf, tp);
		bk.lineTo(rt, tp);
		bk.lineTo(rt, bm);
		bk.lineTo(lf, bm);
		bk.lineTo(lf, tp);
		bk.endFill();
		clipPath.createEmptyMovieClip("ele", clipPath.getNextHighestDepth());
		var ele:MovieClip = clipPath["ele"];
		clipPath.createEmptyMovieClip("mask", clipPath.getNextHighestDepth());
		var mask:MovieClip = clipPath["mask"];
		mask.beginFill(0x000000, 100);
		mask.moveTo(lf, tp);
		mask.lineTo(rt, tp);
		mask.lineTo(rt, bm);
		mask.lineTo(lf, bm);
		mask.lineTo(lf, tp);
		mask.endFill();
		ele.setMask(mask);
	}
	//
	public function clearAll():Void {
		removeMovieClip("mask");
		removeMovieClip("bk");
		removeMovieClip("ele");
	}
}
