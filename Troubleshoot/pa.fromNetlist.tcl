
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Troubleshoot -dir "/mnt/b/papilio-one-projects/Troubleshoot/Troubleshoot/planAhead_run_3" -part xc3s500evq100-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/mnt/b/papilio-one-projects/Troubleshoot/Troubleshoot/TEST_LED.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/mnt/b/papilio-one-projects/Troubleshoot/Troubleshoot} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "TEST_LED.ucf" [current_fileset -constrset]
add_files [list {TEST_LED.ucf}] -fileset [get_property constrset [current_run]]
link_design
