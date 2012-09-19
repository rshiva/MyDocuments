package  
{
	
    import fl.containers.ScrollPane;
    import fl.events.ScrollEvent;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.MovieClip;
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.events.*;    
    import flash.geom.Rectangle;

    public class Main extends Sprite
    {
        private var sampleImagePath:String = "sea.jpg";
        private var sp:ScrollPane;
        private var previewPositioner:Sprite;
        private var previewWindowSize:Number = 100;
        private var box:Sprite;
        
        public function Main() {
            stage.frameRate = 31; // for smoother scrolling
            createScrollPane();
        }
        private function createScrollPane():void {
            sp = new ScrollPane();
            sp.move(10,10);
            sp.setSize(425,380);
            sp.source = sampleImagePath;
            sp.addEventListener(Event.COMPLETE,createPreviewWindow);
            sp.addEventListener(ScrollEvent.SCROLL,repositionPreview);
            sp.scrollDrag = true;
            addChild(sp);            
        }
        private function createPreviewWindow(e:Event):void {
            var previewWindow:Sprite = new Sprite();
            previewWindow.x = 445;
            previewWindow.y = 10;
            previewWindow.graphics.lineStyle(1,0,1);
            previewWindow.graphics.drawRect(0,0,previewWindowSize,previewWindowSize);
            addChild(previewWindow);

            if(sp.content.width > previewWindowSize && sp.content.height > previewWindowSize) {
                var bitmapData:BitmapData
                try {
                    bitmapData = new BitmapData(sp.content.width,sp.content.height);
                    bitmapData.draw(sp.content);
                    var bitmap:Bitmap = new Bitmap(bitmapData);
                    bitmap.width = previewWindowSize;
                    bitmap.height = previewWindowSize;
                    bitmap.alpha = 0.25
                    previewWindow.addChild(bitmap);            
                }
                catch (e:Error) {
                    trace(e.toString());
                }
                
                previewPositioner = new Sprite();
                previewPositioner.graphics.beginFill(0xFFFFFF,0.5);
                previewPositioner.graphics.lineStyle(1,0,0.5);
                previewPositioner.graphics.drawRect(0,0,getHorizontalAspect() * previewWindowSize, getVerticalAspect() * previewWindowSize);
                previewPositioner.addEventListener(MouseEvent.MOUSE_DOWN, dragPreviewPositioner);
                previewPositioner.addEventListener(MouseEvent.MOUSE_UP, dropPreviewPositioner);
                previewWindow.addChild(previewPositioner);
            }
        }
        private function dragPreviewPositioner(e:MouseEvent):void {
            var bounds:Rectangle = new Rectangle(0,0,previewWindowSize - Math.floor(previewPositioner.width) + 1,previewWindowSize - Math.floor(previewPositioner.height) + 1);
            previewPositioner.startDrag(false,bounds);
            previewPositioner.addEventListener(MouseEvent.MOUSE_MOVE, repositionScrollPane);
        }
        private function dropPreviewPositioner(e:MouseEvent):void {
            previewPositioner.stopDrag();
            previewPositioner.removeEventListener(MouseEvent.MOUSE_MOVE, repositionScrollPane);
        }
        private function repositionScrollPane(e:MouseEvent):void {
            sp.horizontalScrollPosition = (previewPositioner.x / previewWindowSize) * sp.content.width;
            sp.verticalScrollPosition = (previewPositioner.y / previewWindowSize) * sp.content.height;
        }
        private function repositionPreview(e:ScrollEvent):void {
            previewPositioner.x = (sp.horizontalScrollPosition * previewWindowSize) / sp.content.width;
            previewPositioner.y = (sp.verticalScrollPosition * previewWindowSize) / sp.content.height;
        }
        private function getHorizontalAspect():Number {
            return sp.width / sp.content.width;
        }
        private function getVerticalAspect():Number {
            return sp.height / sp.content.height;
        }
    }


}