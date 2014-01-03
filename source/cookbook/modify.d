/*******************************************************************************
 * Modify
 * Pure and functional library for modifying the contents of arrays.
 */

module cookbook.modify;
import cookbook.common;
import cookbook.access;

pure T[] rev(T)(T[] data){
  if(data.length == 0) return [];
  return append!T(rev(data[1..$]),data[0]);
}

T[] rm(T)(T[] data, T item){
  return filter!(((y) {return y != item;}),int)(data);
}

pure T[][] splitOn(T)(T[] data, T item){
  writefln("%s",data);
  if(!elem!T(data,item))
    return [data];
  else return (before!T(data,item) ~ splitOn!T(after!T(data,item),item));
}

pure T[] between(T)(T[] data, T item1, T item2){ //between "ab{cd}ef" { }
  return after!T(before!T(data,item2),item1);
}
