
int wantp = 0;
int wantq = 0;

proctype thread_p(){
  do
  ::  wantq == 0;
  :: _nr_pr == 2 -> wantp = 1;
  od

  wantp = 0;
}

proctype thread_q(){
  do
  ::  wantp ==0;
  ::  _nr_pr == 2 -> wantq = 1;
  od

  wantq = 0;
}

init{
  atomic{
    run thread_p(wantp, wantq);
    run thread_q(wantp, wantq);
  }

  _nr_pr == 1;
}