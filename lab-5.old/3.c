
#include<stdio.h>
int main(){
    int n,small,pos,val;
    printf("enter n:");
    scanf("%d",&n);
    int a[n+1];
    for(int i=0;i<n;i++){
          printf("enter n:");
    scanf("%d",&a[i]);
    }
    printf("enter value:");
    scanf("%d",&val);
    a[n+1]=val;
    small=a[0];
     for(int i=1;i<=n+1;i++){
         if(a[0]>a[i]){
            a[0]=a[i];
         }
    }
    for(int i=0;i<=n;i++){
        printf("%d\n",a[i]);
    }
    return 0;
    
}