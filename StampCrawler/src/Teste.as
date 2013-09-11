package {
	import flash.display.MovieClip;
	import com.greensock.*;
	import com.greensock.loading.*;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.display.*;
	
	
	
	/**
	 * ...
	 * @author Nelson Alexandre
	 */
	public class Teste extends MovieClip {
		
		
		
		public function Teste(){
//create a LoaderMax named "mainQueue" and set up onProgress, onComplete and onError listeners
			var queue:LoaderMax = new LoaderMax({name: "mainQueue", onChildComplete: chilDisplay, onProgress: progressHandler, onComplete: completeHandler, onError: errorHandler, autoLoad:true});
//append several loaders
			queue.append(new ImageLoader("icons/sc128.png", {name: "1", estimatedBytes: 2400, container: this, alpha: 0, width: 250, height: 60, scaleMode: "proportionalInside"}));
			queue.append(new ImageLoader("icons/sc48.png", {name: "2", estimatedBytes: 2400, container: this, alpha: 0, width: 250, height: 60, scaleMode: "proportionalInside"}));
			queue.append(new ImageLoader("icons/sc32.png", {name: "3", estimatedBytes: 2400, container: this, alpha: 0, width: 250, height: 60, scaleMode: "proportionalInside"}));
			queue.append(new ImageLoader("icons/sc16.png", {name: "4", estimatedBytes: 2400, container: this, alpha: 0, width: 250, height: 60, scaleMode: "proportionalInside"}));
//prioritize the loader named "photo1"
			LoaderMax.prioritize("photo1"); //same as LoaderMax.getLoader("photo1").prioritize();
//start loading
			///queue.load();
		}
		
		
		
		function progressHandler(event:LoaderEvent):void {
			///trace("progress: " + event.target.progress);
		}
		
		function chilDisplay(e:LoaderEvent):void {
			trace(e.target.name);
			var image:ContentDisplay = LoaderMax.getContent(e.target.name);
			TweenLite.to(image, 1, {alpha: 1, y: 100, x:120*int(e.target.name)});
		}
		
		
		function completeHandler(event:LoaderEvent):void {
/*			var image:ContentDisplay = LoaderMax.getContent("photo1");
			TweenLite.to(image, 1, {alpha: 1, y: 100});
			trace(event.target + " is complete!");*/
		}
		
		
		
		function errorHandler(event:LoaderEvent):void {
			trace("error occured with " + event.target + ": " + event.text);
		}
	}
}