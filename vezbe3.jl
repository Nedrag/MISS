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

#Primer 4

function primer4!(dx, x, p, t)
	m1, m2, k1, k2, k3, g, c = p
	dx[1] = x[2]
	dx[2] = (1/m1)*(k1*x[1] + m1*g -k2*(x[1] - x[3]) )
	dx[3] = x[4]
	dx[4] = (1/m2)*(k2*(x[1] - x[3]) -k3 * x[3] -c*x[4] - m2*g)
end

x0 = [2.0, 0.0,0.0, 0.0]
p = (5.0, 8.0, 20.0, 20.0, 20.0, 9.81, 10.0)
t = (0.0, 20.0)

prob = ODEProblem(primer4!, x0, t, p)
s = solve(prob)


#Brzine tela m1,m2
v1 = [x[2] for x in s.u]
v2 = [x[4] for x in s.u]

#Koordinate maksimalne brzine oba tela
-,index1 = findmax(abs.(v1))
-,index2 = findmax(abs.(v2))

plot(sol.t, [v1, v2])
#Brzina prvog u tacki <index1>
plot!([sol.t[index1]], [v1[index1]])

#Brzina drugog u tacki <index2>
plot!([sol.t[index2]], [v2[index2]])

#Zbog osobina sistema svodi se na obicno deljenje ( Ubrzzanje = promena brzine po vremenu)
a1 = diff(v1) ./ diff(sol.t)
a2 = diff(v2) ./ diff(sol.t)

plot(sol.t[1:end-1], [a1, a2])

#---ZADACI ZA VEZBU---
#Zadatak 1
#a) i b)
function f5(t)
	tp = rem.(t, 2)
	y1 = 5*tp .* ((tp .>= 0) .& (tp .< 1))
	y2 = -5*tp + 10 .* ((tp .>= 1) .& (tp .< 2))

	return y1 +y2
end

function primer5!(dx, x, t,p)
	m1, m2, k1, k2, c1, c2, c3 = p
	dx[1] = x[2]
	dx[2] = (1/m1)*(-c1*x[2] -k1*x[1] - k2*(x[3] - x[1])
	dx[3] = x[4]
	dx[4] = (1/m2) * (f5(t) - k2*(x[3] -x[1]) - x[4] * (c3 + c2))
end

x0 = [1.0, 0.0, 2.0, 0.0]
t = (0.0, 20.0)
p = (20.0, 10.0, 20.0, 40.0, 10.0, 10.0, 10.0)

prob = ODEProblem(primer5!, x0, t, p)
s = solve(prob)
#c)

#brzine 1. i 2. tela
v1 = [x[2] for x in s.u]
v2 = [x[4] for x in s.u]

#koordinate maksimalnih brzina prvog i drugog tela
-, index1 =  findmax(abs.(v1))
-, index2 =  findmax(abs.(v2))

plot(sol.t, [v1, v2])
plot!(sol.t[index1], v1[index1])
plot!(sol.t[index2], v2[index2])

#d)
#Vektor pomeraja u svakom trenutku simulacije
poz1 = [x[1] for x in sol.u]
poz2 = [x[3] for x in sol.u]
#Ukupan predjeni put
pp1 = sum(abs.(diff(poz1)))
pp2 = sum(abs.(diff(poz2)))

#Zadatak 2




















