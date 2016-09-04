#/bin/sh
ed $1 <<EOF
1i
\$the_cow = <<EOC;
    \$thoughts
     \$thoughts
.
\$a
EOC
.
w
q
EOF
