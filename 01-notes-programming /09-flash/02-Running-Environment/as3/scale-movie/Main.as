package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;

	/**
	 * ...
	 * @author ...
	 */
	
	public class Main extends Sprite 
	{
		public function Main():void {
			// the Flash movie scales to fit the player's size while maintaining the movie's original aspect ratio. 
			// The result is that the movie can potentially have borders on the sides if the Player's aspect ratio does not match the movie's aspect ratio. 
			// stage.scaleMode = StageScaleMode.SHOW_ALL;
			
			
			// The noBorder mode scales a movie to fit the Player while maintaining the original aspect ratio; 
			// however, it forces the Player to display no borders around the Stage. 
			// If the aspect ratio of the Player does not match that of the movie, some of the movie will be cut off on the sides.
			// stage.scaleMode = StageScaleMode.NO_BORDER;
			
			
			// The exactFit mode scales a movie to fit the Player, and it alters the movie's aspect ratio, 
			// if necessary, to match that of the Player. The result is that the movie always fills the Player exactly, but the elements of the movie may be distorted. 
			// stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			
			// The movie is not scaled, and it maintains its original size and aspect ratio regardless of the Stage's size. 
			stage.scaleMode = StageScaleMode.NO_SCALE
			
		}
        
	}
	
}