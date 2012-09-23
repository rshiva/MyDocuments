package com.gfx.fd
{
    import flash.display.*;
    import flash.events.*;
    import flash.filters.*;

    public class BlackButton extends Object
    {
        private var _glowFilter:GlowFilter;
        private var _overGlowAlpha:Object = 0;
        private var _dropShadowFilter:Object;
        private var _hitA:MovieClip;
        private var _defIcoAlpha:Number = 0.71;
        private var _ico:MovieClip;
        private var _glowColor:Number;
        private var _overIcoAlpha:Number = 1;
        private var _btn:MovieClip;

        public function BlackButton(param1:MovieClip, param2:MovieClip, param3:Number, param4:MovieClip)
        {
            _dropShadowFilter = new DropShadowFilter(0, 45, 0, 1, 5, 5, 2.5);
            _ico = param1;
            _hitA = param2;
            _btn = param4;
            _glowColor = param3;
            if (_glowColor != 0)
            {
                _glowFilter = new GlowFilter(_glowColor, 0.5, 7, 5, 2, 6);
            }
            else
            {
                _glowColor = 16737792;
                _glowFilter = new GlowFilter(16737792, 0.5, 7, 5, 2, 6);
            }// end else if
            init();
            return;
        }// end function

        private function chengeOutGlow(param1:Event) : void
        {
            var _loc_2:GlowFilter;
            if (_overGlowAlpha > 0)
            {
                _overGlowAlpha = _overGlowAlpha - 0.21;
                _loc_2 = new GlowFilter(_glowColor, _overGlowAlpha, 7, 5, 2, 6);
                _ico.filters = [_dropShadowFilter, _loc_2];
                if (_btn.scaleX > 1)
                {
                    _btn.scaleX = _btn.scaleX - 0.02;
                    _btn.scaleY = _btn.scaleY - 0.02;
                }// end if
            }
            else
            {
                _btn.scaleX = 1;
                _btn.scaleY = 1;
                _overGlowAlpha = 0;
                _ico.filters = [_dropShadowFilter];
                _ico.removeEventListener(Event.ENTER_FRAME, chengeOutGlow);
            }// end else if
            return;
        }// end function

        private function overHandler(param1:MouseEvent) : void
        {
            _ico.alpha = _overIcoAlpha;
            _btn.scaleX = 1;
            _btn.scaleY = 1;
            _ico.removeEventListener(Event.ENTER_FRAME, chengeOutGlow);
            _ico.addEventListener(Event.ENTER_FRAME, chengeOverGlow);
            return;
        }// end function

        private function outHandler(param1:MouseEvent) : void
        {
            _ico.alpha = _defIcoAlpha;
            _ico.removeEventListener(Event.ENTER_FRAME, chengeOverGlow);
            _ico.addEventListener(Event.ENTER_FRAME, chengeOutGlow);
            return;
        }// end function

        private function init() : void
        {
            _ico.filters = [_dropShadowFilter];
            _ico.alpha = _defIcoAlpha;
            _hitA.buttonMode = true;
            _hitA.mouseChildren = false;
            _hitA.addEventListener(MouseEvent.ROLL_OVER, overHandler);
            _hitA.addEventListener(MouseEvent.ROLL_OUT, outHandler);
            return;
        }// end function

        private function chengeOverGlow(param1:Event) : void
        {
            var _loc_2:GlowFilter;
            if (_overGlowAlpha < 0.65)
            {
                _btn.scaleX = _btn.scaleX + 0.037;
                _btn.scaleY = _btn.scaleY + 0.037;
                _overGlowAlpha = _overGlowAlpha + 0.21;
                _loc_2 = new GlowFilter(_glowColor, _overGlowAlpha, 7, 5, 2, 6);
                _ico.filters = [_dropShadowFilter, _loc_2];
            }
            else
            {
                _ico.removeEventListener(Event.ENTER_FRAME, chengeOutGlow);
            }// end else if
            return;
        }// end function

    }
}
