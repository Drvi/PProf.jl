using Test
using Profile

Profile.init()

@testset "PProf.jl" begin
    include("PProf.jl")
end

@testset "flamegraphs.jl" begin
    include("flamegraphs.jl")
end

@static if isdefined(Profile, :Allocs)  # PR https://github.com/JuliaLang/julia/pull/42768
    @testset "Allocs.jl" begin
        include("Allocs.jl")
    end

    @testset "Regression tests" begin
        include("golden/regression_test.jl")
    end
end
