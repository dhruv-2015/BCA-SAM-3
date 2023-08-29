#include<stdio.h>
void main(){
	int n,pos,val;
	printf("enter array number:");
	scanf("%d",&n);
	int a[n];
	for(int i=0;i<n;i++){
		printf("enter number:%d\n",i+1);
		scanf("%d",&a[i]);
	}
	printf("enter pos:");
	scanf("%d",&pos);
	for(pos;pos<n;pos++){
		a[pos]=a[pos+1];
	}
	for(int i=0;i<n-1;i++){
		printf("%d\n",a[i]);
	}

}









