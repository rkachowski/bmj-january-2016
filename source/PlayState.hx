package;

import flixel.util.FlxPoint;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;


/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
    var bg:FlxBackdrop;
    var _player:Player;
    var _speed:Int = 500;
    var _directions:Array<String> = ["UP", "DOWN", "LEFT", "RIGHT"];

    public function new(MaxSize:Int)
    {
        super(MaxSize);
    }
/**
	 * Function that is called up when to state is created to set it up. 
	 */

    override public function create():Void
    {
        super.create();

        setupBackground();
        _player = new Player(50, FlxG.height * 2 - 200);
        add(_player);
        FlxG.camera.setBounds(0,0,FlxG.width,FlxG.height * 2);
        FlxG.camera.follow(_player);


    }

    private function setupBackground():Void
    {
        bg = new FlxBackdrop("assets/images/endless_bg.png", 0, 1);
        add(bg);
    }
/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */

    override public function destroy():Void
    {
        super.destroy();
    }

/**
	 * Function that is called once every frame.
	 */

    override public function update():Void
    {
        playerMovement();
        debug();
        super.update();
    }

    private function debug():Void
    {

        if(FlxG.mouse.justPressed)
        {
            trace(FlxG.mouse.getWorldPosition());
        }
    }
    private function playerMovement():Void
    {
        if (!FlxG.keys.anyPressed(_directions))
        {
            _player.setVelocity(new FlxPoint(0, 0));
            return;
        }


        for (dir in _directions)
        {
            if (FlxG.keys.pressed.UP)
            {
                _player.setVelocity(new FlxPoint(0, -_speed));

            }
            else if (FlxG.keys.pressed.DOWN)
            {
                _player.setVelocity(new FlxPoint(0, _speed));

            }
            else if (FlxG.keys.pressed.LEFT)
            {
                _player.setVelocity(new FlxPoint(-_speed,0));

            }
            else if (FlxG.keys.pressed.RIGHT)
            {
                _player.setVelocity(new FlxPoint(_speed,0));

            }

        }

    }
}