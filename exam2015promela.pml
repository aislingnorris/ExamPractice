
bool wantp = 0;
bool wantq = 0;

#define p   0
#define v   1

chan sema = [0] of { bit };

proctype thread_p(){
  do
  ::  wantq == 0;
  :: wantp = 1;
  :: sema!p -> wantp = 0;
  :: sema?v;
  od
}

proctype thread_q(){
  do
  ::  wantp == 0;
  ::  wantq = 1;
  :: sema!p -> wantq = 0;
  :: sema?v;
  od
}

init{
  atomic{
    run thread_p();
    run thread_q();
  }

  _nr_pr == 1;
}