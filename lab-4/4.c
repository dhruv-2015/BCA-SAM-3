#include<stdio.h>
void main(){
    int n,i=0,temp;
    printf("enter number of an array:");
    scanf("%d",&n);
    int a[n];
    
    for(int i=0;i<n;i++){
        printf("enter number %d:",i+1);
        scanf("%d",&a[i]);
       
      }
      int small=a[0];
      for(i=0;i<n;i++){
         if(small>a[i]){
             small=a[i];
             temp=i;
         }
          }
         
      printf("smallest : %d",temp);
    }
