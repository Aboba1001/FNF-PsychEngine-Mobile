package mobile.flixel;

import mobile.flixel.FlxButton;
import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxDestroyUtil;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import openfl.utils.Assets;

/**
 * A gamepad.
 * It's easy to customize the layout.
 *
 * @original author Ka Wing Chin
 * @modification's author: Saw (M.A. Jigsaw) & Karim Akra (UTFan)
 */
class FlxVirtualPad extends FlxSpriteGroup
{
	public var buttonLeft:FlxButton = new FlxButton(0, 0);
	public var buttonUp:FlxButton = new FlxButton(0, 0);
	public var buttonRight:FlxButton = new FlxButton(0, 0);
	public var buttonDown:FlxButton = new FlxButton(0, 0);
	public var buttonLeft2:FlxButton = new FlxButton(0, 0);
	public var buttonUp2:FlxButton = new FlxButton(0, 0);
	public var buttonRight2:FlxButton = new FlxButton(0, 0);
	public var buttonDown2:FlxButton = new FlxButton(0, 0);
	public var buttonA:FlxButton = new FlxButton(0, 0);
	public var buttonB:FlxButton = new FlxButton(0, 0);
	public var buttonC:FlxButton = new FlxButton(0, 0);
	public var buttonD:FlxButton = new FlxButton(0, 0);
	public var buttonE:FlxButton = new FlxButton(0, 0);
	public var buttonV:FlxButton = new FlxButton(0, 0);
	public var buttonX:FlxButton = new FlxButton(0, 0);
	public var buttonY:FlxButton = new FlxButton(0, 0);
	public var buttonZ:FlxButton = new FlxButton(0, 0);

