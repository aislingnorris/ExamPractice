proctype thread_p(int n){
  int i;
  int temp;
  for(i : 1..10){
    temp = n;
    n = temp + 1;
  }
}

proctype thread_q(int n){
  int i;
  int temp;
  for(i : 1..10){
    n = n+ 1;
  }
}

init{
  int n = 0;
  atomic{
    run thread_q(n);
    run thread_p(n);
  }

  _nr_pr == 1;
}