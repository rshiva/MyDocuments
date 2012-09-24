package preview_fla
{
    import com.gfx.fd.*;
    import flash.display.*;

    dynamic public class btnArrowLeft2_45 extends MovieClip
    {
        public var ico:MovieClip;
        public var hitA:MovieClip;

        public function btnArrowLeft2_45()
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
