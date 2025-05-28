read -p "Enter a day: " day

case "$day" in
  Monday|monday)
    echo "Start of the work week."
    ;;
  Friday|friday)
    echo "End of the work week."
    ;;
  Saturday|Sunday|saturday|sunday)
    echo "Weekend!"
    ;;
  *)
    echo "Just another weekday."
    ;;
esac
