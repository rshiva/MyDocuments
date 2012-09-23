package preview_fla
{
    import com.gfx.fd.*;
    import flash.display.*;

    dynamic public class btnAlert_100 extends MovieClip
    {
        public var ico:MovieClip;
        public var hitA:MovieClip;

        public function btnAlert_100()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        function frame1()
        {
            new BlackButton(ico, hitA, 0, this);
            return;
        }// end function

    }
}
