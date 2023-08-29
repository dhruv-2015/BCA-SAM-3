#include<stdio.h>
void main(){
    int n,i=0,temp;
    printf("enter number of an array:");
    scanf("%d",&n);
    int a[n];
    int b=0;
    for(int i=0;i<n;i++){
        printf("enter number %d:",i+1);
        scanf("%d",&a[i]);
      }
      for(int i=0;i<n;i++){
      int dup=a[i];
      for(int j=0;j<n;j++){
        if(j!=i){
          if(dup==a[j]){
              b++;
             }
            }
        }
      }
      if(b>0){
              printf("true");
          }
          else{
              printf("false");}    
    }
      
    
