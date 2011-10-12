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
		// Create the element that represents a print break.
		var nodeNo = parseInt(document.getElementById('total_nodes').value);
		document.getElementById('total_nodes').value = nodeNo + 1;
		var breakNode = CKEDITOR.dom.element.createFromHtml( '<div style="display: none;" id="node-break-'+nodeNo+'" name="node-break-'+nodeNo+'">&nbsp;</div>' );

		var ranges = editor.getSelection().getRanges( true );

		for ( var range, i = ranges.length - 1 ; i >= 0; i-- )
		{
			range = ranges[ i ];

			if ( i < ranges.length -1 )
				breakNode = breakNode.clone( true );

			range.insertNode( breakNode );
			if ( i == ranges.length - 1 )
			{
				range.moveToPosition( breakNode, CKEDITOR.POSITION_AFTER_END );
				range.select();
			}
		}
		
	},
	canUndo : false
};
