class com.burntradio.Btnreact
{
    var prevFrame, _currentframe, onEnterFrame, nextFrame, _totalframes;
    function Btnreact()
    {
    } // End of the function
    function backTo(mc)
    {
        mc.onEnterFrame = function ()
        {
            this.prevFrame();
            if (_currentframe == 1)
            {
                delete this.onEnterFrame;
            } // end if
        };
    } // End of the function
    function runTo(mc)
    {
        mc.onEnterFrame = function ()
        {
            this.nextFrame();
            if (_currentframe == _totalframes)
            {
                delete this.onEnterFrame;
            } // end if
        };
    } // End of the function
    function stayTo(mc)
    {
        delete mc.onEnterFrame;
        mc.gotoAndStop(1);
    } // End of the function
} // End of Class
