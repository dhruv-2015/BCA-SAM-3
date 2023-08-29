// Online C compiler to run C program online
#include<stdio.h>

void main(){
    int n,pos,val,temp;
    printf("enter n:");
    scanf("%d",&n);
    int a[n+1];
    for(int i=0;i<n;i++){
          printf("enter n:");
    scanf("%d",&a[i]);
    }
    printf("enter pos:");
    scanf("%d",&pos);
    printf("enter value:");
    scanf("%d",&val);
    for(int i=n-1;n>=pos;i--){
        a[i+1]=a[i];  
    }
    a[pos]=val;
     for(int i=0;i<=n;i++){
    printf("%d\t",a[i]);
    }
    
}