#include<stdio.h>
void main(){
    int n;
    printf("enter number of an array:");
    scanf("%d",&n);
    int a[n];
    for(int i=0;i<n;i++){
        printf("enter number %d:",i+1);
        scanf("%d",&a[i]);
    }
    for(int i=0;i<n;i++){
        printf(" %d number is: %d\n",i+1,a[i]);
    }
}