public function processChildren (container:DisplayObjectContainer):void {
	for (var i:int = 0; i < container.numChildren; i++) {
		// Process the child here. For example, the following line
		// prints this child's string value as debugging output.
		var thisChild:DisplayObject = container.getChildAt(i);
		trace(thisChild.toString( ));
		
		// If this child is, itself, a container, then process its children.
		if (thisChild is DisplayObjectContainer) {
			processChildren(DisplayObjectContainer(thisChild));
		}
	}
}