using Plots, DifferentialEquations

#---URADJENI PRIMERI---
#Primer 1
function f(t)
	return sin(t)
end
function primer1!(dx, x, p, t)
	#Koeficijenti
	c1, c2, k, m = p

	#Smene
	dx[1] = x[2]
	dx[2] = (1/m)*(f(t) - x[2]*(c1 + c2) - k*x[1])
end

#Zadavanje parametara i pocetnih uslova

t = (0.0, 10.0)
p = (20.0, 20.0, 40.0, 10.0)
x0 = [0.0, 0.0]

#Resavanje Dif jednacina

prob = ODEProblem(primer1!, x0, t, p)
s = solve(prob)

#Plotovanje
p = plot(s)
gui(p)

#Primer 2
function f1(t)
	return cos(t)
end

function primer2!(dx, x, p, t)
	m, c, k ,g = p
	dx[1] = x[2]
	dx[2] = (1/m)*(m*g + f1(t) - c*x[2] - k*x[1])
end

x0 = [0.0, 0.0]
t = (0.0, 20.0)
p = (5.0, 10.0, 20.0, 9.81)

prob = ODEProblem(primer2!, x0, t , p)
s = solve(prob)

plot(s)

#Primer 3
function f3(t)
	tp = rem.(t, 5)
	y1= 4*tp .* ((tp .>= 0 ) .& (tp .< 1))
	y2= 4 .* ((tp .>= 1) .& (tp .< 2))
	y3 = -2*tp + 8 .* ((tp .>= 2) .& (tp .< 3))
	y4 = 2 .* ((tp .>= 3) .& (tp .< 4))
	y5 = -2*tp + 10 .* ((tp .>= 4) .& (tp .< 5))
	return y1 + y2 + y3 + y4 +y5
end


function primer3!(dx, x, p, t)
	m1, m2, c1, c2, c3, k1, k2, = p

	dx[1] = x[2]
	dx[2] = (1/m1)*(c1*(x[4] - x[2]) + f3(t) - k1*x[1])
	dx[3] = x[4]
	dx[4] = (1/m2)*(-c2*(2*x[4] - x[2]) - k2*x[3] - c3*x[4])
end

#Parametri i pocetna stanja
x0 = [0.0, 0.0, 0.0, 0.0]
t = (0.0, 10.0)
p = (10.0, 15.0, 20.0, 20.0, 20.0, 40.0,40.0)

prob = ODEProblem(primer3!, x0, t,p)
sol = solve(prob)

#Koordinate pozicije prvog i drugog tela
poz1 = [x[1] for x in sol.u]
poz2 = [x[3] for x in sol.u]

#Indeks makimalnih pozicija(Kad je telo najudaljenije)
~, index1 = findmax(abs.(poz1))
~, index2 = findmax(abs.(poz2))

plot(sol.t, [poz1, poz2])
plot!([sol.t[index1]], [poz1[index1]])
plot!([sol.t[index2]], [poz2[index2]])

put1 = sum(abs.(diff(poz1)))
put2 = sum(abs.(diff(poz2)))
println(put1)
println(put2)















