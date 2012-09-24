package preview_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.utils.*;

    dynamic public class DRAGNDROPPRELOADER_1 extends MovieClip
    {
        public var _loaderInfo:LoaderInfo;
        public var bar:MovieClip;
        public var fakePercent:Number;
        public var onComplete:Function;
        public var removeOnceDone:Boolean;
        public var fakeIntvl:uint;
        public var _txt:TextField;
        public const loaderText:String = "{percent}%";

        public function DRAGNDROPPRELOADER_1()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function removeThisLoader() : void
        {
            addEventListener(Event.ENTER_FRAME, fadeOut);
            return;
        }// end function

        public function fadeOut(param1:Event) : void
        {
            var event:* = param1;
            alpha = alpha - alpha / 3;
            if (alpha < 0.01)
            {
                removeEventListener(Event.ENTER_FRAME, fadeOut);
                try
                {
                    if (parent && parent.contains(this))
                    {
                        parent.removeChild(this);
                    }// end if
                }// end try
                catch (e:Error)
                {
                    visible = false;
                }// end if
            }// end catch
            return;
        }// end function

        public function set loaderInfoMirror(param1:LoaderInfo) : void
        {
            reset();
            visible = true;
            fakePercent = 0;
            fakeIntvl = setInterval(loaderProgress, 33, null);
            return;
        }// end function

        function frame1()
        {
            onComplete = 
function ()
{
    (parent as MovieClip).play();
    return;
}// end function
;
            removeOnceDone = true;
            mouseEnabled = false;
            mouseChildren = false;
            (parent as MovieClip).stop();
            loaderInfoMirror = (parent as MovieClip).loaderInfo;
            return;
        }// end function

        public function reset() : void
        {
            bar.gotoAndStop(0);
            _txt.text = loaderText.split("{percent}").join("0");
            destroyLoaderInfoMirror();
            return;
        }// end function

        public function loaderComplete(param1:Event) : void
        {
            _txt.text = loaderText.split("{percent}").join("100");
            destroyLoaderInfoMirror();
            if (removeOnceDone && parent)
            {
                removeThisLoader();
            }// end if
            onComplete();
            return;
        }// end function

        public function destroyLoaderInfoMirror() : void
        {
            if (_loaderInfo == null)
            {
                return;
            }// end if
            _loaderInfo.removeEventListener(Event.COMPLETE, loaderComplete);
            _loaderInfo.removeEventListener(ProgressEvent.PROGRESS, loaderProgress);
            return;
        }// end function

        public function loaderProgress(param1:ProgressEvent) : void
        {
            var _loc_2:int;
            fakePercent = fakePercent + 0.5;
            _loc_2 = fakePercent;
            if (_loc_2 < 1)
            {
                _loc_2 = 1;
            }// end if
            if (_loc_2 > 100)
            {
                _loc_2 = 100;
            }// end if
            bar.gotoAndStop(_loc_2);
            _txt.text = loaderText.split("{percent}").join(_loc_2.toString());
            if (fakePercent > 100)
            {
                clearInterval(fakeIntvl);
                loaderComplete(null);
            }// end if
            return;
        }// end function

    }
}
