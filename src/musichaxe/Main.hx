package musichaxe;

import flambe.System;
import flambe.asset.AssetPack;
import flambe.asset.Manifest;
import flambe.scene.Director;

class Main {
	private static function main () {
		System.init();

		var director = new Director();
        System.root.add(director);

		var manifest = Manifest.fromAssets("main");

		System.loadAssetPack(manifest).get(function (mainPack) {
			var context = new Context(mainPack, director);
			context.enterPlayingScene(false);
		});
	}
}