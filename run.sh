
#!/bin/sh

NAME='shiori'

start() {
    echo 'will start...'
    docker run -d --rm --name "${NAME}" -p 28080:8080 -v $(pwd)/storage:/srv/shiori radhifadlillah/shiori
}

stop() {
    echo 'will stop...'
    docker stop $(docker ps -a -q --filter "name=^/${NAME}$" --format="{{.ID}}")
}

status() {
    echo 'status:'
    docker ps -a --no-trunc --filter "name=^/${NAME}$"
}

select i in start stop status exit
do
    case $i in
        start) start ${@:1};;
        stop) stop ${@:1};;
        status) status ${@:1};;
        exit) exit;;
    esac
done

# username: shiori
# password: gopher
