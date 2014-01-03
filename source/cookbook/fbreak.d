/*******************************************************************************
 * Breaks
 * Breaks are pure higher-order functions that evaluate a list up to a certain
 * point. For convenience, any function dealing with conditional collection of
 * a list or array is put into Breaks.
 */

module cookbook.fbreak;
import cookbook.common;

pure T[] filterBreak(alias pred,T)(T[] data){
  T[] ret;
  for(int i = 0; i < data.length; i++){
    if(!pred(data[i]))
      return ret;
    else
      ret = append!T(ret,data[i]);
  }
  return ret;
}

pure T[] removeBreak(alias pred,T)(T[] data){
  for(int i = 0; i < data.length; i++){
    if(!pred(data[i]))
      return data[i..$].dup;
  }
  return data;
}

pure bool imbreak(alias pred,T)(T[] data){
  foreach(item; data)
    if(!pred(item)) return false;
  return true;
}
