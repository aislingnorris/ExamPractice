#define N 5
mtype {nothing,frog};
mtype circle[N];


init{
        int i=0;
         atomic{
         circle[2]=nothing;
         do
         :: i> N/2-1 ->break
         ::else->
             circle[i]=frog;
             circle[N-i-1]=frog;
             run frogleft(i);
             run frogright(N- i-1);
             i++
         od
         }
}


proctype frogleft(int position)
{
        int startingposition=position;
       do
       ::if
          ::(startingposition + 1 >=N  && circle[startingposition +1]==nothing )->
         atomic{
           circle[startingposition+1]=frog;
           circle[startingposition]=nothing;
         }

         ::startingposition + 2 >=N  && circle[startingposition +2]==nothing->
         atomic{
           circle[startingposition+2]=frog;
           circle[startingposition]=nothing;
         }

         fi
         ::else -> break
       od

}

proctype frogright(int position)
{
        int startingposition=position;
   do
   ::if
      ::(startingposition - 1 >=N  && circle[startingposition - 1]==nothing )->
     atomic{
       circle[startingposition - 1]=frog;
       circle[startingposition]=nothing;
     }

     ::startingposition - 2 >=N  && circle[startingposition - 2]==nothing->
     atomic{
       circle[startingposition - 2]=frog;
       circle[startingposition]=nothing;
     }

     fi
     ::else -> break
   od
}