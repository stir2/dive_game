// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrCheckAnimationFrame(_frameNum)
{
	_frameNum--;
	
	var _previousImageIndex = image_index - image_speed;
	
	if (_previousImageIndex < _frameNum && image_index >= _frameNum) return true;
	return false;
}