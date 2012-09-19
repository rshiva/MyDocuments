package {
	import flash.events.Event;
	
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.MovieAssetMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.PaperPlane;
	import org.papervision3d.view.BasicView;
	
	public class Main extends BasicView {
		
		// move the definitions out here so the whole class can get them
		private var myFirstPlane:PaperPlane;
		
		private var pivotContainer:DisplayObject3D;
		
		public function Main() {
			
			// create a color material for the plane
			var planeMaterial:ColorMaterial = new ColorMaterial(0x55FF11);
			planeMaterial.doubleSided = true;
			
			// create a sphere and a paper airplane, increase the triangles on the sphere
			myFirstPlane = new PaperPlane(planeMaterial, 3);
			
			
			// add a container to use for pivoting the plane rotation
			pivotContainer = new DisplayObject3D();
			
			// add the plane to the container
			pivotContainer.addChild(myFirstPlane);
			
			// add the container to the scene
			scene.addChild(pivotContainer);
			
			// this is an inherited method (onRenderTick) that starts an enterframe event to render the scene 
			startRendering();

		}
		
		override protected function onRenderTick(event:Event = null):void {
			
			// rotate the pivot container (will offset the plane rotation)
			pivotContainer.rotationY += 1;
			
			// get the rotation values for the camera based on where the mouse is in the scene
			var rotY: Number = (mouseY - (stage.stageHeight / 2)) / (stage.height / 2) * 800;
			var rotX: Number = (mouseX - (stage.stageWidth / 2)) / (stage.width / 2) * -800;

			// set the camera's position
			camera.x -= (rotX + camera.x) / 10;
			camera.y -= (rotY + camera.y) / 10;


			// make sure that it is calling the renderer
			super.onRenderTick();
		}
	}
	
	
}