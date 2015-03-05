package musichaxe;

import flambe.asset.AssetPack;
import flambe.scene.Director;
import flambe.scene.SlideTransition;
import flambe.animation.Ease;


class Context {
	public var pack (default, null) :AssetPack;
	public var director (default, null) :Director;

	public var _level :M_Level;

	public function new(mainPack :AssetPack, director :Director) {
		this.pack = mainPack;
		this.director = director;
	}

	public function enterPlayingScene (animate :Bool = true) {
        director.unwindToScene(PlayingScene.create(this),
            animate ? new SlideTransition(0.5, Ease.quadOut) : null);
    }
}