	/**
	 * Create a gamepad.
	 *
	 * @param   DPadMode     The D-Pad mode. `LEFT_FULL` for example.
	 * @param   ActionMode   The action buttons mode. `A_B_C` for example.
	 */
	public function new(DPad:FlxDPadMode, Action:FlxActionMode)
	{
		super();

		scrollFactor.set();

		switch (DPad)
		{
			case UP_DOWN:
				add(buttonUp = createButton(0, FlxG.height - 255, 132, 127, 'up', 0xFF00FF00));
				add(buttonDown = createButton(0, FlxG.height - 135, 132, 127, 'down', 0xFF00FFFF));
			case LEFT_RIGHT:
				add(buttonLeft = createButton(0, FlxG.height - 135, 132, 127, 'left', 0xFFFF00FF));
				add(buttonRight = createButton(127, FlxG.height - 135, 132, 127, 'right', 0xFFFF0000));
			case UP_LEFT_RIGHT:
				add(buttonUp = createButton(105, FlxG.height - 243, 132, 127, 'up', 0xFF00FF00));
				add(buttonLeft = createButton(0, FlxG.height - 135, 132, 127, 'left', 0xFFFF00FF));
				add(buttonRight = createButton(207, FlxG.height - 135, 132, 127, 'right', 0xFFFF0000));
			case LEFT_FULL:
				add(buttonUp = createButton(105, FlxG.height - 345, 132, 127, 'up', 0xFF00FF00));
				add(buttonLeft = createButton(0, FlxG.height - 243, 132, 127, 'left', 0xFFFF00FF));
				add(buttonRight = createButton(207, FlxG.height - 243, 132, 127, 'right', 0xFFFF0000));
				add(buttonDown = createButton(105, FlxG.height - 135, 132, 127, 'down', 0xFF00FFFF));
			case RIGHT_FULL:
				add(buttonUp = createButton(FlxG.width - 258, FlxG.height - 408, 132, 127, 'up', 0xFF00FF00));
				add(buttonLeft = createButton(FlxG.width - 384, FlxG.height - 309, 132, 127, 'left', 0xFFFF00FF));
				add(buttonRight = createButton(FlxG.width - 132, FlxG.height - 309, 132, 127, 'right', 0xFFFF0000));
				add(buttonDown = createButton(FlxG.width - 258, FlxG.height - 201, 132, 127, 'down', 0xFF00FFFF));
			case BOTH_FULL:
				add(buttonUp = createButton(105, FlxG.height - 345, 132, 127, 'up', 0xFF00FF00));
				add(buttonLeft = createButton(0, FlxG.height - 243, 132, 127, 'left', 0xFFFF00FF));
				add(buttonRight = createButton(207, FlxG.height - 243, 132, 127, 'right', 0xFFFF0000));
				add(buttonDown = createButton(105, FlxG.height - 135, 132, 127, 'down', 0xFF00FFFF));
				add(buttonUp2 = createButton(FlxG.width - 258, FlxG.height - 408, 132, 127, 'up', 0xFF00FF00));
				add(buttonLeft2 = createButton(FlxG.width - 384, FlxG.height - 309, 132, 127, 'left', 0xFFFF00FF));
				add(buttonRight2 = createButton(FlxG.width - 132, FlxG.height - 309, 132, 127, 'right', 0xFFFF0000));
				add(buttonDown2 = createButton(FlxG.width - 258, FlxG.height - 201, 132, 127, 'down', 0xFF00FFFF));
			case NONE: // do nothing
		}

		switch (Action)
		{
			case A:
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'a'));
			case B:
				add(buttonB = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'b'));
			case A_B:
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'a'));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, 'b'));
			case A_B_C:
				add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, 'c'));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, 'b'));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'a'));
			case A_B_E:
				add(buttonE = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, 'e'));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, 'b'));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'a'));
			case A_B_X_Y:
				add(buttonX = createButton(FlxG.width - 510, FlxG.height - 135, 132, 127, 'x'));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, 'b'));
				add(buttonY = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, 'y'));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'a'));
			case A_B_C_X_Y:
				add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, 'c'));
				add(buttonX = createButton(FlxG.width - 258, FlxG.height - 255, 132, 127, 'x'));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, 'b'));
				add(buttonY = createButton(FlxG.width - 132, FlxG.height - 255, 132, 127, 'y'));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'a'));
			case A_B_C_X_Y_Z:
				add(buttonX = createButton(FlxG.width - 384, FlxG.height - 255, 132, 127, 'x'));
				add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, 'c'));
				add(buttonY = createButton(FlxG.width - 258, FlxG.height - 255, 132, 127, 'y'));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, 'b'));
				add(buttonZ = createButton(FlxG.width - 132, FlxG.height - 255, 132, 127, 'z'));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'a'));
			case A_B_C_D_V_X_Y_Z:
				add(buttonV = createButton(FlxG.width - 510, FlxG.height - 255, 132, 127, 'v'));
				add(buttonD = createButton(FlxG.width - 510, FlxG.height - 135, 132, 127, 'd'));
				add(buttonX = createButton(FlxG.width - 384, FlxG.height - 255, 132, 127, 'x'));
				add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, 'c'));
				add(buttonY = createButton(FlxG.width - 258, FlxG.height - 255, 132, 127, 'y'));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, 'b'));
				add(buttonZ = createButton(FlxG.width - 132, FlxG.height - 255, 132, 127, 'z'));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'a'));
			case NONE: // do nothing
		}
	}

	/**
	 * Clean up memory.
	 */
	override public function destroy():Void
	{
		super.destroy();

		buttonLeft = null;
		buttonUp = null;
		buttonDown = null;
		buttonRight = null;
		buttonLeft2 = null;
		buttonUp2 = null;
		buttonDown2 = null;
		buttonRight2 = null;
		buttonA = null;
		buttonB = null;
		buttonC = null;
		buttonD = null;
		buttonE = null;
		buttonV = null;
		buttonX = null;
		buttonY = null;
		buttonZ = null;
	}

	private function createButton(X:Float, Y:Float, Width:Int, Height:Int, Graphic:String, ?Color:Int = 0xFFFFFF):FlxButton
	{
		var button:FlxButton = new FlxButton(X, Y);
		button.frames = FlxTileFrames.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/mobile/virtualpad.png'),
			Assets.getText('assets/mobile/virtualpad.xml'))
			.getByName(Graphic),
			FlxPoint.get(Width, Height));
		button.resetSizeFromFrame();
		button.solid = false;
		button.immovable = true;
		button.scrollFactor.set();
		button.color = Color;
		#if FLX_DEBUG
		button.ignoreDrawDebug = true;
		#end
		return button;
	}
		/*
		* Checks if the virtualpad button is pressed, if yes returns true.
		*/
	public static function isButtonPressed(buttonID:FlxVirtualPadButtonID):Bool
		{
			switch (buttonID)
			{
				case FlxVirtualPadButtonID.LEFT:
					return buttonLeft.isPressed;
				case FlxVirtualPadButtonID.UP:
					return buttonUp.isPressed;
				case FlxVirtualPadButtonID.RIGHT:
					return buttonRight.isPressed;
				case FlxVirtualPadButtonID.DOWN:
					return buttonDown.isPressed;
				case FlxVirtualPadButtonID.LEFT2:
					return buttonLeft2.isPressed;
				case FlxVirtualPadButtonID.UP2:
					return buttonUp2.isPressed;
				case FlxVirtualPadButtonID.RIGHT2:
					return buttonRight2.isPressed;
				case FlxVirtualPadButtonID.DOWN2:
					return buttonDown2.isPressed;
				case FlxVirtualPadButtonID.A:
					return buttonA.isPressed;
				case FlxVirtualPadButtonID.B:
					return buttonB.isPressed;
				case FlxVirtualPadButtonID.C:
					return buttonC.isPressed;
				case FlxVirtualPadButtonID.D:
					return buttonD.isPressed;
				case FlxVirtualPadButtonID.E:
					return buttonE.isPressed;
				case FlxVirtualPadButtonID.V:
					return buttonV.isPressed;
				case FlxVirtualPadButtonID.X:
					return buttonX.isPressed;
				case FlxVirtualPadButtonID.Y:
					return buttonY.isPressed;
				case FlxVirtualPadButtonID.Z:
					return buttonZ.isPressed;
				default:
					return false;
			}
		}

		/*
		* Checks if the virtualpad button justPressed, if yes returns true.
		*/
		public static function isButtonJustPressed(buttonID:FlxVirtualPadButtonID):Bool
			{
				switch (buttonID)
				{
				case FlxVirtualPadButtonID.LEFT:
					return buttonLeft.isJustPressed;
				case FlxVirtualPadButtonID.UP:
					return buttonUp.isJustPressed;
				case FlxVirtualPadButtonID.RIGHT:
					return buttonRight.isJustPressed;
				case FlxVirtualPadButtonID.DOWN:
					return buttonDown.isJustPressed;
				case FlxVirtualPadButtonID.LEFT2:
					return buttonLeft2.isJustPressed;
				case FlxVirtualPadButtonID.UP2:
					return buttonUp2.isJustPressed;
				case FlxVirtualPadButtonID.RIGHT2:
					return buttonRight2.isJustPressed;
				case FlxVirtualPadButtonID.DOWN2:
					return buttonDown2.isJustPressed;
				case FlxVirtualPadButtonID.A:
					return buttonA.isJustPressed;
				case FlxVirtualPadButtonID.B:
					return buttonB.isJustPressed;
				case FlxVirtualPadButtonID.C:
					return buttonC.isJustPressed;
				case FlxVirtualPadButtonID.D:
					return buttonD.isJustPressed;
				case FlxVirtualPadButtonID.E:
					return buttonE.isJustPressed;
				case FlxVirtualPadButtonID.V:
					return buttonV.isJustPressed;
				case FlxVirtualPadButtonID.X:
					return buttonX.isJustPressed;
				case FlxVirtualPadButtonID.Y:
					return buttonY.isJustPressed;
				case FlxVirtualPadButtonID.Z:
					return buttonZ.isJustPressed;
				case FlxVirtualPadButtonID.NONE:
					return false;
				default:
					return false;
				}
			}

		/*
		* Checks if the virtualpad button is justReleased, if yes returns true.
		*/
	public static function isButtonJustReleased(buttonID:FlxVirtualPadButtonID):Bool
		{
			switch (buttonID)
			{
				case FlxVirtualPadButtonID.LEFT:
					return buttonLeft.isJustReleased;
				case FlxVirtualPadButtonID.UP:
					return buttonUp.isJustReleased;
				case FlxVirtualPadButtonID.RIGHT:
					return buttonRight.isJustReleased;
				case FlxVirtualPadButtonID.DOWN:
					return buttonDown.isJustReleased;
				case FlxVirtualPadButtonID.LEFT2:
					return buttonLeft2.isJustReleased;
				case FlxVirtualPadButtonID.UP2:
					return buttonUp2.isJustReleased;
				case FlxVirtualPadButtonID.RIGHT2:
					return buttonRight2.isJustReleased;
				case FlxVirtualPadButtonID.DOWN2:
					return buttonDown2.isJustReleased;
				case FlxVirtualPadButtonID.A:
					return buttonA.isJustReleased;
				case FlxVirtualPadButtonID.B:
					return buttonB.isJustReleased;
				case FlxVirtualPadButtonID.C:
					return buttonC.isJustReleased;
				case FlxVirtualPadButtonID.D:
					return buttonD.isJustReleased;
				case FlxVirtualPadButtonID.E:
					return buttonE.isJustReleased;
				case FlxVirtualPadButtonID.V:
					return buttonV.isJustReleased;
				case FlxVirtualPadButtonID.X:
					return buttonX.isJustReleased;
				case FlxVirtualPadButtonID.Y:
					return buttonY.isJustReleased;
				case FlxVirtualPadButtonID.Z:
					return buttonZ.isJustReleased;
				case FlxVirtualPadButtonID.NONE:
					return false;
				default:
					return false;
					}
				}
				
		
}

enum FlxDPadMode
{
	UP_DOWN;
	LEFT_RIGHT;
	UP_LEFT_RIGHT;
	LEFT_FULL;
	RIGHT_FULL;
	BOTH_FULL;
	NONE;
}

enum FlxActionMode
{
	A;
	B;
	A_B;
	A_B_C;
	A_B_E;
	A_B_X_Y;
	A_B_C_X_Y;
	A_B_C_X_Y_Z;
	A_B_C_D_V_X_Y_Z;
	NONE;
}
