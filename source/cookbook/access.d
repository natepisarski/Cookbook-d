/*******************************************************************************
 * Access
 * Access is a library for finding information about arrays out.
 * This library uses and introduces only completely pure functions.
 */

module cookbook.access;

import cookbook.common;
import cookbook.break;

pure bool elem(T)(T[] data, T item){
  foreach(it; data)
    if(it == item)
      return true;
  return false;
}

pure bool contains(T)(T[] data, T[] item){
  for(int i = 0; i < data.length-1; i++){
    if(i+item.length > item.length) return false;
    if(data[i..i+item.length] == item)
      return true;
  }
  return false;
}

pure T[] qsort(T)(T[] data){
  if(data.length == 0) return [];
  T[] lesser  = qsort!T(filter!(((y) {return y <= data[0];}),T)(data[1..$].dup));
  T[] greater = qsort!T(filter!(((y) {return y > data[0];}),T)(data[1..$].dup));
  return append!T(lesser,data[0]) ~ greater;
}

pure bool areAll(T)(T[] data, T item){
  imbreak!(((y) {return y != item;}),T)(data);
}


pure bool surrounds(T)(T[] list, T head, T tail){
  return [list[0],list[$]] == [head,tail];
}

pure bool isPrefixOf(T)(T[] list, T[] test){
  if(test.length > list.length) return false;
  return list[0..test.length] == test;
}
