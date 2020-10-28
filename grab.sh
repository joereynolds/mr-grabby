grab() {
  #  Get the domain name from the user input
  domain=$(echo $1 | awk -F/ '{print $3}')

  # Grab the selector for that domain if there is one
  selector=$(recsel -e "Url = '$domain'" -P Selector sites.rec)

  # Use the selector if possible, falling back to body otherwise
  if [ -z "$selector" ]; then
      echo "Unable to find selector '$selector' for domain '$domain', using 'body'"
      selector='body'
  fi

  curl -s $1 | pup "$selector" | pandoc --from=html --to=markdown | glow - -p -s light -w 80
}

grab $1
