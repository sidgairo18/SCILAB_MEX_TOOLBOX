#include <wchar.h>
#include "libmex.hxx"
extern "C"
{
#include "libmex.h"
#include "addfunction.h"
}

#define MODULE_NAME L"libmex"

int libmex(wchar_t* _pwstFuncName)
{
    if(wcscmp(_pwstFuncName, L"amb_occ") == 0){ addMexFunction(L"amb_occ", &mex_ambient_occlusion, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"bon_vis") == 0){ addMexFunction(L"bon_vis", &mex_bone_visible, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"bon_vis_emb") == 0){ addMexFunction(L"bon_vis_emb", &mex_bone_visible_embree, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"col_sma_tri") == 0){ addMexFunction(L"col_sma_tri", &mex_collapse_small_triangles, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dec_cag") == 0){ addMexFunction(L"dec_cag", &mex_decimate_cgal, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dec_lib") == 0){ addMexFunction(L"dec_lib", &mex_decimate_libigl, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"elt") == 0){ addMexFunction(L"elt", &mex_eltopo, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"fit_rot_mex") == 0){ addMexFunction(L"fit_rot_mex", &mex_fit_rotations_mex, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"imp") == 0){ addMexFunction(L"imp", &mex_impaste, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"in_ele_aab") == 0){ addMexFunction(L"in_ele_aab", &mex_in_element_aabb, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"int_oth") == 0){ addMexFunction(L"int_oth", &mex_intersect_other, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"mes_boo") == 0){ addMexFunction(L"mes_boo", &mex_mesh_boolean, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"out_hul") == 0){ addMexFunction(L"out_hul", &mex_outer_hull, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"poi_mes_squ_dis") == 0){ addMexFunction(L"poi_mes_squ_dis", &mex_point_mesh_squared_distance, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"ray_mes_int") == 0){ addMexFunction(L"ray_mes_int", &mex_ray_mesh_intersect, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"rea_MSH") == 0){ addMexFunction(L"rea_MSH", &mex_readMSH, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"rea_mes_fro_xml") == 0){ addMexFunction(L"rea_mes_fro_xml", &mex_read_mesh_from_xml, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"rea_tri_mes") == 0){ addMexFunction(L"rea_tri_mes", &mex_read_triangle_mesh, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"reo_fac") == 0){ addMexFunction(L"reo_fac", &mex_reorient_facets, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"seg_graph") == 0){ addMexFunction(L"seg_graph", &mex_segment_graph, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"sel_int") == 0){ addMexFunction(L"sel_int", &mex_self_intersect, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"sig_dis") == 0){ addMexFunction(L"sig_dis", &mex_signed_distance, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"sig_dis_iso") == 0){ addMexFunction(L"sig_dis_iso", &mex_signed_distance_isosurface, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"sim_pol") == 0){ addMexFunction(L"sim_pol", &mex_simplify_polyhedron, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"sli") == 0){ addMexFunction(L"sli", &mex_slim, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"sna_rou") == 0){ addMexFunction(L"sna_rou", &mex_snap_rounding, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"sol_ang") == 0){ addMexFunction(L"sol_ang", &mex_solid_angle, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"tri_wit_sol") == 0){ addMexFunction(L"tri_wit_sol", &mex_trim_with_solid, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"win_num") == 0){ addMexFunction(L"win_num", &mex_winding_number, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wir_mes") == 0){ addMexFunction(L"wir_mes", &mex_wire_mesh, MODULE_NAME); }

    return 1;
}
