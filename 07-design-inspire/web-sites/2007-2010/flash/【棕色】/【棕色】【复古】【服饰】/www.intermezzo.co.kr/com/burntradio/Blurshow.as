class com.burntradio.Blurshow
{
    var obj, _pos;
    function Blurshow()
    {
    } // End of the function
    function blurto(mc, blur1, blur2, time)
    {
        var _loc5 = new flash.filters.BlurFilter(1, 1, 3);
        mc.filters = [_loc5];
        var _loc3 = new mx.transitions.Tween(mc, "blurX", mx.transitions.easing.Strong.easeOut, blur1, blur2, time, true);
        _loc3 = new mx.transitions.Tween(mc, "blurY", mx.transitions.easing.Strong.easeOut, blur1, blur2, time, true);
        _loc3.onMotionChanged = function ()
        {
            var _loc2 = obj.filters;
            _loc2[0].blurX = _pos;
            _loc2[0].blurY = _pos;
            obj.filters = _loc2;
        };
        _loc3.onMotionFinished = function ()
        {
        };
    } // End of the function
} // End of Class
