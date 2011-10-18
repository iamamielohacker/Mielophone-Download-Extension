package mielophone.plugins
{
	import flash.events.IEventDispatcher;

	public interface IMUIPlugin 
	{
		// plugin details
		function get PLUGIN_NAME():String;
		function get AUTHOR_NAME():String;
	}
}