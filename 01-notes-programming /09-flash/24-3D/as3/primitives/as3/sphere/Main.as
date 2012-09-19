package {
	import org.papervision3d.objects.primitives.Sphere;
	import org.papervision3d.view.BasicView;
	
	public class Main extends BasicView {
		
		// create a sphere and a paper airplane
		var mySphere:Sphere;
		
		public function Main() {
			
			mySphere = new Sphere();
			
			// add the cube to the scene
			scene.addChild(mySphere);
			
			// this is an inherited method (onRenderTick) that starts an enterframe event to render the scene 
			startRendering();
		}
	}
}

