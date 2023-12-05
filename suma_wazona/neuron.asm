.686
.model flat
public _single_neuron
.data
	mnoz1 dd 8
	mnoz2 dd 4
	wynik dw 0
	zero  dw 0.0
.code
_single_neuron PROC
	push ebp					;prolog
	mov ebp, esp
 
	push ebx
	push esi
 
	mov esi, [ebp+8]			;adres tablicy x
	mov ebx, [ebp+12]			;adres tablicy w
	mov ecx, [ebp+16]			;n
 
	finit
	jecxz koniec				;sprawdzanie czy ecx == 0
	dec ecx					
	petla:
		mov eax, ecx		
		mul mnoz1
		add eax, esi			;eax ma adres obecnie sprawdzanego x
		fld QWORD PTR [eax]
 
		mov eax, ecx
		mul mnoz2
		add eax, ebx
		add eax, mnoz2			;w jest o 1 wiecej niz x a w[0] jest waga nieprzypisana zadnemu x
		fld DWORD PTR [eax]		;adres obecnie sprawdzanego w
 
		fmulp					;mnozenie x przez w
		fld DWORD PTR wynik		;wczytuje wynik z pammieci
		faddp					;dodaje do wyniku
		fstp DWORD PTR wynik	;wpisuje wynik do pamieci
 
	loop petla
		fld DWORD PTR wynik		;wczytuje wynik
		fld DWORD PTR [ebx]		;wczytuje w[0]
		faddp					;dodaje w[0] do sumy
		fcom DWORD PTR zero		;porownoje go z zerem
		fstsw ax
		sahf
		jnb koniec				;jesli >= 0 wypisze wynik
			mov eax, offset zero
			jmp wyjscie
 
	koniec:
		mov eax, offset wynik
 
		wyjscie:
			pop esi
			pop ebx
 
			pop ebp
			ret
_single_neuron ENDP
END