// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
//
// Copyright (C) 2018 - 2018 - Scilab Enterprises
// Copyright (C) 2018 - 2018 - GSoC 2018 - Siddhartha Gairola
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

// This is the builder.sce
// must be run from this directory

// interface library name
ilib_name  = "libmex"

// objects files (but do not give mexfiles here)
files = [];

// other libs needed for linking (must be shared library names)
libs  = [];

// table of (scilab_name,interface-name or mexfile-name, type)
table =[    "amb_occ"        ,  "ambient_occlusion"         , "cmex";
            "bon_vis"        ,  "bone_visible"              , "cmex";
            "bon_vis_emb"    ,  "bone_visible_embree"       , "cmex";
            "col_sma_tri"    ,  "collapse_small_triangles"  , "cmex";
            "dec_lib"        ,  "decimate_libigl"           , "cmex";
            "elt"            ,  "eltopo"                    , "cmex";
            "fit_rot_mex"    ,  "fit_rotations_mex"         , "cmex";
            "imp"            ,  "impaste"                   , "cmex";
            "in_ele_aab"     ,  "in_element_aabb"           , "cmex";
            "mes_boo"        ,  "mesh_boolean"              , "cmex";
            "out_hul"        ,  "outer_hull"                , "cmex";
            "ray_mes_int"    ,  "ray_mesh_intersect"        , "cmex";
            "rea_MSH"        ,  "readMSH"                   , "cmex";
            "rea_mes_fro_xml",  "read_mesh_from_xml"        , "cmex";
            "rea_tri_mes"    ,  "read_triangle_mesh"        , "cmex";
            "reo_fac"        ,  "reorient_facets"           , "cmex";
            "seg_graph"      ,  "segment_graph"             , "cmex"; 
            "sig_dis"        ,  "signed_distance"           , "cmex"; 
            "sig_dis_iso"    ,  "signed_distance_isosurface", "cmex"; 
            "sim_pol"        ,  "simplify_polyhedron"       , "cmex"; 
            "sol_ang"        ,  "solid_angle"               , "cmex";
            "win_num"        ,  "winding_number"            , "cmex";
            "wir_mes"        ,  "wire_mesh"                 , "cmex";
 ];

no_of_files = size(table)(1)

if getos() <> "Windows" then
    if part(getenv("OSTYPE","no"),1:6)=="darwin" then
        cflags = ""
        fflags = "";
        ldflags= "";
        cc = "g++";
    else
        // Since linking is done by gcc and not g++
        // we must add the libstdc++ to cflags
        // an other possibility would be to use cflags="" and cc="
        cflags = " -lstdc++ -std=c++11 -I/home/sid/Gsoc17/eltopo/eltopo3d -I/usr/include/eigen3/ -I/usr/include/CGAL/ -I/home/sid/Gsoc17/demo_current_ongoing/mex_toolboxes/Geometry_Processing_Toolbox/includes/libigl/include -I/home/sid/Gsoc17/scilab_master/scilab/usr/include -I/home/sid/Gsoc17/scilab_master/scilab/modules/mexlib/mex_toolboxes/Geometry_Processing_Toolbox/src/cpp -I/usr/include -I/home/sid/Gsoc17/demo_current_ongoing/mex_toolboxes/Geometry_Processing_Toolbox/includes/libigl/external/embree/include"
        fflags = "";
        //ldflags= "-L/usr/lib/ -L/usr/lib/CGAL/";
        ldflags = "-L/home/sid/Gsoc17/demo_current_ongoing/mex_toolboxes/Geometry_Processing_Toolbox/includes/libigl/ -L/home/sid/Gsoc17/scilab_master/scilab/usr/include/Eigen/ -L/home/sid/Gsoc17/eltopo/eltopo3d/ -leltopo_release";
        cc="";
    end
else
    cflags = ""
    fflags = "";
    ldflags= "";
    cc = "";
end

// do not modify below
// ----------------------------------------------
ilib_mex_build(ilib_name,table(3,:),files,libs,"",ldflags,cflags,fflags)
