#!/bin/bash

GRINDER_MODE=${GRINDER_MODE:-standalone}

if [[ "$GRINDER_MODE" = "console" ]]; then
    GRINDER_OPTS="$GRINDER_OPTS -Dgrinder.console.httpHost=0.0.0.0 net.grinder.Console -headless"
elif [[ "$GRINDER_MODE" = "agent" ]]; then
    GRINDER_OPTS="$GRINDER_OPTS -Dgrinder.useConsole=true -Dgrinder.consoleHost=$GRINDER_CONSOLE_HOST net.grinder.Grinder"
elif [[ "$GRINDER_MODE" = "standalone" ]]; then
    GRINDER_OPTS="$GRINDER_OPTS -Dgrinder.useConsole=false net.grinder.Grinder"
fi

java $GRINDER_OPTS
