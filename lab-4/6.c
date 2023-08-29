#include<stdio.h>
void main(){
	int n,a[n],b[n+1],pos,val;
	printf("enter number of an array");
	scanf("%d",&n);
	for(int i=0;i<n;i++){
        printf("enter number %d:",i+1);
        scanf("%d",&a[i]);
    }
	printf("enter pos");
	scanf("%d",&pos);
	printf("enter value");
	scanf("%d",&val);
	for(int i=n-1;i>=0;i--){
		if(i==pos){
			b[i]=val;
		}
		else{
			b[i+1]=a[i];
		}
	}
	for(int i=0;i<n+1;i++){
        printf("%d",b[i]);
    }
}