module Gaugefields

using Requires
include("./output/verboseprint.jl")
include("./SUN_generator.jl")
include("./autostaples/wilsonloops.jl")
include("./AbstractGaugefields.jl") 
include("./output/io.jl")
include("./output/ildg_format.jl")
include("./output/bridge_format.jl")
include("./autostaples/Loops.jl")
include("./smearing/Abstractsmearing.jl")
include("./heatbath/heatbathmodule.jl")
include("./scalarnn/ScalarNNs.jl")

function __init__()
    @require MPI = "da04e1cc-30fd-572f-bb4f-1f8673147195" begin   
        import .AbstractGaugefields_module:identityGaugefields_4D_wing_mpi,
                Gaugefields_4D_wing_mpi,calc_rank_and_indices,barrier,comm,
                setvalue!
    end
end

# Write your package code here.
import .AbstractGaugefields_module:AbstractGaugefields,IdentityGauges,RandomGauges,Oneinstanton,calculate_Plaquette,
                                    calculate_Polyakov_loop,map_U!,evaluate_gaugelinks_evenodd!,normalize!,normalize3!,normalizeN!,
                                    shift_U,evaluate_gaugelinks!
import .ILDG_format:ILDG,load_gaugefield!,save_binarydata
import .heatbath_module:SU2update_KP!,SUNupdate_matrix!,SU3update_matrix!,heatbath!,Heatbath
import .Bridge_format:save_textdata,load_BridgeText!
import Wilsonloop:loops_staple,Wilson_loop_set
import .Abstractsmearing_module:Gradientflow,flow!,STOUT_Layer,CovNeuralnet,calc_smearedU, construct_smearing
import .SUN_generator:Generator
import .Verbose_print:Verbose_level,Verbose_3,Verbose_2,Verbose_1,println_verbose3,println_verbose2,println_verbose1,
    print_verbose1,print_verbose2,print_verbose3

import Wilsonloops:Wilson_loop_set,make_staples,Wilson_loop_set,
            make_cloverloops,Tensor_derivative_set, make_loops,
            make_plaq_staple,make_links,make_plaq,
            make_loopforactions,make_plaqloops,make_rectloops,make_polyakovloops,
            make_plaq_staple_prime,
            calc_coordinate,make_plaq_staple_prime,calc_shift,
            Tensor_wilson_lines_set,Tensor_wilson_lines,Tensor_derivative_set,
            get_leftstartposition,get_rightstartposition,Wilson_loop,calc_loopset_μν_name,
            make_originalactions_fromloops

export IdentityGauges,RandomGauges,Oneinstanton,calculate_Plaquette,calculate_Polyakov_loop
export ILDG,load_gaugefield!,save_binarydata
export SU2update_KP!,SUNupdate_matrix!,SU3update_matrix!
export map_U!
export evaluate_gaugelinks_evenodd!,normalize!,normalize3!,normalizeN!
export loops_staple
export save_textdata,load_BridgeText!
export shift_U,evaluate_gaugelinks!,Gradientflow,flow!
export heatbath!,Heatbath
export STOUT_Layer,CovNeuralnet,calc_smearedU


end
