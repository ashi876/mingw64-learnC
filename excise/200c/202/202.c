#include <stdio.h> 
int cnt,sum; 
int isPrime(int number) 
{ 
	int i,tag=1; 
	
	for(i=2;tag && i<=number / 2; i++) 
		if(number % i ==0) tag =0; 
		return tag; 
} 

void countValue() 
{int i; 
for(i=2;i<=90;i++) 
if(isPrime(i)&&isPrime(i+4)&&isPrime(i+10)) 
{cnt++;sum+=i;} 
} 

int main() 
{ 
	cnt=sum=0; 
	countValue(); 
	printf("���������������ĸ�����%d\n",cnt); 
	printf("���������������ĺ�ֵ��%d\n",sum); 
}