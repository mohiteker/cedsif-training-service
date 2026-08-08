#!/bin/bash
# created shifu@mohitek.net

#TODO use sed (oengine.conf) to load dynamic path
#remove actually posts
post_path="${OE_PORTAL_HOME}/_posts/"

#rm -f $post_path/*.md

#updating postHeader
f_post=$(echo "${OE_PORTAL_HOME}/_posts/${service_created_date}-${task_name}.md" | tr -d '\n')
#
#cat <<EOF > $f_post #../_posts/"`date +%Y-%m-%d`-${task_name}".md
cat <<EOF > "$f_post" #../_posts/"${f_post}-${task_name}".md
# Warning:>
#  This file was automatic generated. If you want to change something
#  use the appropieted forms. Any modification to this file will be automatic
#  restored in seconds.
---
layout: main
details:
 service:
   id:  ${service_id}
   name: ${service_name}
 task:
   id: ${task_id}
   name: ${task_name}
 node:
   id: ${node_id}
   name: ${node_name}
 network:
   id: ${net_id}
   name: ${net_name}
 volume:
   id: ${vol_id}
   path:  ${vol_path}
   type: ${vol_type}
mode: "mohitek-trainingLab"
---
EOF

# print files
tree ${OE_PORTAL_HOME}/_posts
