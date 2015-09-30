proctype thread(int n){
 int temp;
 int i;

 for(i : 1..10){
  temp = n;
  n = temp + 1;
 } 

}

init{
  int n = 0;

  atomic{
    run thread(n);
    run thread(n);
  }

  _nr_pr == 1;
  
  assert(n != 0);

}