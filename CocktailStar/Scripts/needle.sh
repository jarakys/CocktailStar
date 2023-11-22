if [[ ! $PATH =~ /opt/homebrew/bin: ]] ; then
PATH=/opt/homebrew/bin/:/opt/homebrew/sbin:${PATH}
fi
if which needle > /dev/null; then
  export SOURCEKIT_LOGGING=0 && needle generate "$SRCROOT/CocktailStar/Common/Generated/NeedleGenerated.swift" "$SRCROOT/$TARGETNAME"
else
  echo "error: needle generator is'nt installed, install via brew install needle"
fi

