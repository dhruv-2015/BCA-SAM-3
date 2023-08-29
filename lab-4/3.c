#include<stdio.h>
void main(){
    int n,m,sum=0,avg=0;
    printf("enter number of an array:");
    scanf("%d",&n);
    int a[n];
    for(int i=0;i<n;i++){
        printf("enter number %d:",i+1);
        scanf("%d",&a[i]);
        sum=sum+a[i];
    }
    avg=sum/n;
    printf("average is :  %d",avg);
}