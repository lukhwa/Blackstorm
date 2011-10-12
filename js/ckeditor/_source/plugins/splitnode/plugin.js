/**
 * @file Split Node Plugin
 */

CKEDITOR.plugins.add( 'splitnode',
{
	init : function( editor )
	{
		var pluginName = 'splitnode';

		// Register the command.
		var command = editor.addCommand( pluginName, CKEDITOR.plugins.splitnode );

		// Register the toolbar button.
		editor.ui.addButton( 'SplitNode',
			{
				label : 'Split Node',
				command : pluginName
			});
	}
} );

CKEDITOR.plugins.splitnode =
{
	exec : function( editor )
	{
		alert('works');
	},
	canUndo : false
};
