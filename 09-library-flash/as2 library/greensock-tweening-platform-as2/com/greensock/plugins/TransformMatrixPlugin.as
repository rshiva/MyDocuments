/**
 * VERSION: 0.95
 * DATE: 8/22/2009
 * ACTIONSCRIPT VERSION: 2 
 * UPDATES AND DOCUMENTATION AT: http://www.TweenMax.com
 **/
import flash.display.*;
import flash.geom.*;
import com.greensock.*;
import com.greensock.plugins.*;
/**
 * TransformMatrixPlugin allows you to tween a MovieClip's transform.matrix values directly 
 * (<code>a, b, c, d, tx, and ty</code>) or use common properties like <code>_x, _y, _xscale, _yscale, skewX, skewY,</code> and <code>_rotation</code>.
 * <br /><br />
 * 
 * <b>USAGE:</b><br /><br />
 * <code>
 * 		import com.greensock.TweenLite; <br />
 * 		import com.greensock.plugins.TweenPlugin; <br />
 * 		import com.greensock.plugins.TransformMatrixPlugin; <br />
 * 		TweenPlugin.activate([TransformMatrixPlugin]); //activation is permanent in the SWF, so this line only needs to be run once.<br /><br />
 * 
 * 		TweenLite.to(mc, 1, {transformMatrix:{_x:50, _y:300, _xscale:200, _yscale:200}}); <br /><br />
 * 		
 * 		//-OR-<br /><br />
 * 
 * 		TweenLite.to(mc, 1, {transformMatrix:{tx:50, ty:300, a:2, d:2}}); <br /><br />
 * 
 * </code>
 * 
 * <b>Copyright 2009, GreenSock. All rights reserved.</b> This work is subject to the terms in <a href="http://www.greensock.com/terms_of_use.html">http://www.greensock.com/terms_of_use.html</a> or for corporate Club GreenSock members, the software agreement that was issued with the corporate membership.
 * 
 * @author Jack Doyle, jack@greensock.com
 */
class com.greensock.plugins.TransformMatrixPlugin extends TweenPlugin {
		/** @private **/
		public static var API:Number = 1.0; //If the API/Framework for plugins changes in the future, this number helps determine compatibility
		/** @private **/
		private static var _DEG2RAD:Number = Math.PI / 180;
		/** @private **/
		private static var _RAD2DEG:Number = 180 / Math.PI;
		
		/** @private **/
		private var _transform:Transform;
		/** @private **/
		private var _matrix:Matrix;
		/** @private **/
		private var _txStart:Number;
		/** @private **/
		private var _txChange:Number = 0;
		/** @private **/
		private var _tyStart:Number;
		/** @private **/
		private var _tyChange:Number = 0;
		/** @private **/
		private var _aStart:Number;
		/** @private **/
		private var _aChange:Number = 0;
		/** @private **/
		private var _bStart:Number;
		/** @private **/
		private var _bChange:Number = 0;
		/** @private **/
		private var _cStart:Number;
		/** @private **/
		private var _cChange:Number = 0;
		/** @private **/
		private var _dStart:Number;
		/** @private **/
		private var _dChange:Number = 0;
		
		/** @private **/
		public function TransformMatrixPlugin() {
			super();
			this.propName = "transformMatrix";
			this.overwriteProps = ["_x","_y","_xscale","_yscale","transformMatrix","transformAroundPoint","transformAroundCenter"];
		}
		
