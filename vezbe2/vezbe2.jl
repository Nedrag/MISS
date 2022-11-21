

# using Plots
# using DifferentialEquations


A = [1 4 -2 9 6; -1 0 0 3 7; 99 3 -3 4 7; 5 -6 0 -8 3; 1 2 3 4 5]
#primer 1
p = A[3]
#primer 2
p = A[3, 1]
#primer 3
m = zeros.(5,5)
m[3, 1] = 1.0
m_l = convert.(Bool, m)
p = A[m_l]
#primer 4
vrsta = A[1 ,: ]
#primer 5
kolona = A[:, end]
#primer 6 
nep_vrste = A[1:2:end, :]
#primer 7
poz = A[A .> 0]
#primer 8 
opseg = A[(A .> -5) .& (A .< 5)]
#primer 9 
maxel = maximum(A)

using LinearAlgebra
#primer 10
a_rev = reverse(A, dims = 2)
sd = diag(a_rev)
#primer 11
parni = A[rem.(A, 2) .== 0]
#primer 12
suma = sum(A, dims=2)
max_el = maximum(suma)
vrste = findall(suma .== max_el)

#---Slozeniji primeri---
#primer 1
using Statistics
function primer1(A)
    s = mean(A[end, :])
    gd = diag(A)
    v = gd[gd .> 0]

    return s, v
end

primer1(A)
#primer 2
function primer2(A)
    maks  = maximum(A)
    vrsta_kolona = findall(maks .== A[:, :])

    return maks, vrsta_kolona

end

primer2(A)
#primer 3
function primer3(A)
    suma = 0
    for i =2:length(A)
        suma = sum(A[1:i])
    end
    return (suma)

end
primer3(A)
#primer 4
T = ["Ime" "Pol" "Starost" "Tezina" "Visina";
"Ana" "z" 20 46 160;
"Bojan" "m" 24 52 165;
"Vlada" "m" 24 95 195;
"Gordana" "z" 30 57 160;
"Dejan" "m" 36 84 185;
"Zoran" "m" 22 80 180]

    podaci = T[2:end, 3:end]
    maks_tezina = maximum(podaci[:,2 ])
    poz = findall(maks_tezina .== podaci[:, 2])
    ime = T[poz .+ 1, 1 ][1]
    println("osoba sa najvecom tezinom je ", ime ,"(", maks_tezina, " kg)" )

#--- Slozeni NE URADJENI ---
#primer 1
    function primer5(A)
        rd = reverse(A)
        return mean(triu(rd,1))
    end
    
    primer5(A)
#NE znam sta je ovo
    p = A[:, 2:2:end]
    p = A[(rem.(A, 9) .== 0) .& (A .!= 0)]

    p = A[2:2:end, 2:2:end]
#primer 2
    function primer6(A)
        

        
        s3 = sum(A[1:2:end, 1:2:end])
        s4 = sum(A[2:2:end, 2:2:end])


        
        
        return s3 + s4
    end

    v = [0 2 0 3 3;
         0 3 0 3 3;
         1 1 1 3 3;
         1 1 1 3 3;
         1 2 3 4 5]
    primer6(v)

#primer 3
    function  primer7(A, B)
        m = tril(A)
        m1 = m[(m .> 0) .& (rem.(m, 3) .== 0)]
        
        sva = mean(diag(reverse(A)))
        svb = diag(reverse(B))
        s = svb[sva .< svb]

        

        return  m1 , s
    end

    primer7(A, v)
#primer 5





    


