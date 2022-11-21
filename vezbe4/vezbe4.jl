#MEHANICKI ROTACIONI SISTEMI 

#Zadaci za vezbu
#Zadatak 1
using Plots, DifferentialEquations


function f1(t)
	tp = rem.(t, 8)
	y1 = min(sin(tp) , 0.5) .* ((tp .>= 0) .& (tp .< 4))
	return y1
end

function primer1!(dx, x, p, t)
	m1, m2, c, k1, k2, R = p
	J = (m1*R*R)/2
	dx[1] = x[2]
	dx[2] = (1/m2) * (f1(t) - k2 * (x[1] + R* x[3])) 
	dx[3] = x[4]
	dx[4] = (1/J) * (- c* R * R * x[4] - k1 * x[3] - k2* R* (x[1] + R * x[3]))

end

x0 = [0.0,0.0,0.0,2.0]
t = (0.0 , 20.0)
p = (10.0, 5.0, 10.0, 10.0, 15.0, 1.0)


prob = ODEProblem(primer1!, x0, t, p)
sol = solve(prob)

dir = dirname(@__FILE__()) 
savefig(plot(sol), "$dir/zad01.png")



