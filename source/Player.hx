package ;

import flixel.util.FlxPoint;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class Player extends FlxSprite
{
    public function new(X:Float = 0, Y:Float = 0)
    {
        super(X, Y);
        loadGraphic("assets/images/humpty_206x285.png", true, 206, 285);

        animation.add("walk",[2,3,4]);
        animation.add("stand_normal", [0]);
        animation.add("stand_talk",[1]);
        animation.add("jump",[5]);

        scale = new FlxPoint(0.5,0.5);
        width = scale.x * frameWidth;
        height = scale.y * frameHeight;
        centerOffsets(true);
    }

    public function setVelocity(p:FlxPoint):Void
    {
        velocity = p;
        setAnimation();
    }

    private function setAnimation():Void
    {
        if(velocity.x == 0 && velocity.y == 0)
        {
            animation.play("stand_normal");
        }
        if(velocity.x < 0)
        {
            animation.play("walk");
            flipX = true;
        }
        if(velocity.x > 0)
        {
            animation.play("walk");
            flipX = false;
        }
    }
}
