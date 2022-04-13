using Test
import R1CSConstraintSolver: solveWithTrustedFunctions

@testset "Unused Argument" begin
    @test solveWithTrustedFunctions("../example_r1cs/straightforward.r1cs", "Unused Argument", printRes=false)
end

@testset "Trivial Multiplication" begin
    @test solveWithTrustedFunctions("../example_r1cs/trivial_mult.r1cs", "*", printRes=false)
end

@testset "Big Mult" begin
    @test solveWithTrustedFunctions("../example_r1cs/bigmult86_3.r1cs", "bigmult(86,3)", printRes=false)
end

@testset "Poseidon" begin
    @test solveWithTrustedFunctions("../example_r1cs/poseidon.r1cs", "poseidon", printRes=false)
end

@testset "3x3 multiplexer" begin
    @test solveWithTrustedFunctions("../example_r1cs/multiplexer_33.r1cs", "multiplexer(3,3)", printRes=false)
end

@testset "TornadoCash circuits" begin
    @test solveWithTrustedFunctions("../tornadocash_circuits/commitHasher.r1cs", "CommitmentHasher", trusted_r1cs=["../tornadocash_circuits/Pedersen248@pedersen.r1cs", "../tornadocash_circuits/Pedersen496@pedersen.r1cs"], trusted_r1cs_names=["Pedersen248", "Pedersen496"], printRes=false)
    @test solveWithTrustedFunctions("../tornadocash_circuits/merkleTree.r1cs", "MerkleTreeChecker", printRes=false)
end

@testset "TornadoCash withdraw circuits" begin
    @test solveWithTrustedFunctions("../tornadocash_circuits/withdraw.r1cs", "Withdraw", trusted_r1cs=["../tornadocash_circuits/Pedersen248@pedersen.r1cs", "../tornadocash_circuits/Pedersen496@pedersen.r1cs"], trusted_r1cs_names=["Pedersen248", "Pedersen496"], printRes=false)
end


@testset "secpAddUnequal given BigMultModP, BigLessThan" begin
    @test solveWithTrustedFunctions("../example_r1cs/secp256k1.r1cs", "secpAddUnequal", trusted_r1cs=["../example_r1cs/bigmultmodp.r1cs", "../example_r1cs/biglessthan.r1cs"], trusted_r1cs_names=["BigMultModP", "BigLessThan"], printRes=false)
end


