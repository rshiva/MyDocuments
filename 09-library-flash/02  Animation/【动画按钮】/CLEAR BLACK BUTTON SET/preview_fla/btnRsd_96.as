package preview_fla
{
    import com.gfx.fd.*;
    import flash.display.*;

    dynamic public class btnRsd_96 extends MovieClip
    {
        public var ico:MovieClip;
        public var hitA:MovieClip;

        public function btnRsd_96()
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
