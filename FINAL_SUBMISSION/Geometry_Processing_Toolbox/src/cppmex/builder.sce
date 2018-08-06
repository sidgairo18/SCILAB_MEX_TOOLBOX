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
            "dec_cag"        ,  "decimate_cgal"             , "cmex";
            "dec_lib"        ,  "decimate_libigl"           , "cmex";
            "elt"            ,  "eltopo"                    , "cmex";
            "fit_rot_mex"    ,  "fit_rotations_mex"         , "cmex";
            "imp"            ,  "impaste"                   , "cmex";
            "in_ele_aab"     ,  "in_element_aabb"           , "cmex";
            "int_oth"        ,  "intersect_other"           , "cmex";
            "mes_boo"        ,  "mesh_boolean"              , "cmex";
            "out_hul"        ,  "outer_hull"                , "cmex";
            "poi_mes_squ_dis",  "point_mesh_squared_distance", "cmex";
            "ray_mes_int"    ,  "ray_mesh_intersect"        , "cmex";
            "rea_MSH"        ,  "readMSH"                   , "cmex";
            "rea_mes_fro_xml",  "read_mesh_from_xml"        , "cmex";
            "rea_tri_mes"    ,  "read_triangle_mesh"        , "cmex";
            "reo_fac"        ,  "reorient_facets"           , "cmex";
            "seg_graph"      ,  "segment_graph"             , "cmex"; 
            "sel_int"        ,  "self_intersect"             , "cmex"; 
            "sig_dis"        ,  "signed_distance"           , "cmex"; 
            "sig_dis_iso"    ,  "signed_distance_isosurface", "cmex"; 
            "sim_pol"        ,  "simplify_polyhedron"       , "cmex"; 
            "sli"            ,  "slim"                      , "cmex"; 
            "sna_rou"        ,  "snap_rounding"             , "cmex"; 
            "sol_ang"        ,  "solid_angle"               , "cmex";
            "tri_wit_sol"    ,  "trim_with_solid"           , "cmex";
            "win_num"        ,  "winding_number"            , "cmex";
            "wir_mes"        ,  "wire_mesh"                 , "cmex";
 ];

no_of_files = size(table)(1)

// This has only been tested on Linux. For windows 
// the builder will have to be modified accordingly.

// Assuming external dependencies - libigl, eltopo, embree
// CGAL are present in the includes directory.

// Assuming headers for eigen, boost, gmp and mpfr are 
// present in the /usr/include location.

// Update cflags and ldflags accordingly to the relative paths
// on your system.

// Current path
CURR_PATH = get_absolute_file_path("builder.sce");
CURR_INC = "-I"+CURR_PATH
USER_PATH = "/usr/"
USER_INC = "-I"+USER_PATH+"include/"

// Place scilab absolute path here.
// SCILAB_PATH = "path/to/scilab/"
SCILAB_PATH = "/home/sid/Gsoc17/scilab_master/scilab";
SCILAB_INC = "-I"+SCILAB_PATH+"usr/include/";
SCILAB_LIB = "-L"+SCILAB_PATH+"usr/lib/";

// Path for all external dependencies.
LIBIGL = CURR_PATH+"../../includes/libigl/";
//LIBIGL = "/home/sid/Gsoc17/demo_current_ongoing/mex_toolboxes/Geometry_Processing_Toolbox/includes/libigl/";
LIBIGL_LIB = "-L"+LIBIGL;
LIBIGL_INC = "-I"+LIBIGL+"include";

// BOOST = "path/to/boost/"
BOOST = USER_PATH+"include/boost/";
BOOST_INC = "-I"+BOOST;

// CGAL = CURR_PATH+"../../includes/CGAL/"
CGAL = "/home/sid/libs/CGAL-4.11.2/";
CGAL_LIB = "-L"+CGAL+" -L"+CGAL+"lib"+" -lCGAL";
CGAL_INC = "-I"+CGAL+"include";

// using the embree which is present in libigl.
EMBREE = LIBIGL+"external/embree/";
EMBREE_LIB = "-L"+EMBREE+"build/";
EMBREE_INC = "-I"+EMBREE+" -I"+EMBREE+"include";

//ELTOPO = CURR_PATH+"../../includes/eltopo/eltopo3d/";
ELTOPO = "/home/sid/Gsoc17/eltopo/eltopo3d"
ELTOPO_LIB = "-L"+ELTOPO+"libeltopo_release.a";
ELTOPO_INC = "-I"+ELTOPO;

// EIGEN = SCILAB_PATH+"usr/include/Eigen/"
// EIGEN = "/home/sid/Gsoc17/scilab_master/scilab/usr/include/Eigen/";
EIGEN = "/usr/include/eigen3/"
EIGEN_LIB = "-L"+EIGEN;
EIGEN_INC = "-I"+EIGEN;

// GMP = "path/to/GMP/"
GMP = "/home/sid/libs/gmp-6.1.2/";
GMP_INC = "-lgmp -lgmpxx"+" -I"+GMP;

// cflags, fflags, ldflags, cc
// Since linking is done by gcc and not g++, 
// we must add the libstdc++ to cflags.


cflags = " -std=c++11 -lstdc++"+" "+GMP_INC+" "+ELTOPO_INC+" "+CGAL_INC+" "+EIGEN_INC+" "+USER_INC+" "+LIBIGL_INC+" "+SCILAB_INC+" "+CURR_INC+" "+EMBREE_INC+" "+BOOST_INC;

fflags = "";

ldflags = LIBIGL_LIB+" "+EIGEN_LIB+" "+ELTOPO_LIB+" "+CGAL_LIB+" "+SCILAB_LIB+" "+EMBREE_LIB;

cc="";

// do not modify below
// ----------------------------------------------
ilib_mex_build(ilib_name,table,files,libs,"",ldflags,cflags,fflags);
