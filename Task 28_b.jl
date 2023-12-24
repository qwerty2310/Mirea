function memoize_fibonacci(n::Integer)
    dict = Dict{Int,Int}()
    function fib_recurs(n)
        if n in (0,1)
            return 1
        end
        if n-2 ∉ dict.keys
            f_prevprev = fib_recurs(n-2)
        else
            f_prevpre = dict[n-2]
        end
        if n-1 ∉ dict.keys
            f_prev = fib_recurs(n-1)
        else
            f_prev = dict[n-1]
        end
        return f_prevprev + f_prev
    end
    return fib_recurs(n)
end

print(memoize_fibonacci(7))