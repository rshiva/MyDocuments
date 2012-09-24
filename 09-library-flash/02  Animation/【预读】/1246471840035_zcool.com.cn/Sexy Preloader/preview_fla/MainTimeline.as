package preview_fla
{
    import flash.display.*;
    import flash.events.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var restart:SimpleButton;
        public var preloader:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(1, frame2);
            return;
        }// end function

        function frame2()
        {
            stop();
            restart.addEventListener(MouseEvent.CLICK, click);
            return;
        }// end function

        public function click(param1:MouseEvent) : void
        {
            gotoAndStop(1);
            return;
        }// end function

    }
}
