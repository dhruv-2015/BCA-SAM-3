#include<stdio.h>
void main(){
    int n,m,sum=0,z;
    printf("enter number of an array:");
    scanf("%d",&n);
    printf("enter number of m:");
    scanf("%d",&m);
    printf("enter number of n:");
    scanf("%d",&z);
    int a[n];
    for(int i=0;i<n;i++){
        printf("enter number %d:",i+1);
        scanf("%d",&a[i]);
    }
    for(m;m<=z;m++){
        sum=sum+a[m-1];
        
    }
    printf("sum is: %d\n",sum);
}