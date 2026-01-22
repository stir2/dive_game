function scrCalculateDistanceSlowingDown(_currentSpeed, _decelerationSpeed){
    //Calculate the amount of frames will take to reach maxSpeed
    var _framesToMax = round(_currentSpeed/_decelerationSpeed) - 1;
    //We calculate the amount of distance we will travel if we slow down. This uses an intergral formula
    var _distanceSlowingDown = (_currentSpeed * _framesToMax) - ((_decelerationSpeed * (_framesToMax*_framesToMax))/2);

    return _distanceSlowingDown;

}