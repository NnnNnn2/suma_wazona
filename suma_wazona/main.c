#include <stdio.h>

float* single_neuron(double* x, float* w, unsigned int n);

int main()
{
	unsigned int n = 10;
	double* x;
	float* w;
	x = malloc(sizeof(double) * n);
	w = malloc(sizeof(float) * (n + 1));
	/*
	w[0] = 1.0;
	for (int i = 0; i < n; i++)
	{
		x[i] = i + 1.0;
		w[i+1] = 1.0;
	}
	*/
	printf("n: ");
	scanf_s("%d", &n);
	printf("x[]: ");
	for (int i = 0; i < n; i++)
		scanf_s("%lf", &x[i]);
	printf("w[]: ");
	for (int i = 0; i <= n; i++)
		scanf_s("%f", &w[i]);
	float* wynik = single_neuron(x, w, n);
	printf("%f", *wynik);
	return 0;
}