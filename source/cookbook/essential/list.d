module cookbook.essential.list;
import cookbook.essential.common;

struct list(T){
  T item;
  list!T *next;
  
  void toNext(){
    if(! (next == null))
      next = new list!T;

    item = next.item;
    next = next.next;
  }

  list!T copy(){
    list!T rList;
    rList.append(this.flatten());//Lazy hack
    return *rList.next;
  }

  void addNext(T it){
    next = new list!T;
    next.item = it;
    next.next = null;
  }
  
  bool isLast(){
    return next == null;
  }
  
  void append(T it){
    if(this.isLast())
      this.addNext(it);
    else
      next.append(it);
  }

  void prepend(T it){
    list!T x;
    x.item = it;
    x.append(item);
    x.next = this.next;
    this = x;
  }
  
  void prepend(T[] arr){
    foreach(it; arr){
      this.prepend(it);
    }
  }


  void append(T[] arr){
    foreach(it; arr){
      this.append(it);
    }
  }

  T[] flatten(){
    T[] rArr;
    if(!this.isLast()){
      rArr.length++;
      rArr[0] = item;
      return rArr ~ next.flatten();
    }
    else
      return [item];
  }

  T at(int x){
    return this.flatten()[x];
  }

  void map(alias fn)(){
    item = fn(item);
    if(next != null)
      next.map!fn;
  }

  void filter(alias fn)(){
    list!T rList;
    return rList.append(filter!(fn,T)(rList.flatten()));
  }
}
