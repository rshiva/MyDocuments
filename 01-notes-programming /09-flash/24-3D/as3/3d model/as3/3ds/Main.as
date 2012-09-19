package {
	// flash class
	import flash.events.Event;
	
	// pv3d class
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.Max3DS;
	import org.papervision3d.lights.PointLight3D;
	import org.papervision3d.materials.shadematerials.GouraudMaterial;
	import org.papervision3d.view.BasicView;
	
	public class Main extends BasicView {
		
		private var _3ds:Max3DS;
		
		public function Main() {
			init3d();
		}
		
		private function init3d():void {
			
			// instantiate the 3ds obj and load the knot object
			_3ds = new Max3DS();
			_3ds.load("model/teaPot.3DS");
			
			// add the 3ds file to the scene
			scene.addChild(_3ds);
			
			// start rendering (activated onRenderTick)
			startRendering();
		}
		
		override protected function onRenderTick(event:Event = null):void {
			
			// rotate the object
			_3ds.yaw(1);
			super.onRenderTick();
		}
		
		
	}
}