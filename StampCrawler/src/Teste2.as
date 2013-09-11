package {

	import flash.display.MovieClip;
	import flash.utils.ByteArray;
	
	
	
	/**
	 * ...
	 * @author Nelson Alexandre
	 */
	public class Teste2 extends MovieClip {

		
		
		
		public function Teste2(){
			var t1:Array = new Array("0", {nome: "alex", id: 2}, "2");
			trace(t1[1]);
			var t2:Array = clone(t1);
			trace(t2[1].nome);
			t1[1].nome = "nelson";
			trace(t2[1].nome);
		}
		
		
		
		function clone(source:Object):* {
			var myBA:ByteArray = new ByteArray();
			myBA.writeObject(source);
			myBA.position = 0;
			return (myBA.readObject());
		}
	}
}