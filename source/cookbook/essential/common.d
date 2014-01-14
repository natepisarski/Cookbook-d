/*******************************************************************************
 * Common.d - Functions and structures universal to all of Cookbook.
 *            Short and common functions beneficial to all and widely applicable.
 */

module cookbook.essential.common;

pure T[] append(T)(T[] l, T t){
  T[] r;
  r.length = l.length+1;
  for(int i = 0; i < l.length; i++){
    r[i] = l[i];
  }
  r[l.length] = t;
  return r;
}

pure T[] map(alias f, T)(T[] l){
  T[] r;
  foreach(i; l) r = append!T(r,f(i));
  return r;
}

pure T[] filter(alias pred, T)(T[] list){
  T[] rlist;
  foreach(item; list)
    if(pred(item)) rlist = append!T(rlist,item);
  return rlist;
}

pure T[][] zip(T)(T[] list1, T[] list2){
  if(list1.length == 1 || list2.length == 1)
    return [[list1[0],list2[0]]];
  else return [[list1[0],list2[0]]]~zip(list1[1..$],list2[1..$]);
}

pure int[] range(int start, int end){
  int[] ret;
  for(int i = start; i < end; i++){
    ret = append!int(ret,i);
  }
  return ret;
}

pure int[] positions(T)(T[] list, T item){
  int[] ret;
  for(int i = 0; i < list.length; i++){
    if(list[i] == item)
      ret = append!int(ret,i);
  }
  return ret;
}

pure int pos(T)(T[] list, T item){
  return positions!T(list,item).dup[0];
}

pure int count(T)(T[] list, T item){
  int count = 0;
  foreach(ind; list){
    if(ind == item) count++;
  }
  return count;
}

pure T[] after(T)(T[] data, T item){
  return data[pos!T(data,item)+1..$];
}

pure T[] before(T)(T[] data, T item){
  return data[0..pos!T(data,item)];
}
