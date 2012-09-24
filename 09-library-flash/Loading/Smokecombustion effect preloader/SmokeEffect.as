class SmokeEffect extends MovieClip
{
    var points, prev, _x, _y, clear, lineStyle, curveTo;
    function SmokeEffect()
    {
        super();
        points = new Array({x: 0, y: 0});
        prev = new flash.geom.Point();
    } // End of the function
    function onEnterFrame()
    {
        points[0].x = 0;
        points[0].y = 0;
        var _loc6 = 0;
        var _loc5 = 0;
        points.splice(1, 0, {x: _x, y: _y, bx: (_loc6 + Math.random() * [-spread, spread][Math.round(Math.random())]) / 5, by: (_loc5 + Math.random() * [-spread, spread][Math.round(Math.random())]) / 5, life: getTimer()});
        this.clear();
        for (var _loc2 = 1; _loc2 < points.length; ++_loc2)
        {
            if (getTimer() - points[_loc2].life > lifetime)
            {
                continue;
            } // end if
            this.lineStyle(1, colour, Math.abs(1 - (getTimer() - points[_loc2].life) / lifetime) * 100);
            points[_loc2].x = points[_loc2].x + points[_loc2].bx;
            points[_loc2].y = points[_loc2].y + points[_loc2].by;
            var _loc4 = points[_loc2 - 1].x;
            var _loc3 = points[_loc2 - 1].y;
            this.curveTo(_loc4, _loc3, (points[_loc2].x + _loc4) / 2, (points[_loc2].y + _loc3) / 2);
        } // end of for
    } // End of the function
    var colour = 16777215;
    var spread = 2;
    var lifetime = 1000;
} // End of Class
