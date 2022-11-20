#DRUGI ZADATAK [ NACIN RESAVANJA (KOD) ]

1. Ukljuciti pakete Plots, DifferentialEquations (using Plots, DifferenitalEquation)
2. Napraviti funkciju pobudne sile (Ako postoji) [Obicno je neka prostoperiodicna f-ja ili zbir linearnih ]
3. Napisati sistem kao f-ju sa parametrima dx, x, t, p gde su dx[i] - i-ta dif. jednacina u sistemu x[i] - i-ta smena t - interval p - parametri
4. Numericko resenje dif. jednacine -> prob = ODEProblem ( <ime-func>, <pocetni-uslovi> , <interval> , <parametri> )
sol  = solve(prob)
5. Plotovanje -> Plot(sol)
