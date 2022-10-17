    #!/bin/bash

function saludo(){
    variable="$1"
    echo "hola ${variable}!"
}

saludo alex

echo $0
echo $1

saludo2() {
    echo "segundo saludo"
}

saludo2
