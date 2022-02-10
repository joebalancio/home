function dockerstart() {
  max_attempts=40
  current_attempts=0
  if ! docker ps &> /dev/null
  then
    echo -n "Start Docker (y/N): "
    read start_docker
    case "$start_docker" in
      [yY])
        echo "Starting Docker"
        open /Applications/Docker.app
        ;;
      *)
        return
        ;;
    esac  
  fi

  echo "Waiting for Docker"
  while ! docker ps &> /dev/null
  do
    if [ "$current_attempts" -lt "$max_attempts" ]
    then
      echo -n "."
      current_attempts=$((current_attempts+1))
      sleep 1
    else  
      echo "Max attempts waiting for Docker"
      return 1
    fi
  done
  echo ""

  npm run start:docker
}
