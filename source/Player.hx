package ;

import flixel.util.FlxPoint;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class Player extends FlxSprite
{
    public function new(X:Float = 0, Y:Float = 0)
    {
        super(X, Y);

        makeGraphic(32, 32, FlxColor.BLACK);
    }

    public function setVelocity(p:FlxPoint):Void
    {
        velocity = p;
    }
}
