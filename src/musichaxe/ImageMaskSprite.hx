//
// Flambe - Rapid game development
// https://github.com/aduros/flambe/blob/master/LICENSE.txt

// This feels Hacky
// IMPORTANT delete this class

package musichaxe;
import flambe.display.Sprite;
import flambe.display.Texture;
import flambe.display.Graphics;


/**
 * A fixed-size sprite that displays a single texture.
 */
class ImageMaskSprite extends Sprite
{
    /**
     * The texture being displayed, or null if none.
     */
    public var texture :Texture;
    private var _textureMask :Texture;

    public function new (texture :Texture, textureMask:Texture)
    {
        super();
        this.texture = texture;
        _textureMask = textureMask;
    }

    override public function draw (g :Graphics)
    {
        if (texture != null) {
            g.drawTexture(texture, 0, 0);
        }
        if (_textureMask != null) {
            g.setBlendMode(Screen);
            g.drawTexture(_textureMask, -35, -55);
        }
    }

    override public function getNaturalWidth () :Float
    {
        return (texture != null) ? texture.width : 0;
    }

    override public function getNaturalHeight () :Float
    {
        return (texture != null) ? texture.height : 0;
    }
}