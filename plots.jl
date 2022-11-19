using Plots

#ZADACI ZA VEZBU 
#Primer 1

function primer1(t)
    tp = rem.(t, 5)
    y1 = 2*tp .* ((tp .>= 0) .& (tp .< 2))
    y2 = 2 .* ((tp .>= 2) .& (tp .< 4))

    # 2 = 4k + n
    # 0 = 5k + n
    # -2 = k
    # n = 10
    y3 = (-2*tp .+ 10) .* ((tp .>= 4) .& ( tp .< 5 ))
    return y1 + y2 +y3
end
t = 0:0.01:10

#plot(t, primer1(t))

#Primer 2
#NE znam
function primer2(t)
   tp = rem.(t, 2*PI) 


end

#Primer 3
function primer3(t)
    tp = rem.(t, 2)
    y1 = 4 .* ((tp .>= 0 ) .& (tp .< 1))
    y2 = 0 .* ((tp .>= 1) .& (tp .< 2))
    return y1 + y2
end
function primer3_1(t)
    tp = rem.(t, 2)
    y1 = 4*t/10 .* ((tp .>= 0) .& (tp .< 1)) 
    y2 = 0 .* ((tp .>= 1) .& (tp .< 2))

    return y1 + y2
end
# plot(t, primer3_1(t))
# plot!(t, primer3(t), linestyle = :dash)

#Primer 4
function primer4(t)
    tp = t
   
    y1 = (2*tp) .* ((tp .>= 0) .& (tp .< 0.5)) 
    y2 =(1) .* ((tp .>= 0.5) .& (tp .< 2.5))
    #0 = 3k + n
    #1 = 2.5k + n
    #n = -3k
    # 1 = -0.5k
    # k = -2 n = 6
    y3 =  ((-2)*tp  + 6) .* ((tp .>= 2.5) .& (tp .< 3.5)) 
    y4 = (-1) .* ((tp .>= 3.5) .& (tp .< 5.5))
    #0 = 6k + N
    #1 = 6.5k + n
    #n = -6k => k = -2 n = 12

    y5 = (2*tp + 12) .* ((tp .>= 5.5) .& (tp .< 6.5))
    y6 = 1 .* ((tp .>= 6.5) .& (tp .< 8.5))
    #0 = 9k +n 1 = 8.5k + n
    y7 = (-2* tp + 18)  .* ((tp .>= 0) .& (tp .< 0.5)) 
    return y1 + y2 + y3 + y4 + y5 + y6 +y7 
end
plot(t, 2*sin.(t))
plot!(primer4)