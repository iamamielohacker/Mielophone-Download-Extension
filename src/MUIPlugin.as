package
{
	import com.codezen.mse.playr.PlayrTrack;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	
	import mielophone.plugins.IMUIPlugin;
	
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.core.FlexGlobals;
	import mx.utils.ObjectUtil;

	public class MUIPlugin implements IMUIPlugin
	{
		[Embed(source="/download.png")]
		private var icon:Class;
		
		public function MUIPlugin()
		{
			var b:Button = new Button();
			b.x = b.y = 10;
			b.label = 'Download';
			b.setStyle("chromeColor", "#36679f");
			b.setStyle("color","#FFFFFF");
			b.setStyle("icon", icon);
			b.setStyle("iconPlacement", "right");
			b.addEventListener(MouseEvent.CLICK, onDownloadClick);
			
			FlexGlobals.topLevelApplication.musicPlayer.playerButtons.addElement(b);
		}
		
		private function onDownloadClick(e:Event):void{
			var track:PlayrTrack = FlexGlobals.topLevelApplication.musicPlayer.getCurrentTrack() as PlayrTrack;
			var urlRequest:URLRequest;
			if(track.downloadRequest != null){
				urlRequest = track.downloadRequest;
			}else if(track.file != null){
				urlRequest = new URLRequest(track.file);
			}
			
			var fr:FileReference = new FileReference();
			fr.addEventListener(Event.COMPLETE, onLoad);
			fr.download(urlRequest);
			
			Alert.show("You'll see alert when it's done", "Starting download.");
		}
		
		private function onLoad(e:Event):void{
			Alert.show("Download complete!", "Done!");
		}
		
		// plugin details
		public function get PLUGIN_NAME():String{
			return "test plugin";
		}
		
		public function get AUTHOR_NAME():String{
			return "test author";
		}
	}
}