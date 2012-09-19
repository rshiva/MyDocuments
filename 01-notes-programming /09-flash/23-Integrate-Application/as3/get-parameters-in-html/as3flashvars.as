package {
	import flash.display.*;
	import flash.text.*;
	
	public class as3flashvars extends MovieClip
	{
		private var str:String = "";
		public function as3flashvars() {
			init();
		}
		
		private function init():void {
			txt.text = dumpObj(this.loaderInfo.parameters); // 繞行出 parameters 物件全部的值
			txt1.text = root.loaderInfo.parameters["param1"]; // 用物件方法a，輸出 test1
			txt2.text = this.stage.loaderInfo.parameters.param2; // 物件方法b，輸出 test2
			txt2.text = txt2.text + "\n" + root.loaderInfo.parameters["param3"]; // 輸出 test2
		}
		
		private function dumpObj(o:Object):String { //繞行方法
			for (var i:String in o) {
					str += i + ":" + o[i]+"\n";
			}
			return str;
		}
	}
}