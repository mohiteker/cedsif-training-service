#!/bin/sh
# created by shifu@training.net

projects=(
    training23XXsoftwaredevelopment-grupo-x-lab                                    
    training24XXcockpit-grupo-x-lab                                                
    training24XXdocker4j-grupo-x-lab                                               
    training24XXdocumentation-platforms-grupo-x-lab                                
    training24XXedb-postgres-lab                                                   
    training24XXessential-grupo-x-git-lab                                          
    training24XXessential-grupo-x-maven-lab                                        
    training24XXgiraph-grupo-x-lab                                                 
    training24XXlxc-grupo-x-lab                                                    
    training24XXmediawiki-grupo-x-lab                                              
    training24XXodamoz                                                             
    training24XXopenedx-grupo-x-lab                                                
    training24XXsoftwaredevelopment-grupo-x-lab
) 

# loop over project
for project in ${projects[@]}
do
        echo "compressing=["$project.tar"]"
        sudo tar cvfj $project.tar.tbz $project
done
