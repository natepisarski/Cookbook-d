/*
 * This file is part of Galileo, a subset of Cookbook.
 * * Provides generic lists support through structures.
 * * Provides useful functions for building list abstractions.
 */

import std.stdio;
struct LinkedList(T){
  T item;
  LinkedList!T* next;
};

LinkedList!T absorb(T)(T[] list){
  LinkedList!T returnList;
  LinkedList!T *ptList = &returnList;
  foreach(item; list){
    ptList.item = item;
    ptList.next = new LinkedList!T;
    ptList = ptList.next;
  }
  ptList.next = null;
  return returnList;
}

pure T[] append(T)(T[] l, T t){
  T[] r;
  r.length = l.length+1;
  for(int i = 0; i < l.length; i++){
    r[i] = l[i];
  }
  r[l.length] = t;
  return r;
}

T[] secrete(T)(LinkedList!T list){
  T[] rArr;
  return append!T(rArr,list.item) ~ secrete!T(*list.next);
}

bool isEnd(T)(LinkedList!T x){
  return x.next == null;
}

LinkedList!T last(T)(LinkedList!T x){
  if(x.next == null)
    return x;
  else
    return last!T(*x.next);
}


int main(){
  int[] i = [1,2,3,4,5];
  LinkedList!int x = absorb!int(i);
  int[] c = secrete!int(x);
  foreach(item; c){
    writeln("",item);
  }
  return 0;
}
