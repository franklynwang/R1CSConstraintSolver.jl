using BenchmarkTools
import R1CSConstraintSolver: abstraction, readR1CS


macro run_bench(name, expr, args...)
    quote
        printstyled("Benchmark: ", $name, "\n"; color=:yellow)
        display(@benchmark esc($expr) $(args...))
        println("\n\n")
    end
end

equations_main, knowns_main, outs_main, _ = readR1CS("example_r1cs/bigmultmodp86_3.r1cs")
equations_trusted, knowns_trusted, outs_trusted, _ = readR1CS("example_r1cs/bigmultshortlong86_3.r1cs")
@run_bench "Big Mult Mod P Abstraction Benchmark" begin
    special, non_special = abstraction("bigmultmodp", equations_main, knowns_trusted, equations_trusted, outs_trusted)
    @assert length(special) == 1
end

equations_main, knowns_main, outs_main, _ = readR1CS("example_r1cs/ecdsa.r1cs")
equations_trusted, knowns_trusted, outs_trusted, _ = readR1CS("example_r1cs/secp256k1.r1cs")
@run_bench "ECDSA Abstraction Benchmark" begin
    special, non_special = abstraction("secp256k1", equations_main, knowns_trusted, equations_trusted, outs_trusted)
    @assert length(special) >= 1
end



