package preview_fla
{
    import com.gfx.fd.*;
    import flash.display.*;

    dynamic public class btnFolder_102 extends MovieClip
    {
        public var ico:MovieClip;
        public var hitA:MovieClip;

        public function btnFolder_102()
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