		/** @private **/
		public function onInitTween(target:Object, value:Object, tween:TweenLite):Boolean {
			_transform = target.transform;
			_matrix = _transform.matrix;
			var matrix:Matrix = _matrix.clone();
			_txStart = matrix.tx;
			_tyStart = matrix.ty;
			_aStart = matrix.a;
			_bStart = matrix.b;
			_cStart = matrix.c;
			_dStart = matrix.d;
			
			if (value._x != undefined) {
				_txChange = (typeof(value._x) == "number") ? value._x - _txStart : Number(value._x);
			} else if (value.tx != undefined) {
				_txChange = value.tx - _txStart;
			}
			if (value._y != undefined) {
				_tyChange = (typeof(value._y) == "number") ? value._y - _tyStart : Number(value._y);
			} else if (value.ty != undefined) {
				_tyChange = value.ty - _tyStart;
			}
			if (value.a != undefined) {
				_aChange = value.a - _aStart;
			}
			if (value.b != undefined) {
				_bChange = value.b - _bStart;
			}
			if (value.c != undefined) {
				_cChange = value.c - _cStart;
			}
			if (value.d != undefined) {
				_dChange = value.d - _dStart;
			}
			
			if ((value._rotation != undefined) || (value.scale != undefined) || (value._xscale != undefined) || (value._yscale != undefined) || (value.skewX != undefined) || (value.skewY != undefined) || (value.skewX2 != undefined) || (value.skewY2 != undefined)) {
				var ratioX:Number, ratioY:Number;
				var scaleX:Number = Math.sqrt(matrix.a * matrix.a + matrix.b * matrix.b); //Bugs in the Flex framework prevent DisplayObject.scaleX from working consistently, so we must determine it using the matrix.
				if (matrix.a < 0 && matrix.d > 0) {
					scaleX = -scaleX;
				}
				var scaleY:Number = Math.sqrt(matrix.c * matrix.c + matrix.d * matrix.d); //Bugs in the Flex framework prevent DisplayObject.scaleY from working consistently, so we must determine it using the matrix.
				if (matrix.d < 0 && matrix.a > 0) {
					scaleY = -scaleY;
				}
				var angle:Number = Math.atan2(matrix.b, matrix.a); //Bugs in the Flex framework prevent DisplayObject.rotation from working consistently, so we must determine it using the matrix
				if (matrix.a < 0 && matrix.d >= 0) {
					angle += (angle <= 0) ? Math.PI : -Math.PI;
				}
				var skewX:Number = Math.atan2(-_matrix.c, _matrix.d) - angle;
				
				var finalAngle:Number = (value._rotation != undefined) ? (typeof(value._rotation) == "number") ? value._rotation * _DEG2RAD : Number(value._rotation) * _DEG2RAD + angle : angle;
				var finalSkewX:Number = (value.skewX != undefined) ? (typeof(value.skewX) == "number") ? Number(value.skewX) * _DEG2RAD : Number(value.skewX) * _DEG2RAD + skewX : 0;
				
				if (value.skewY != undefined) { //skewY is just a combonation of rotation and skewX
					var skewY:Number = (typeof(value.skewY) == "number") ? value.skewY * _DEG2RAD : Number(value.skewY) * _DEG2RAD - skewX;
					finalAngle += skewY + skewX;
					finalSkewX -= skewY;
				}
				
				if (finalAngle != angle) {
					matrix.tx = 0;
					matrix.ty = 0;
					matrix.rotate(finalAngle - angle);
				}
				if (value.scale != undefined) {
					ratioX = Number(value.scale) * 0.01 / scaleX;
					ratioY = Number(value.scale) * 0.01 / scaleY;
					if (typeof(value.scale) != "number") { //relative value
						ratioX += 1;
						ratioY += 1;
					}
				} else {
					if (value._xscale != undefined) {
						ratioX = Number(value._xscale) * 0.01 / scaleX;
						if (typeof(value._xscale) != "number") { //relative value
							ratioX += 1;
						}
					}
					if (value._yscale != undefined) {
						ratioY = Number(value._yscale) * 0.01 / scaleY;
						if (typeof(value._yscale) != "number") { //relative value
							ratioY += 1;
						}
					}
				}
				
				if (finalSkewX != skewX) {
					matrix.c = -scaleY * Math.sin(finalSkewX + finalAngle);
					matrix.d = scaleY * Math.cos(finalSkewX + finalAngle);
				}
				
				if (value.skewX2 != undefined) {
					if (typeof(value.skewX2) == "number") {
						matrix.c = Math.tan(0 - (value.skewX2 * _DEG2RAD));
					} else {
						matrix.c += Math.tan(0 - (Number(value.skewX2) * _DEG2RAD));
					}
				}
				if (value.skewY2 != undefined) {
					if (typeof(value.skewY2) == "number") {
						matrix.b = Math.tan(value.skewY2 * _DEG2RAD);
					} else {
						matrix.b += Math.tan(Number(value.skewY2) * _DEG2RAD);
					}
				}
				
				if (ratioX) {
					matrix.a *= ratioX;
					matrix.b *= ratioX;
				}
				if (ratioY) {
					matrix.c *= ratioY;
					matrix.d *= ratioY;
				}
				_aChange = matrix.a - _aStart;
				_bChange = matrix.b - _bStart;
				_cChange = matrix.c - _cStart;
				_dChange = matrix.d - _dStart;
			}
			
			return true;
		}
		
		/** @private **/
		public function set changeFactor(n:Number):Void {
			if (_aChange) {
				_matrix.a = _aStart + (n * _aChange);
			}
			if (_bChange) {
				_matrix.b = _bStart + (n * _bChange);
			}
			if (_cChange) {
				_matrix.c = _cStart + (n * _cChange);
			}
			if (_dChange) {
				_matrix.d = _dStart + (n * _dChange);
			}
			if (_txChange) {
				_matrix.tx = _txStart + (n * _txChange);
			}
			if (_tyChange) {
				_matrix.ty = _tyStart + (n * _tyChange);
			}
			_transform.matrix = _matrix;
		}

}